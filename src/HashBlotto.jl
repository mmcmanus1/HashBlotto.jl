"""
    HashBlotto 

A package that is build by the HashBlotto Team in C25. 
The project is based on the Google HashCode 2014 competition.

Challenge description: https://storage.googleapis.com/coding-competitions.appspot.com/HC/2014/hashcode2014_final_task.pdf

Challenge data: https://storage.googleapis.com/coding-competitions.appspot.com/HC/2014/paris_54000.txt

Made for MIT course C25: Julia: Solving Real-World Problems with Computation
"""
module HashBlotto

using HashCode2014
using SparseArrays

export greed, get_best_street, get_junction_value
export graph_structure, street_structure
export upper_bound
include("greed_test.jl")
include("graph.jl")
include("functions.jl")

end
