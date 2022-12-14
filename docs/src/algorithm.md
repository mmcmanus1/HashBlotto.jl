\documentclass{article}
\usepackage{amsmath}

# HashBlotto's Algorithm for Google Hash Code 2014

## Introduction

HashBlotto used a greedy algorithm that used a Depth First Search-esque algorithm to maximize the overall distance we could traverse given the city input file. How we went about attempting to solve the problem can be seen below.

## The Problem

The problem we were presented with was the 2014 Google Hashcode Problem. As seen [here](https://storage.googleapis.com/coding-competitions.appspot.com/HC/2014/hashcode2014_final_task.pdf) The goal of the problem is to attempt to cover the maximum possible distance of Paris, in this context we were given eight google street view cars to work with and were told to make it into a Julia Package.

## The Algorithm

The Algorithm that we came up with is a greedy algorithm that goes through each car one by one. The algorithm follows the follwing steps:

    1. From the current junction look at all possible street segment that can be taken 

    2. Select the best possible street segment that can be taken based off our value / penalty function 

    3. Once the best street is selected, record the street seen in a dictionary that keeps track of the number of times we have seen a street

    4. Continue to repeat the algorithm until you reach a dead end or run out of time. Once a car has either reached a dead end or runt out of time a new car will start again if there is another google street view car available.

### Value 

The value that we use is distance / time. The reason we use this is because we want to maximize the distance we can travel in the given time, so it makes sense to traverse the streets that have the highest distance / time ratio.

$$ \text{value} = \frac{\text{distance}}{\text{time}} $$

### Penalty 

If we had already been traversed down a street we would encorporate a penalty factor to the value. The penalty factor that we used was $$f(v, p, n) = v * (p)^{n}$$ where v is value (distance/time ), p is the penalty factor, and n is the number of times we have traversed down that street. 

This results in the following functions:

if n = 0, then the value is the same as the value that we calculated before.

if n > 1, then the value is the value that we calculated before multiplied by the penalty factor to the power of the number of times we have traversed down that street.


## The Results

The best distance that we found using this algorithm was 1,544,934. 

The way we found this was by looking at the distribution of the differnet penalty factors and finding the best penalty factor that would maximize the distance we could travel. We foudn that the best penalty factors was 0.01, this makes sense because the more times we have traversed down a streets the less value we should give it. By going about the algorithm this way we were able to explore new areas of the city that we had not seen before.


## Analysis of Upper Bound

Our upper bound works on Polya's principle of adapting a solution from a simpler problem. Formally,
our problem is to find a maximal length sequence $p^{*} = [v_i] \in \mathcal{P}$ with vertices $v_i$ such that 

$$\forall p \in \mathcal{P}, \text{coverage}(p^{\*}) \geq \text{coverage}(p), (v_i, v_{i+1}) \in E, \text{time}(p^{\*}) \leq \text{Allowed Time}$$

A natural relaxation of this problem would be to remove the edge constraint (equivalently, to allow teleportation between vertices) and solve the following problem:

$$\forall p \in \mathcal{P}, \text{coverage}(p^{\*}) \geq \text{coverage}(p), \text{time}(p^{\*}) \leq \text{Allowed Time}$$

Under such a relaxation, the distance of the unconstrained path is a trivial upper bound; to find an optimal path, we take the supremum over all possibilities in $\mathcal{P}$ [in this case, a maximum, since $\mathcal{P}$ is finite]. The maximum is non-decreasing under the addition of more elements (which is what happens when we remove constraints, unless we happen to end up with the same problem), so our upper bound in the relaxation is an upper bound for both problems.

With the formal proof out of the way, let's get to the implementation. 

The implementation sorted the paths in reverse order in terms of the $\frac{\text{distance}}{\text{duration}}$ ratio,
took the path that had the highest ratio, traversed it, and removed it from the list of possible paths. This meant that at each 
timestep, each car was able to teleport to a different vertex to maximize its distance, consistent with our mathematical formulation. We used a graph structure that only had unidirectional streets, so as to not go through a street twice [teleportation meant it didn't matter which we kept]. To not deal with the corner cases of time limits, we allowed paths to go over the allowed time as required by the last path, since this would preserve the upper bound property. To this end, we use a further relaxation by having a variable allowed time which is $\geq \text{Allowed Time}$.

Overall, our result is consistent with our peer's leaderboard result, and when we ran our upper bound test on the full length of time (54000 seconds), our upper bound gave us the street length of Paris, which gave us confidence as to implementation correctness. 

## Unexplored / Unfinished Ideas for Improvement

After completing the algorithm we had two ideas to improve the algorithm.

1: Look at the potential next nodes adjacent steets and look to see if we had or had not been down those streets before. We then give streets a reward or penalty factor depending on how many explored / unexplored streets were connected to the potential next node. Looking at the results of implementing this into the reward function that we found, it did not improve the results.

2: Recreate Kruskal's algorithm, and see if we can use it to find the best possible path to take. We decided against this because we thought it may interfere too much with the greedy type algorithm that we were using and thought it would be too much of a change to the algorithm.

## Efficiency Challenges

The main efficiency challenge that we ran into was the design of the graph. In order to run a more efficient algorithm we reconstructed our graph by constructing an adjacency dictionary that mapped a node index to a list of all the nodes that it was connected to which kept track of the duration and the value of the street (distance / duration). This allowed us to run the algorithm much faster because we did not have to iterate through the entire list of streets to find the next street to take or recompute the value of the street every time we called it. 

Outside of this we found little to no other efficiency challenges. As spoke about above we investiaged the ideas above, but decided against it as we didn't find an improvement in distance. Through this process we created the function street structure which was to be used for kruskal's algorithm. We decided to keep it in the code as it may be useful for future users if they wanted to implement kruskal's algorithm.

We also made sure everything was type stable and everything that we could precompute we did.

