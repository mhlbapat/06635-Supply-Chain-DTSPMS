import Random
include("../constants.jl")

function initial_solution_generator(N_nodes)
#= 
Input: Number of pickup/delivery nodes

Output: Randomized initial solution returning pickup_route, delivery_route and stack assignment
=#	
	

	# Generate initial pickup route:
	random_initial_solution_pickup = Random.shuffle(collect(1:N_nodes))
	
	# Assign stacks: 3 ways to assign stacks
	stack_assignment_method = begin
		all_stack_methods = ["random stacks", "i mod m", " floor(i/Q)"]
		all_stack_methods[rand(1:length(all_stack_methods))]
	end

	if stack_assignment_method == all_stack_methods[1]
		stack_assignment = [[] for i in 1:nstacks]
		for i in 1:length(random_initial_solution_pickup)
			available_stacks = findall(x->length(x) < stack_capacity, stack_assignment)
			append!(stack_assignment[available_stacks[rand(1:length(available_stacks))]], random_initial_solution_pickup[i])
		end
	
	elseif stack_assignment_method == all_stack_methods[2]
		stack_assignment = [[] for i in 1:nstacks]
		[append!(stack_assignment[mod(i, nstacks)+1], random_initial_solution_pickup[i]) for i in 1:length(random_initial_solution_pickup)]
		stack_assignment = Array(stack_assignment)
	
	elseif stack_assignment_method == all_stack_methods[3]
		stack_assignment = [[] for i in 1:nstacks]
		for i in 1:length(random_initial_solution_pickup)
			append!(stack_assignment[Int64(floor(i/(stack_capacity+0.1))+1)], random_initial_solution_pickup[i])
		end

	end

	# Randomly decide the delivery route:
	# There are 3 ways: reverese, stack-wise reverse and random-stack-select
	delivery_method = begin
		all_methods = ["reverese", "stack-wise reverse", "random stack select"]
		all_methods[rand(1:length(all_methods))]
	end

	if delivery_method == all_methods[1]
		random_initial_solution_delivery = reverse(random_initial_solution_pickup)	

	elseif delivery_method == all_methods[2]
		random_initial_solution_delivery = Array{Int64}([])
		[append!(random_initial_solution_delivery, i) for i in stack_assignment]
		

	elseif delivery_method == all_methods[3]
		random_initial_solution_delivery = Array{Int64}([])
		temp_stack_assignment = deepcopy(stack_assignment)

		while any(!isempty(temp_stack_assignment[i]) for i in 1:length(temp_stack_assignment))
			
			temp_stack_index = rand(1:length(temp_stack_assignment))

			if !isempty(temp_stack_assignment[temp_stack_index])
				temp_stack_append_element = pop!(temp_stack_assignment[temp_stack_index])
			else
				continue
			end

			append!(random_initial_solution_delivery, temp_stack_append_element)
		end

		
	end

	return (random_initial_solution_pickup, random_initial_solution_delivery, stack_assignment)


end