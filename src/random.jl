"""
    all_random(city)

Function that returns the best random solution after 10 iterations 
of the random solution and returns the best random solution of those 10.
"""
function all_random(city)
    #call the random walk function 100 times and return the best one
    best_distance = 0
    best_sol = []

    for i in 1:10
        #look at the total distance of a random walk
        random_sol = HashCode2014.random_walk(city)
        random_dis = HashCode2014.total_distance(random_sol, city)
        if random_dis > best_distance
            best_distance = random_dis
            best_sol = random_sol
        end
    end

    # total_distance = HashCode2014.total_distance(random_walk)

    return best_sol
end
