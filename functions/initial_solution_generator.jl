import Random

cd("..")
include("../constants.jl")


function initial_solution_generator(pickup_nodes, delivery_nodes)
#= 
Input: pickup, delivery arrays

Output: Randomized initial solution returning pickup_route, delivery_route and stack assignment
=#
	random_initial_solution_pickup = Random.shuffle(pickup_nodes)
	stack_assignment = [[] for i in 1:nstacks]
	[append!(stack_assignment[mod(i, nstacks)+1], random_initial_solution_pickup[i]) for i in 1:length(random_initial_solution_pickup)]

	println(random_initial_solution_pickup, "   ",stack_assignment)
	println(stack_assignment[3])



end

initial_solution_generator([1,2,3,4,5,10,111,12], [1,2,3,4,5])

