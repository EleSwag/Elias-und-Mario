
function save_spato(g, filename, title, proj)
% SAVE_SPATO(G, FILENAME, TITLE, PROJ) saves the network G as a SPaTo Document
%
% Example usage:
%   save_spato(g, '/path/to/file.spato', 'My Network');
%
% The network structure must be in the format returned by load_wg_network
% or load_aviation_network, with G.N being the number of nodes in the network
% and G.w the N-by-N weight matrix.
%
% To provide a meaningful map view in SPaTo, G.nodes.poslong and G.nodes.poslat
% should each be an N-by-1 vector containing the longitude/X- and
% latitude/Y-coordinate, respectively.
%
% Node names (displayed in the lower right corner of SPaTo) will be saved
% if G.nodes.name is an N-by-1 cell array of strings.
%
% Node labels (displayed next to the node in SPaTo) will be "Node %d" by default.
% If G.nodes.lid is an N-by-1 cell array of strings or if G.nodes.id is an N-by-1
% vector, its values are used instead.
%
% If G.pred exists, the shortest-path trees encoded by it will be saved.
% Otherwise, SPaTo will compute shortest-path trees.  G.pred(i,j) is the
% predecessor of node j in the shortest path from i to j.
%
% If G.D and/or G.SPTD exist, they will be saved as shortest-path distance
% and shortest-path-tree dissimilarity matrices, respectively.
%
% Various quantities in G.nodes might be saved as node property vectors.
%
% The TITLE parameter is the name of the network displayed in the network
% detail panel in SPaTo.
%
% The (optional) PROJ parameter specifies the geographic projection to use
% (use 'Albers' for the continents, 'LonLat Roll' for full-world maps, and
% 'LonLat' for intermediate (large parts of the world) or small-scale
% maps, e.g. cities).  If omitted, 'LonLat' is used.
 
    if (nargin < 4); proj = 'LonLat'; end
    useBlobs = false;
    compress = false;
    fprintf(['### Writing SPaTo document to ' filename ' (blobs=' num2str(useBlobs) ', compress=' num2str(compress) ') ...\']);
 
    if ((length(filename) < 6) || ~strcmp(filename(end-5:end), '.spato')); filename = [filename '.spato']; end
 
    dir = filename;
    if (compress); dir = [dir '_tmp']; end
    system(['rm -rf "' dir '"']);
    if (compress); system(['rm -rf "' filename '"']); end
    system(['mkdir -p "' dir '"']);
    if (useBlobs); system(['mkdir -p "' dir '/blobs"']); end
 
    % write document.xml
    f = fopen([dir '/document.xml'], 'w');
    fprintf(f, '<?xml version="1.0" ?>\');
    fprintf(f, '<document>\');
    fprintf(f, '  <title>%s</title>\', title);
    if (isfield(g, 'meta'))
        fprintf(f, '  <description>\');
        for i=1:length(g.meta); fprintf(f, '    %s\', char(g.meta{i})); end; clear i
        fprintf(f, '  </description>\');
    end
    fprintf(f, '  <nodes src="nodes.xml" />\');
    srcattr = ''; if (~useBlobs); srcattr = ' src="links.xml"'; end
    blobattr = ''; if (useBlobs); blobattr = ' blob="links"'; end
    fprintf(f, '  <links%s%s />\', srcattr, blobattr);
    if (isfield(g, 'pred'));
        srcattr = ''; if (~useBlobs); srcattr = ' src="spt.xml"'; end
        blobattr = ''; if (useBlobs); blobattr = ' blob="spt"'; end
        fprintf(f, '  <slices name="SPT"%s%s />\', srcattr, blobattr);
    end
    if (isfield(g, 'nodes') && any(isfield(g.nodes, { 'k', 'w', 'bc', 'c' })))
      fprintf(f, '  <dataset src="nodeprops.xml" selected="true" />\'); end
    if (isfield(g, 'D') || isfield(g, 'SPTD')); fprintf(f, '  <dataset src="dist.xml" />\'); end
    fprintf(f, '</document>\');
    fclose(f);
 
    % write nodes.xml
    f = fopen([dir '/nodes.xml'], 'w');
    fprintf(f, '<?xml version="1.0" ?>\');
    fprintf(f, '<nodes>\');
    fprintf(f, '  <projection name="%s" />\', proj);
    for i=1:g.N
        id = num2str(i); name = ['Node ' id];
        location = sprintf('%g,%g', rand(1), rand(1)); strength = full(sum(g.w(i,:)));
        if (isfield(g, 'nodes'))
            if (isfield(g.nodes, 'name')); name = g.nodes.name{i}; end
            if (isfield(g.nodes, 'lid')); id = g.nodes.lid{i};
            elseif (isfield(g.nodes, 'id')); id = g.nodes.id(i); if (isnumeric(id)); id = num2str(id); end; end
            if (isfield(g.nodes, 'poslong') && isfield(g.nodes, 'poslat'))
                location = sprintf('%g,%g', g.nodes.poslong(i), g.nodes.poslat(i)); end
        end
        fprintf(f, '  <node id="%s" name="%s" location="%s" strength="%g" />\', ...
            xmlencode(id, true), xmlencode(name, true), location, strength);
    end; clear i
    fprintf(f, '</nodes>\');
    fclose(f);
 
    % write links.xml
    if (useBlobs)
        writeSparseMatrixBlob('links', g.w);
    else
        f = fopen([dir '/links.xml'], 'w');
        fprintf(f, '<?xml version="1.0" ?>\');
        fprintf(f, '<links>\');
        for i=1:g.N
            fprintf(f, '  <source index="%d">\', i);
            I = find(g.w(i,:));
            for j=I
                fprintf(f, '    <target index="%d" weight="%g" />\', j, full(g.w(i,j)));
            end; clear j I
            fprintf(f, '  </source>\');
        end; clear i
        fprintf(f, '</links>\');
        fclose(f);
    end
 
    % write spt.xml
    if (isfield(g, 'pred'))
        fprintf('SPT: '); tic
        if (useBlobs)
            writeMatrixBlob('spt', 'int', g.pred - 1);
        else
            f = fopen([dir '/spt.xml'], 'w');
            fprintf(f, '<?xml version="1.0" ?>\');
            fprintf(f, '<slices name="SPT">\');
            writeMatrixXML(f, 'slice', g.pred);
            fprintf(f, '</slices>\');
            fclose(f);
        end
        fprintf(' - %.3f secs\', toc);
    end
 
    % write nodeprops.xml
    if (isfield(g, 'nodes') && any(isfield(g.nodes, { 'k', 'w', 'bc', 'wbc', 'c', 'wc', 'd', 'o', 'kk', 'kkw', 'ww', 'www' })))
        f = fopen([dir '/nodeprops.xml'], 'w');
        fprintf(f, '<?xml version="1.0" ?>\');
        fprintf(f, '<dataset name="Node Properties">\');
        if (isfield(g.nodes, 'k')); writeData(f, 'Node Degree', g.nodes.k, '', 'true'); end
        if (isfield(g.nodes, 'w')); writeData(f, 'Node Strength', g.nodes.w, ' selected="true"', 'true'); end
        if (isfield(g.nodes, 'bc')); writeData(f, 'Betweenness Centrality (topology)', g.nodes.bc, '', 'true'); end
        if (isfield(g.nodes, 'wbc')); writeData(f, 'Betweenness Centrality (weighted)', g.nodes.wbc, '', 'true'); end
        if (isfield(g.nodes, 'c')); writeData(f, 'Clustering coefficient (unweighted)', g.nodes.c, '', 'false'); end
        if (isfield(g.nodes, 'wc')); writeData(f, 'Clustering coefficient (weighted)', g.nodes.wc, '', 'true'); end
        if (isfield(g.nodes, 'd')); writeData(f, 'Distance strength', g.nodes.d, '', 'true'); end
        if (isfield(g.nodes, 'o')); writeData(f, 'Outreach', g.nodes.o, '', 'true'); end
        if (isfield(g.nodes, 'kk')); writeData(f, 'Next-neighbor degree (unweighted)', g.nodes.kk, '', 'true'); end
        if (isfield(g.nodes, 'kkw')); writeData(f, 'Next-neighbor degree (weighted)', g.nodes.kkw, '', 'true'); end
        if (isfield(g.nodes, 'ww')); writeData(f, 'Next-neighbor strength (unweighted)', g.nodes.ww, '', 'true'); end
        if (isfield(g.nodes, 'www')); writeData(f, 'Next-neighbor strength (weighted)', g.nodes.www, '', 'true'); end
        fprintf(f, '</dataset>\');
        fclose(f);
    end
 
    % write dist.xml
    if (isfield(g, 'D') || isfield(g, 'SPTD'))
        f = fopen([dir '/dist.xml'], 'w');
        fprintf(f, '<?xml version="1.0" ?>\');
        fprintf(f, '<dataset name="Distance Measures">\');
        if (isfield(g, 'D'))
            fprintf('SPD: '); tic
            blobattr = ''; if (useBlobs); blobattr = ' blob="dist_spd"'; end
            fprintf(f, '  <data name="SPD"%s distmat="true">\', blobattr);
            fprintf(f, '    <colormap log="true" minval="%g" maxval="%g" />\', min(nonzeros(g.D)), max(nonzeros(g.D)));
            if (useBlobs); writeMatrixBlob('dist_spd', 'float', g.D); else writeMatrixXML(f, 'values', g.D); end
            fprintf(f, '  </data>\');
            fprintf(' - %.3f secs\', toc);
        end
        if (isfield(g, 'SPTD'))
            fprintf('SPTD: '); tic
            blobattr = ''; if (useBlobs); blobattr = ' blob="dist_sptd"'; end
            fprintf(f, '  <data name="SPTD"%s>\', blobattr);
            fprintf(f, '    <colormap minval="%g" maxval="%g" />\', min(nonzeros(g.SPTD)), max(nonzeros(g.SPTD)));
            if (useBlobs); writeMatrixBlob('dist_sptd', 'float', g.SPTD); else writeMatrixXML(f, 'values', g.D); end
            fprintf(f, '  </data>\');
            fprintf(' - %.3f secs\', toc);
        end
        fprintf(f, '</dataset>\');
        fclose(f);
        fprintf('\');
    end
 
    % compress
    if (compress)
        system(['cd "' dir '"; zip -9 -r ___compressed___.zip *; cd ../']);
        system(['mv "' dir '/___compressed___.zip" "' filename '"']);
        system(['rm -r "' dir '"']);
    end
 
 
    function str = xmlencode(str, escapeQuotes)
        str = strrep(str, '<', '&lt;');
        str = strrep(str, '>', '&gt;');
        str = strrep(str, '&', '&amp;');
        if (escapeQuotes); str = strrep(str, '"', '\"'); end
    end
 
    function writeData(ff, dataname, data, addattr, log)
        fprintf(ff, '  <data name="%s"%s>\', dataname, addattr);
        fprintf(ff, '    <colormap log="%s" />\', log);
        fprintf(ff, '    <values>%s</values>\', implode('', ' ', data, ''));
        fprintf(ff, '  </data>\');
    end
 
    function writeMatrixXML(ff, tagname, data)
        for i=1:g.N
            fprintf(' %d', i);
            fprintf(ff, '    <%s root="%d">', tagname, i);
            for j=1:g.N
                if (mod(j, 100) == 1); fprintf(ff, '\'); end
                fprintf(ff, ' %g', data(i,j));
            end
            fprintf(ff, '\</%s>\', tagname);
        end
    end
 
    function writeMatrixBlob(blobname, type, data)
        fb = fopen([dir '/blobs/' blobname], 'w', 'b');  % Java is Big-Endian
        typeID = 1;  % float
        if (strcmp(type, 'int')); typeID = 0; end
        fwrite(fb, [typeID g.N g.N -1], 'int');  % blob type (0=int, 1=float) and size (g.N x g.N)
        for i=1:g.N; fwrite(fb, data(i,:), type); end
        fclose(fb); clear fb
    end
 
    function writeSparseMatrixBlob(blobname, data)
        fb = fopen([dir '/blobs/' blobname], 'w', 'b');
        fwrite(fb, [2 size(data,1)], 'int');  % blob type (2=SparseMatrix) and size (g.N)
        for i=1:size(data,1)
            [~, J, w] = find(data(i,:));
            fwrite(fb, length(J), 'int');  % number of links from node i
            fwrite(fb, J-1, 'int');  % indices of end nodes
            fwrite(fb, w, 'float');  % corresponding link weights
        end
    end
 
end

