using HashCode2014
using HashBlotto

city = read_city()
graph = graph_structure(city)

@time solution = greed(city; penalty=0.01)
distance = total_distance(solution, city)

@elapsed solution = greed(city; penalty=0.01)
@profview greed(city; penalty=0.01)
@code_warntype greed(city; penalty=0.01)
# graph_structure(city::City)

function upper_bound(city::City)
    graph_struct = graph_structure(city)
    street_durs = collect(values(graph_struct)) 
    clean_streets = Tuple{Int64, Int64, Float16}[] # (B, dur, ratio)
    for a in street_durs # Remove nested listing
        for street in a
            push!(clean_streets, street)
        end
    end
    sorted_edges = sort(
        clean_streets; by = x -> x[3], rev=true
    )

    curr_time, updates = 0, Float32[]
    AllowedTime = 18000*8
    for edge in sorted_edges
        duration, ratio = edge[2], edge[3]
        if curr_time < AllowedTime
            curr_time += duration
            push!(updates,duration*ratio)
        end
        if curr_time >= AllowedTime
            break
        end
    end
    updates
end

sum(upper_bound(city))