using HashCode2014
using HashBlotto

city = read_city()
graph = graph_structure(city)

@time solution = greed(city, penalty = .1)
# @profview solution = greed(city, penalty = .1)
# @time greed(city, penalty = .1))
# println(solution)


# solution = greed(city, penalty = .1)
distance = total_distance(solution, city)

# monte = MonteCarlo(city)

# best_penalty, best_distance = Distributions(city, 0, 1, .01)


#look at the current structure and 
