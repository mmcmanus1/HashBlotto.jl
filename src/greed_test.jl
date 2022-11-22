
"""

    greed(City)

function that is greedy in it's approach to finding the best path,
the logic it follows is looking at the distance/time ratio of the
next junction and choosing the one with the highest ratio, if a car
has already gone down one of the roads then we will calculate the reward
based off of reward/ 2 * times it has gone down the road


------------------------------------------------------------------------

Building off of the HashCode2014 package (https://github.com/gdalle/HashCode2014.jl) that 
was already built out for us, I definetly made it better as it is smarter in how
    it chooses paths than (https://github.com/gdalle/HashCode2014.jl/blob/main/src/random_walk.jl)

"""

function greed(city)
    (; total_duration, nb_cars, starting_junction, streets) = city
    
    moves = Vector{Vector{Int}}(undef, nb_cars)
    visited = Dict{Int, Vector{Int}}()

    print("number of cars, nb_cars", nb_cars)

    #setting up the number of cars we are looking allowedTime
    for c in 1:nb_cars
        print("car:", c)
        move = [starting_junction]
        duration = 0

        while duration < 10
            current_junction = last(move)

            #taken from random_walk.jl on HashCode2014 
            #make it slightly better by encorporating the fact that we should never go back through 
            #the starting_junction 
            # print(enumerate(streets[1:25]))

            street_candidates = [
                (s, street) for (s, street) in enumerate(streets) if (
                    HashCode2014.is_street_start(current_junction, street) &&
                    duration + street.duration <= total_duration #&&
                    # (street.endpointB) != starting_junction
                )
            ]

            #check to make sure we have a street to go to
            if isempty(street_candidates)
                break
            else
                #greedy logic 
                max_val = -10
                #just look at the first one
                max_street = street_candidates[1]
                println("indexxxxxxxxxxxxx ", street_candidates)
                println()
                # println("street_candidates")
                for (s, street) in street_candidates
                    val = street.distance / street.duration
                    break
                    if val > max_val
                        #if hte stree has not been visited before then we update max val
                        if street.endpointB ∉ keys(visited)
                            max_val = val
                            max_street = street
                        elseif street.endpointB in keys(visited)
                            #if the street has been visited before we will divide the 
                            #value in half
                            
                            if val/(2*visited[street.endpointB]) > max_val
                                max_val = val/(2*visited[street.endpointB])
                                max_street = street
                            end

                        end
                    end
                end
                # println(max_street[2].endpointB)
                # println(max_street)
                max_street = max_street[2]

                if current_junction == max_street.endpointA
                    node = max_street.endpointB
                else
                    node = max_street.endpointA
                end


                #update the streets, duration, and visited

                println("\n\n\n", move)
                push!(move[c], node)
                duration += max_street.duration
                if max_street in keys(visited)
                    visited[max_street] += 1
                else
                    visited[max_street] = 1
                end

                print("duration", duration)
                println()
                break

            end

        end
        moves[c] = move
    end
    return Solution(moves)
end