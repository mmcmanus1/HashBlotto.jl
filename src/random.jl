"""
    all_random(city)

Iterates through 10 random walks, returning the best found solution
"""
function all_random(city)
    best_distance = 0
    best_sol = Vector{Vector{Int}}(undef, 0)

    for i in 1:10
        #look at the total distance of a random walk
        random_sol = HashCode2014.random_walk(city)
        random_dis = HashCode2014.total_distance(random_sol, city)
        if random_dis > best_distance
            best_distance = random_dis
            best_sol = random_sol
        end
    end

    return best_sol, best_distance
end
