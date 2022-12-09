var documenterSearchIndex = {"docs":
[{"location":"algorithm/#HashBlotto's-Algorithm-for-Google-Hash-Code-2014","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"","category":"section"},{"location":"algorithm/#Introduction","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"Introduction","text":"","category":"section"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"The Google Hash Code 2014 competition was ","category":"page"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"HashBlotto used a greedy algorithm that used a Depth First Search-esque algorithm to maximize the overall distance we oculd traverse given the city input file. How we went about it is seen below. ","category":"page"},{"location":"algorithm/#The-Problem","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"The Problem","text":"","category":"section"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"The problem we were presented with is the 2014 Google Hashcode Problem. As seen here The goal of the problem is to attempt to cover the maximum possible distance of Paris with eight google street view cars. ","category":"page"},{"location":"algorithm/#The-Algorithm","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"The Algorithm","text":"","category":"section"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"The Algorithm that we came up with is a greedy algorithm that goes each car one by one. The algorithm follows the follwing steps:","category":"page"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"1. From the current junction look at all possible street segment that can be taken \n\n2. Select the best possible street segment that can be taken based off our value / penalty function \n\n3. Continue to repeat the algorithm until you reach a dead end or we run out of time.","category":"page"},{"location":"algorithm/#Value","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"Value","text":"","category":"section"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"The value that we use is distance / time. The reason we use this is because we want to maximize the distance we can travel in the given time, so it makes sense to traverse the streets that have the highest distance / time ratio.","category":"page"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"$","category":"page"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"\\text{value} = \\frac{\\text{distance}}{\\text{time}} $","category":"page"},{"location":"algorithm/#Penalty","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"Penalty","text":"","category":"section"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"If we had already been traversed down a street we would encorporate a penalty factor to the value. The penalty factor that we used was f(v p n) = v * (p)^n where v is value (distance/time ), p is the penalty factor, and n is the number of times we have traversed down that street. ","category":"page"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"This results in the following functions:","category":"page"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":" f(value p n) =  = beginn = 2 mboxvalue  mboxif  0  x  5  mboxn  1  mboxvalue * (p)^n endcases ","category":"page"},{"location":"algorithm/#The-Results","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"The Results","text":"","category":"section"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"The best distance that we found using this algorithm was 1,544,934. ","category":"page"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"The way we found this was by looking at the distribution of the differnet penalty factors and finding the best penalty factor that would maximize the distance we could travel. We foudn that the best penalty factors was 0.01, this makes sense because the more times we have traversed down a streets the less value we should give it. By going about the algorithm this way we were able to explore new areas of the city that we had not seen before.","category":"page"},{"location":"algorithm/#Analysis-of-Upper-Bound","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"Analysis of Upper Bound","text":"","category":"section"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"Analysis of the Upper Bound will go here","category":"page"},{"location":"algorithm/#Unexplored-/-Unfinished-Ideas-for-Improvement","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"Unexplored / Unfinished Ideas for Improvement","text":"","category":"section"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"After completing the algorithm we had two ideas to improve the algorithm.","category":"page"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"1: Look at the potential next nodes adjacent steets and look to see if we had or had not been down those streets before. We then give streets a reward or penalty factor depending on how many explored / unexplored streets were connected to the potential next node. Looking at the results of implementing this into the reward function that we found, it did not improve the results.","category":"page"},{"location":"algorithm/","page":"HashBlotto's Algorithm for Google Hash Code 2014","title":"HashBlotto's Algorithm for Google Hash Code 2014","text":"Recreate Kruskal's algorithm, and see if we can use it to find the best possible path to take. We decided against this because we thought it may interfere too much with the greedy type algorithm that we were using and thought it would be too much of a change to the algorithm.","category":"page"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = HashBlotto","category":"page"},{"location":"#HashBlotto","page":"Home","title":"HashBlotto","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for HashBlotto.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [HashBlotto]","category":"page"},{"location":"#HashBlotto.HashBlotto","page":"Home","title":"HashBlotto.HashBlotto","text":"HashBlotto\n\nA package that is build by the HashBlotto Team in C25.  The project is based on the Google HashCode 2014 competition.\n\n\n\n\n\n","category":"module"},{"location":"#HashBlotto.get_best_street","page":"Home","title":"HashBlotto.get_best_street","text":"get_best_street(current_junction, street_candidates, visited)\n\nReturns the \"best\" adjacent junction based on our greedy heuristic from getjunctionvalue\n\n\n\n\n\n","category":"function"},{"location":"#HashBlotto.get_junction_value-Tuple{Any, Any, Any}","page":"Home","title":"HashBlotto.get_junction_value","text":"get_junction_value (current_junction, visited, penalty)\n\nReturns the value of the current junction.  The current reward system acting under the reward equation:\n\nval * penalty ^ visited[node] \n\n\n\n\n\n","category":"method"},{"location":"#HashBlotto.graph_structure-Tuple{HashCode2014.City}","page":"Home","title":"HashBlotto.graph_structure","text":"graph_structure(city::City)\n\nGiven the city the function will return a precomupted adjacency dictionary. The keys of the dictionary will hold the the index of the vertice The values of the dictionary will be a list of tuples of (nextnodeindex, duration, distance/duration)\n\n\n\n\n\n","category":"method"},{"location":"#HashBlotto.greed-Tuple{Any}","page":"Home","title":"HashBlotto.greed","text":"greed(City)\n\nGenerates a Greedy Solution to the HashCode Challenge The overall logic is below:     - At every junction look at the adjacent streets and look at their value (duration/distance)     - If a street has been visited before, we penalize it by making a new value equal: value * (penalty = 0.01 ^ # of times visited)\n\nEach car is sent out one at a time and the car will continue to move until it reaches the end of the time limit or it reaches a dead end. At that point the next car will start or the solution will be returned.\n\n\n\n\n\n","category":"method"}]
}
