"""
    HashBlotto 

A package that is build by the HashBlotto Team in C25. 
The project is based on the Google HashCode 2014 competition.
"""
module HashBlotto

using HashCode2014
using SparseArrays

export greed
export all_random
export get_best_street
export get_value
export Distributions
export graph_structure, street_structure, adj_reward, kruskal



include("greed_test.jl")
include("random.jl")
include("graph.jl")



end
