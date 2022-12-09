"""
    upper_bound 

Obtain an upper bound based on a city, using a relaxation 
that allows teleportation between vertices
"""

function upper_bound(city::City, time)
    graph_struct = graph_structure(city; bidir=false)
    street_durs = collect(values(graph_struct))
    clean_streets = Tuple{Int64,Int64,Float16}[] # (B, dur, ratio)
    for a in street_durs # Remove nested listing
        for street in a
            push!(clean_streets, street)
        end
    end
    sorted_edges = sort(clean_streets; by=x -> x[3], rev=true)

    curr_time, updates = 0, Float32[]
    AllowedTime = time * 8
    for edge in sorted_edges
        duration, ratio = edge[2], edge[3]
        if curr_time < AllowedTime
            curr_time += duration
            push!(updates, duration * ratio)
        end
        if curr_time >= AllowedTime
            break
        end
    end
    return sum(updates)
end
