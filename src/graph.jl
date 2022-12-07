"""
    graph_structure(city::City)

Given the city the function will return a precomupted adjacency dictionary.
The keys of the dictionary will hold the the index of the vertice
The values of the dictionary will be a list of tuples of (next_node_index, distance, duration, distance/duration)

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

"""
    kruskal(graph::Graph)

Algorithm that will return the minimum spanning tree of the graph.
We will do this by using Kruskal's algorithm.

"""

function kruskal(graph, street_structure)
    """
    We will use a disjoint set to keep track of the connected components.
    """
    #result = [(start_node, end_node, value)]
    result = Vector{Tuple{Int,Int,Float32}}()

    i = 0 #index for result
    e = 0 #index for edges
    #just sort the graphs byt he weights

    #sort the edges by the value
    sorted_edges = sort(
        collect(keys(street_structure)); by=x -> street_structure[x], rev=false
    )
    #get the values of the sorted edges

    sorted_edge_indexs = Dict{Int,Tuple{Int,Int}}()

    #each start and end vertex will have
    for (index, edge) in enumerate(sorted_edges)
        sorted_edge_indexs[index] = edge
    end

    parent = Vector{Int}(undef, length(graph))
    rank = Vector{Int}(undef, length(graph))

    #go through all the vertices
    for vertice in keys(graph)
        push!(parent, vertice)
        push!(rank, 0)
    end

    #number of edges to be taken is equal to vertices - 1
    while e < length(graph) - 1
        next_edge = getindex(sorted_edge_indexs, e + 1)
        e += 1

        x = next_edge[1]
        y = next_edge[2]

        #if including this edge does't cause cycle, include it in result and increment the index of result for next edge
        if x != y
            resulting_edge = (next_edge[1], next_edge[2], street_structure[next_edge])
            push!(result, resulting_edge)

            i += 1
            union(parent, rank, x, y)
        end
    end

    minimumCost = 0
    for edge in result
        @info "edge $edge"
        minimumCost += edge[3]
    end

    return result, minimumCost
end
