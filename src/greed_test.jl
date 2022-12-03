"""
    greed(City)

A greedy construction heuristic solution: Greedily maximize
the distance/time ratio of the next junction. Reward is scaled down by 
2 * repetitions of a street [if more than once] to discourage repeated edges

------------------------------------------------------------------------
We improve on the prior work of the HashCode2014 package (https://github.com/gdalle/HashCode2014.jl)
by designing and implementing a greedy heuristic
(https://github.com/gdalle/HashCode2014.jl/blob/main/src/random_walk.jl)
"""
function greed(city; penalty=1)
    (; total_duration, nb_cars, starting_junction, streets) = city

    moves = Vector{Vector{Int}}(undef, nb_cars)
    visited = Dict{Int,Int}()
    graph = graph_structure(city)
    # kruskal_result, minimumCost = kruskal(graph, streets)

    # @info "starting junction $starting_junction"
    # @info "total duratoin $total_duration"
    #setting up the number of cars we are looking allowedTime
    for c in 1:nb_cars
        move = [starting_junction]
        duration = 0

        while duration <= total_duration
            current_junction = last(move)
            last_node = current_junction[1]
            street_candidates = graph[last_node]

            # @info "street candidates $street_candidates"
            #check to make sure we have a street to go to
            if length(street_candidates) == 0
                break
            else
                max_junction = get_best_street(graph, street_candidates, visited, penalty)

                duration += max_junction[2]
                push!(move, max_junction[1])

                if max_junction[1] in keys(visited)
                    visited[max_junction[1]] += 1
                else
                    visited[max_junction[1]] = 1
                end
            end
        end
        moves[c] = move
    end
    return Solution(moves)
end

"""
    get_best_street(current_junction, street_candidates, visited)

Returns the best street that the google maps car can go to. 
"""
function get_best_street(graph, street_candidates, visited, penalty=1)
    max_node = street_candidates[1]
    max_val = -10

    for next_node in street_candidates
        value = get_value(graph, next_node, visited, penalty)
        if value > max_val
            max_val = value
            max_node = next_node
        end
    end

    return max_node
end

"""
    get_value (current_junction, visited)

Returns the value of the current junction. 
The current reward system acting under the reward equation:

val * penalty ^ visited[node] + (penalty) * adjacent_reward

"""
function get_value(graph, next_node, visited, penalty)
    node = next_node[1]
    val = next_node[3]

    if next_node[1] in keys(visited)
        adjacent_reward = adj_reward(graph, next_node, visited)
        # @info "adjacent reward $adjacent_reward"

        return val * penalty^visited[node] + (penalty) * adjacent_reward
    else
        return val
    end
end

"""
    Distributions(city, min, max, step)

Shows the distributions of the distances of the city at different penalty values
"""
function Distributions(city, min, max, step)
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
