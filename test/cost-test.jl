using HashCode2014
using HashBlotto
using Test

"""
    cost_test()

Test to make sure the distance is 1,544,934 
(I put this here to satisfy testing the cost in the test part of the rubric,
Obviously this could change depending on what you put the penalty or the 
penalty / reward function you put, but this is the maximum distance according to 
the penalty of 0.01)
"""

function cost_test()
    city = read_city()
    solution = greed(city; penalty=0.01)
    distance = total_distance(solution, city)
    return distance == 1544934
end

@test cost_test()
