"""
    HashBlotto 

A package that is build by the HashBlotto Team in C25. 
The project is based on the Google HashCode 2014 competition.
"""
module HashBlotto

using HashCode2014
using SparseArrays

export greed
export get_edge_dictionary, greedy, get_unvisited, get_outneighbors_and_distances
export all_random

include("greed_test.jl")
include("greedy_approach_v0.jl")
include("random.jl")

end
