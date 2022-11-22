"""

    HashBlotto 

A package that is to be used for class C25  
"""

module HashBlotto

using HashCode2014
using SparseArrays

export greed
export all_random

include("greed_test.jl")
include("greedy_approach_v0.jl")
include("output.jl")
include("random.jl")


end
