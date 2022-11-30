using HashCode2014
using HashBlotto

city = read_city()
solution, distance = all_random(city)
solutio = greed(city)
println("The solution is: ", solution)
println("The distance of the best solution is: ", distance)

is_feasible(solution, city) #city
best_sol_output(solution)
