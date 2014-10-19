# MATLAB Fall 2014 – Research Plan


> * Group name: Maias
> * Group participants names: Elias Rieder, Mario Vontobel
> * Project Title: Swiss Train Network

## General Introduction

Every day we travel from our homes to Zürich. The train in the morning is often very crowded.
Of course, compared to other countries, we are all still traveling quite comfortable. 
But since the number of people traveling by train is increasing this problem will even grow.


Up to 1 million people per day travel by train in Switzerland. As already mentioned, this number is rising.
More and more people are going to work by train, our mobility in general is ascending.
So we asked our self if and how it would be possible to optimize the Swiss train system.
Is it possible to push our rail system more to the limit? And if yes how do its properties change?
Such as how resistant is this system against delays? Do they accumulate?




As mentioned at the bottom of the page we have connected SBB for data. 
Since we do not know if, and what kind of data we will get, we had to make two scenarios: 

* <b>Best case</b>: We get a rich dataset with time schedules, load factors etc.

* <b>Worst Case</b>: We do not get any data. We will then apply our ideas to a general gravity model, 
where the distance and population determine the strength of connections (contingency plan).





## The Model

Look at the next chapter under Interesting parameters.


<b>Note</b>: If you raise the capacity of a system there is the possibility that the demand for it raises too. 
For example it would be possible that faster train connections would cause more people going to work by train.
We will not look at this parameter because the human demands are way too complex to model,
especially since we did not find any data so we would have to make assumptions based on our perception.
This would go beyond the scope of our work.



## Fundamental Questions



We are trying to find out what modifications raise the capacity and 
the efficiency of a rail system by applying network theories and by changing parameters of our model.
How does the system react to the variation of the following parameters:

<ul>
<li>Network/Connection/Connection types </li> 
<ul> 
<li>What network system has the railway system?  </li> 
<li>Ideas about changes from network theory?  </li> 
<li>How does it work with different structures? </li> 
</ul>

<li> Delay resistance </li>
<ul>
<li>How does the system react? </li> 
<li>What can happen in the worst case? </li> 
</ul>

<li> Speed between stations</li>
<li> Hold time at the station </li>


</ul>

   
<b>Note</b>: For the worst case we look at similar parameters but in a more theoretical way. Like comparing models in general and so on.





## Expected Results

We expect that the rail system fulfills high standards and probably there will not be a better realistic solution. 
Maybe there will exist a better theoretical solution but which will probably not be realizable 
since there are a lot of other factors like economics which we do not look at.


## References 


Marc Barthélemy, "Spital Networks", 2011:
Chapter 2 and 3 Cover related things.



Maciej Kurant and Patrick Thiran, "Extraction and analysis of traffic and topologies of transportation networks", 2006:
Gives an algorithm to extract networks from a time table which we may can modify so that it takes also distance and capacity in account.



Jago Dodson, Paul Mees, John Stone and Matthew Burke, "The Principles of Public Transport Network Planning: A review of the emerging literature with select examples", 2011:
Covers theory about different network systems which we may be able to apply to the Swiss railway system.




## Research Methods

Since we do not know if we get the data we do not know yet.

## Other

We have connected SBB and kindly asked for datasets from schedules and load factors.