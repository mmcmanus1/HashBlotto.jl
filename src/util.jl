
"""
distributions(city, min, max, step)

Shows the distributions of the distances of the city at different penalty values
"""
function distributions(city, min, max, step)
    best_distance = 0
    best_penalty = 0

    penalty = min
    while penalty <= max
        solution = greed(city; penalty=penalty)
        distance = total_distance(solution, city)

        if distance > best_distance
            best_distance = distance
            best_penalty = penalty
        end
        @info "Penalty: $penalty, Distance: $distance"
        penalty += step
    end

    return best_penalty, best_distance
end
