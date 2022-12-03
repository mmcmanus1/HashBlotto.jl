using HashCode2014
using HashBlotto
using Test

# city = read_city()
# graph = graph_structure(city)

total_duration, nb_cars, starting_junction = 1000, 5, 2
junctions = Junction[]
d₁, d₂ = 10, 20 # duration, and distance. Not needed 
streets = Street[
    Street(1, 2, false, d₁, d₂), Street(1, 3, false, d₁, d₂), Street(2, 3, true, d₁, d₂)
]

"""
    bidirectionality_test(city::City)

Tests forward and reverse directionality of Streets is implemented correctly
"""

function bidirectionality_test()
    city = City(total_duration, nb_cars, starting_junction, junctions, streets)
    graph = graph_structure(city)
    println(graph)
    sol₁ = Dict{Int64,Vector{Tuple{Int64,Int64,Float16}}}(
        1 => [(2, 10, 2.0), (3, 10, 2.0)], 2 => [(3, 10, 2.0)], 3 => [(2, 10, 2.0)]
    )
    return graph == sol₁
end
@test bidirectionality_test()

# All other A tests
