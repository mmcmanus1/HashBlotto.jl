using HashCode2014
using HashBlotto

city = read_city()
solution, distance = all_random(city)
println("The solution is: ", solution)
println("The distance of the best solution is: ", distance)


best_sol_ouptut(solution)
