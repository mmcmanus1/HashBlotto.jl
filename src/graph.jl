"""

    graph_structure(city::City)

Given the city the function will return a precomupted adjacency dictionary.
The keys of the dictionary will hold the the index of the vertice
The values of the dictionary will be a list of tuples of (next_node_index, distance, duration, distance/duration)

"""

function graph_structure(city::City)
    (; total_duration, nb_cars, starting_junction, streets) = city
    inside = Tuple{Int,Int}[]
    #the adjaceny list will 
    adj_list = Dict{Int,Vector{Tuple{Int,Int,Float16}}}()

    for (index, street) in enumerate(city.streets)
        A = street.endpointA
        B = street.endpointB

        #data that we want to keep track of is just:
        length = street.distance
        duration = street.duration
        value = length/duration
        data = (B, duration, value)
        #I

        # @info "A $A, B $B, data $data"

        if A in keys(adj_list)
            push!(adj_list[A], data)
        else
            adj_list[A] = [data]
        end

        #check the bidirectionality 
        if street.bidirectional
            if B in keys(adj_list)
                push!(adj_list[B], data)
            else
                adj_list[B] = [data]
            end
        end
    end

    return adj_list
end


"""
    adj_reward(graph, street_candidates, visited)

Given the graph structure the function will look at the 
street candidates and the visited nodes and return the "value" of each one

The value will be calculated by:
+1 for node not visited
-1 for node visited

output: a dictoinary of node_index to adj_reward
"""

function adj_reward(graph, next_node, visited)
    max_reward = 0
    max_node = next_node[1]
       
    
    for n_adj_junction in graph[max_node]
        n_adj_node = n_adj_junction[1]

        # @info "n_adj_node $n_adj_node"
        if n_adj_node in keys(visited)
            max_reward -= 1
            max_node = n_adj_node
        else
            max_reward += 1
            max_node = n_adj_node
        end
    end
    
    
    
    return max_reward
end




