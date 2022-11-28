"""

    best_sol output(solution)

Generates a .txt file using the pr





"""


function best_sol_ouptut(solution::Solution)
    
    path = pwd() * "/output.txt"

    open(path, "w") do f
        for sol in solution.itineraries
            write(f, string(sol))
            write(f, "\n")
        end
    end
end
