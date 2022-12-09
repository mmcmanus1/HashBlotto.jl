using HashCode2014
using HashBlotto
using Test

# Ensure within AllowedTime
unvisited = Dict{Int,Int}()
d₁, r₁, penalty = 10, 2, 0.5 - 0.01 # duration, distance/duration, penalty
tied_street_candidates = Tuple{Int64,Int64,Float16}[
    (2, d₁, r₁), (3, d₁, r₁), (4, d₁, r₁), (5, d₁, r₁)
]
untied_street_candidates = Tuple{Int64,Int64,Float16}[
    (2, d₁, r₁), (3, d₁, r₁ * 2), (4, d₁, r₁ * 4), (5, d₁, r₁ * 8)
]
visited₅ = Dict{Int,Int}(5 => 1)

"""
    unvisited_test(city::City)

Tests that get_best_street returns the best ratio, given no visited penalties
"""

function unvisited_test()
    return get_best_street(untied_street_candidates, unvisited, penalty) ==
           Tuple{Int64,Int64,Float16}((5, 10, r₁ * 8))
end

"""
tie_breaker_test(city::City)

Tests that get_best_street can handle ties
"""
function tie_breaker_test()
    return get_best_street(tied_street_candidates, unvisited, penalty) in
           tied_street_candidates
end

# Reminder that our penalty is of form val * penalty ^ visited[node] 

"""
    visited_test(city::City)

Tests that get_best_street returns the best ratio when there are visited notes, given a penalty slightly lower than a half
"""
function visited_test()
    return get_best_street(untied_street_candidates, visited₅, penalty) ==
           Tuple{Int64,Int64,Float16}((4, d₁, r₁ * 4))
end

"""
    visited_test_2(city::City)

Tests that get_best_street returns the best ratio when there are visited notes, given a penalty slightly greater than a half
"""

@test get_best_street(untied_street_candidates, unvisited, penalty) ==
    Tuple{Int64,Int64,Float16}((5, 10, r₁ * 8))
@test get_best_street(tied_street_candidates, unvisited, penalty) in tied_street_candidates
@test get_best_street(untied_street_candidates, visited₅, penalty) ==
    Tuple{Int64,Int64,Float16}((4, d₁, r₁ * 4))
@test get_best_street(untied_street_candidates, visited₅, penalty + 0.02) ==
    Tuple{Int64,Int64,Float16}((5, d₁, r₁ * 8))
