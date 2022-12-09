"""
    greed(City)

Generates a Greedy Solution to the HashCode Challenge
The overall logic is below:
    - At every junction, look at the adjacent streets and look at their value (duration/distance)
    - If a street has been visited before, we penalize it by making a new value equal: value * (penalty = 0.01 ^ # of times visited)

Each car is sent out one at a time and the car will continue to move until it reaches the end of the time limit or it reaches a dead end.
At that point the next car will start or the solution will be returned.
"""
function greed(city; penalty=0.01)
    (; total_duration, nb_cars, starting_junction, streets) = city

    moves = Vector{Vector{Int}}(undef, nb_cars)
    visited = Dict{Int,Int}()
    graph = graph_structure(city)

    for car in 1:nb_cars
        move = [starting_junction]
        duration = 0

        # Ensures within AllowedTime
        while duration <= total_duration
            current_junction = last(move)
            last_node = current_junction[1]
            street_candidates = graph[last_node]

            # check to make sure we have not reached a dead end
            if length(street_candidates) == 0
                break
            else
                #returns the best possible street to go to according to our greedy heuristic
                max_junction = get_best_street(street_candidates, visited, penalty)
                max_node_number = max_junction[1]
                max_node_duration = max_junction[2]

                #Ensures we do not go over the time limit by adding a street that wouldn't allow us to go over the time limit
                if duration + max_node_duration > total_duration
                    break
                else
                    duration += max_node_duration
                    push!(move, max_node_number)
                end

                # Increment the visited counter
                if max_node_number in keys(visited)
                    visited[max_node_number] += 1
                else
                    visited[max_node_number] = 1
                end
            end
        end
        moves[car] = move
    end
    return Solution(moves)
end

"""
    get_best_street(current_junction, street_candidates, visited)

Returns the "best" adjacent junction based on our greedy heuristic from "get_junction_value"
"""
function get_best_street(street_candidates, visited, penalty=0.01)
    max_junction = street_candidates[1]
    max_val = -1

    for next_junction in street_candidates
        value = get_junction_value(next_junction, visited, penalty)
        if value > max_val
            max_val = value
            max_junction = next_junction
        end
    end

    return max_junction
end

"""
    get_junction_value (current_junction, visited, penalty)

Returns the value of the current junction. 
The current reward system acting under the reward equation:

val * penalty ^ visited[node]
"""
function get_junction_value(next_junction, visited, penalty)
    node = next_junction[1]
    val = next_junction[3]

    if node in keys(visited)
        return val * penalty^visited[node]
    else
        return val
    end
end
