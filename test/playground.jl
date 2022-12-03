using HashCode2014
using HashBlotto

city = read_city()
graph = graph_structure(city)

@time solution = greed(city; penalty=0.3)
distance = total_distance(solution, city)

# best_penalty, best_distance = Distributions(city, 0, 1, .05)
#look at all the streets
@time streets = street_structure(city)

sorted_edges = kruskal(graph, streets)

@info "sorted_edges $sorted_edges"


