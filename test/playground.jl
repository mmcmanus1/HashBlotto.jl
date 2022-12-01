using HashCode2014
using HashBlotto

city = read_city()
solution = greed(city, penalty = .1)
# println(solution)

distance = total_distance(solution, city)

# monte = MonteCarlo(city)

# best_penalty, best_distance = Distributions(city, 0, 1, .1)