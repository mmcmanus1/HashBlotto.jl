# """
#     get_edge_dictionary(city)

# A helper function that extracts a dictionary mapping adjacent edges. Particularly:
# input: A city object
# output: Dict(junctions .=> (possible_neighbor, duration, distance))=
# """
# function get_edge_dictionary(city)
#     city_streets = city.streets
#     edges = Dict()
#     for edge in city_streets
#         A, B, time, dist = edge.endpointA, edge.endpointB, edge.duration, edge.distance
#         if A in keys(edges)
#             push!(edges[A], (B, time, dist))
#         else
#             edges[A] = [(B, time, dist)] # Create a dict with A goes to B, time, distance
#         end
#         if edge.bidirectional
#             if B in keys(edges)
#                 push!(edges[B], (A, time, dist))
#             else
#                 edges[B] = [(A, time, dist)]
#             end
#         end
#     end
#     return edges
# end
# function greedy(graph, start)
#     """
#         greedy(graph, start)

#     Input a graph, and a start node. Continue until you run out of time by greedily choosing the untraversed adjacent edge with maximum distance. If none-such exist: perform a random walk until encountering one, or until time runs out. 
#     """
#     dist = fill(Inf, nb_vertices(graph))  # here
#     queue = [(start, 0)]
#     time, visited, greedy_path = 0, [], []
#     outneighbors = get_outneighbors(g, junction, t)
#     # while !isempty(queue)
#     while outneighbors
#         unvisited_neighbors = get_unvisited(v, visited)

#         if unvisited_neighbors
#             max_length = 0
#             for neighbor in unvisited_neighbors
#                 if neighbor[3] > max_length
#                     max_length = neighbor[3]
#                     max_neighbor = neighbor
#                 end
#             end
#             #push the max neighbor to the queue 
#             push!(greedy_path, max_neighbor)
#             push!(visited, max_neighbor[1])
#             time += max_neighbor[2]
#             dist.push(max_neighbor[3])

#         else
#             rand(outneighbors(graph, u))
#         end
#         outneighbors = get_outneighbors(g, u, t)
#     end
#     return greedy_path
# end

# """
#     get_unvisited(v, visited)

# A helper function that returns the unvisited neighbors of a node.
# """
# function get_unvisited(list, visited)
#     f(x) = !(x in visited)
#     x = filter(f, list)
#     return x
# end

# """
#     get_outneighbors_and_distances(graph, junction, time, allowedTime)

# Get the outneighbors of an edge and the corresponding distance u
# given a time constraint t.
# Returns the empty array if none are possible
# """
# function get_outneighbors_and_distances(g, junction, t, allowedTime)
#     # Dict(junctions .=> (possible_neighbor, duration, distance))
#     mapping = g[junction]
#     zipped = [
#         (neighbor[1], neighbor[3]) for neighbor in mapping if t + neighbor[2] < allowedTime
#     ]
#     if length(zipped) == 0
#         return []
#     end
#     outneighbors, distances = collect(zip(zipped...))
#     print(outneighbors)
#     print("here")
#     return outneighbors, distances
# end

# # print(get_outneighbors_and_distances(edges, 8660, 10, 0))
