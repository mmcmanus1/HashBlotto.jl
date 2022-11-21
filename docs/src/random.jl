"""

    random_walk(iterations = num)

Generates a random walk solution

"""

function random_walking(iterations::Int64=8)
    solution = [1]
    
    random_solutions = []

    city = read_city()
    #store the iterations in a list
    ran_array = []

    for i in 1:iterations
        #generate a random number between 1 and 8
        random_number = rand(1:8)
        #push the random number into the array
        push!(ran_array, random_number)
    end

    return ran_array
end

    

    