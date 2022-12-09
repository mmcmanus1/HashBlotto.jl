"""
    graph_structure(city::City)

Given the city the function will return a precomupted adjacency dictionary.
The keys of the dictionary will hold the the index of the vertice
The values of the dictionary will be a list of tuples of (next node's index, duration, distance/duration)

"""
function graph_structure(city::City; bidir=true)
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
        if street.bidirectional && bidir
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
