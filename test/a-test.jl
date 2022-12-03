using HashCode2014
using HashBlotto
using Test

# city = read_city()
# graph = graph_structure(city)

total_duration, nb_cars, starting_junction = 1000, 5, 2
junctions = Junction[]
d₁, d₂ = 10, 20 # duration, and distance. Not needed 
same_time_streets = Street[
    Street(1, 2, false, d₁, d₂), Street(1, 3, false, d₁, d₂), Street(2, 3, true, d₁, d₂)
]
varying_streets = Street[
    Street(1, 2, false, (1 + 2)d₁, (1 + 2)d₂),
    Street(1, 3, false, (1 + 3)d₁, (1 + 3)d₂),
    Street(2, 3, true, (2 + 3)d₁, (2 + 3)d₂),
]

"""
    bidirectionality_test(city::City)

Tests forward and reverse directionality of graph_structure is implemented correctly
"""

function bidirectionality_test()
    city = City(total_duration, nb_cars, starting_junction, junctions, same_time_streets)
    graph = graph_structure(city)
    sol₁ = Dict{Int64,Vector{Tuple{Int64,Int64,Float16}}}(
        1 => [(2, 10, 2.0), (3, 10, 2.0)], 2 => [(3, 10, 2.0)], 3 => [(2, 10, 2.0)]
    )
    return graph == sol₁
end

"""
    time_varying_graph_test(city::City)

Tests that forward and reverse duration & distance/duration ratios are implemented correctly
"""

function time_varying_graph_test()
    city = City(total_duration, nb_cars, starting_junction, junctions, varying_streets)
    graph = graph_structure(city)
    sol₂ = Dict{Int64,Vector{Tuple{Int64,Int64,Float16}}}(
        1 => [(2, 30, 2.0), (3, 40, 2.0)], 2 => [(3, 50, 2.0)], 3 => [(2, 50, 2.0)]
    )
    return graph == sol₂
end

@test bidirectionality_test()
@test time_varying_graph_test()

# All other A tests
