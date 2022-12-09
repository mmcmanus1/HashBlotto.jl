using HashCode2014
using HashBlotto
using Test

city = read_city()
solution = greed(city; penalty=0.01)
total_distance(solution, city)

"""
A test against the normal runtime. Indeed, we see the city of Paris distance :)
"""

@test upper_bound(city::City, 54000) > total_distance(solution, city)
