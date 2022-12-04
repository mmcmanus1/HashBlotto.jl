using HashCode2014
using HashBlotto

city = read_city()
graph = graph_structure(city)

@time solution = greed(city; penalty=0.01)
distance = total_distance(solution, city)
best_penalty, best_distance = Distributions(city, 0, .05, .001)
#look at all the streets
# @time streets = street_structure(city)

is_feasible(solution, city)
write_solution(solution, "solution.txt")
reading = read_solution("solution.txt")
is_feasible(reading, city)
total_distance(reading, city)
# best_distance
# best_penalty

# sorted_edges = kruskal(graph, streets)

# @info "sorted_edges $sorted_edges"
