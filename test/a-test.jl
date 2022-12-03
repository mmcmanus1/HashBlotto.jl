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

city = City(total_duration, nb_cars, starting_junction, junctions, streets)
graph = graph_structure(city)
println(graph)
# @test is_feasible(solution, city)

# All other A tests
