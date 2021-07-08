import Random
include("../constants.jl")


function initial_solution_generator(pickup_nodes, delivery_nodes)
#= 
Input: pickup, delivery arrays

Output: Randomized initial solution returning pickup_route, delivery_route and stack assignment
=#	
	

	# Generate initial pickup route:
	random_initial_solution_pickup = Random.shuffle(pickup_nodes)
	
	# Assign stacks:
	stack_assignment = [[] for i in 1:nstacks]
	[append!(stack_assignment[mod(i, nstacks)+1], random_initial_solution_pickup[i]) for i in 1:length(random_initial_solution_pickup)]

	# Randomly decide the delivery route:
	# There are 3 ways: reverese, stack-wise reverse and random-stack-select
	delivery_method = begin
		index_way = rand(1:3)
		all_methods = ["reverese", "stack-wise reverse", "random stack select"]
		all_methods[index_way]
	end

	delivery_method = "stack-wise reverse"

	if delivery_method == all_methods[1]
		random_initial_solution_delivery = reverse(random_initial_solution_pickup)	

	elseif delivery_method == all_methods[2]
		random_initial_solution_delivery = Array{Int64}([])
		[append!(random_initial_solution_delivery, i) for i in stack_assignment]
		

	elseif delivery_method == all_methods[3]
		random_initial_solution_delivery = []
		route_length = length(random_initial_solution_pickup)
		temp_stack_assignment = Array(stack_assignment)
		append!(random_initial_solution_delivery, pop!(temp_stack_assignment[rand(1:length())]))
		
	end

	# println(flatten(stack_assignment))
	println(random_initial_solution_pickup, "   ",stack_assignment, "  delivery_nodes: ", random_initial_solution_delivery)
	# println(stack_assignment[3])



end

initial_solution_generator([1,2,3,4,5,10,111,12], [1,2,3,4,5])