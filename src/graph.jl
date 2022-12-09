"""
    graph_structure(city::City)

Given the city the function will return a precomupted adjacency dictionary.
The keys of the dictionary will hold the the index of the vertice
The values of the dictionary will be a list of tuples of (next_node_index, duration, distance/duration)

"""
function graph_structure(city::City)
    #adj_list = {start_node_index: [(end_node_index, duration, distance/duration)]}
    adj_list = Dict{Int,Vector{Tuple{Int,Int,Float16}}}()

    for street in city.streets
        A = street.endpointA
        B = street.endpointB

        #data that we want to keep track of is just:
        length = street.distance
        duration = street.duration
        value = length / duration
        forward_data = (B, duration, value)
        reverse_data = (A, duration, value)

        #adj_list information:
        if A in keys(adj_list)
            push!(adj_list[A], forward_data)
        else
            adj_list[A] = [forward_data]
        end

        #check the bidirectionality
        if street.bidirectional
            if B in keys(adj_list)
                push!(adj_list[B], reverse_data)
            else
                adj_list[B] = [reverse_data]
            end
        end
    end

    return adj_list
end

"""
    street_structure(city::City)

Returns a dictionary of
    keys: street endpoints (A, B)
    values: duration
"""

function street_structure(city::City)
    #adj_graph = {(start_node_index, end_node_index): duration}
    adj_graph = Dict{Tuple{Int64,Int64},Float16}()

    for street in city.streets
        A = street.endpointA
        B = street.endpointB
        data = street.duration

        #adj_graph information
        adj_graph[(A, B)] = data

        #check bidirectional
        if street.bidirectional
            adj_graph[(B, A)] = data
        end
    end

    return adj_graph
end

"""
    adj_reward(graph, street_candidates, visited)

Given the graph structure the function will look at the
street candidates and the visited nodes and return the "value" of each one

The value will be calculated by:
+1 for node not visited
0 for node visited

output: a dictionary of node_index to adj_reward
"""

function adj_reward(graph, next_node, visited)
    max_reward = 0
    max_node = next_node[1]

    for n_adj_junction in graph[max_node]
        n_adj_node = n_adj_junction[1]

        # @info "n_adj_node $n_adj_node"
        if n_adj_node in keys(visited)
            max_node = n_adj_node
        else
            max_reward += 1
            max_node = n_adj_node
        end
    end

    return max_reward / length(graph[max_node])
end
