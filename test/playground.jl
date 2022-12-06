using HashCode2014
using HashBlotto

city = read_city()
graph = graph_structure(city)

@time solution = greed(city; penalty=0.01)
distance = total_distance(solution, city)
