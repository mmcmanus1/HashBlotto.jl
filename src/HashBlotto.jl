"""
    HashBlotto 

A package that is build by the HashBlotto Team in C25. 
The project is based on the Google HashCode 2014 competition.
"""
module HashBlotto

using HashCode2014
using SparseArrays

export greed, get_best_street, get_junction_value
export graph_structure, street_structure
include("greed_test.jl")
include("graph.jl")

end
