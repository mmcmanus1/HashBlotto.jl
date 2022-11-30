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
function greed(city)
    (; total_duration, nb_cars, starting_junction, streets) = city

    moves = Vector{Vector{Int}}(undef, nb_cars)
    visited = Dict{Int,Int}()

    # @info "starting junction $starting_junction"
    # @info "total duratoin $total_duration"
    #setting up the number of cars we are looking allowedTime
    for c in 1:nb_cars
        move = [starting_junction]
        duration = 0

        while duration <= total_duration
            current_junction = last(move)

            street_candidates = [
                (s, street) for (s, street) in enumerate(streets) if (
                    HashCode2014.is_street_start(current_junction, street) &&
                    duration + street.duration <= total_duration #&&
                    # (street.endpointB) != starting_junction
                )
            ]
            # @info "street candidates $street_candidates"
            #check to make sure we have a street to go to
            if isempty(street_candidates)
                # @info "no street candidates"
                break
            else
                #get the max 
                max_junction = get_best_street(street_candidates, visited)
                max_index = max_junction[1]
                max_street = max_junction[2]
                # @info "max index $max_index"
                starting_node = max_street.endpointA
                ending_node = max_street.endpointB
                # @info "starting node $starting_node"
                # @info "ending node $ending_node"


                duration += max_street.duration
                # @info "duration $duration, max street $total_duration"
                push!(move, ending_node)

                if max_index in keys(visited)
                    visited[max_index] += 1
                else
                    visited[max_index] = 1
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

function get_best_street(street_candidates, visited)
    max_junction = street_candidates[1]
    max_val = -10

    for next_junction in street_candidates
        #get the max_value that we can have
        value = get_value(next_junction, visited)

        if value > max_val
            max_val = value
            max_junction = next_junction
        end
    end

    return max_junction
end

"""
    get_value (current_junction, visited)

Returns the value of the current junction
"""
    function get_value(current_junction, visited)
        street = current_junction[2]
        val = street.distance / street.duration
        if current_junction in keys(visited)
            #implement a better penalty system
            return val / (2 * visited[current_junction])
        else
            return val
        end
    end