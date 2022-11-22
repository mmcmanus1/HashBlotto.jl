"""

    HashBlotto 

A package that is to be used for class C25  
"""



module HashBlotto

using HashCode2014
using SparseArrays

export random_walking
export greed


include("greed_test.jl")
include("greedy_approach_v0.jl")
include("output.jl")


end