"""
    all_random(city)

Iterates through 10 random walks, returning the best found
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

    return best_sol, best_distance
end
