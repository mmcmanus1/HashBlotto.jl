using HashCode2014
using HashBlotto
using Test

"""
    solution_test()

Tests whether our produced solution is feasible
"""

function time_varying_street_test()
    city = read_city()
    solution = greed(city; penalty=0.01)
    return is_feasible(solution, city)
end

@test time_varying_street_test()
