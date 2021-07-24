import Random
include("../constants.jl")
include("../functions/distance_between_nodes_matrix.jl")
include("../functions/initial_solution_generator.jl")

function instack_swap(pickup_route, delivery_route, stack_assignment)
	#=
	Input: Pickup route, delivery route and stack assignment

	Output: The in-stack swap neighborhood
	=#

	length_route = length(pickup_route)

	# Instack swap neighborhood list
	instack_swap_nhlist = []

	for i in 1:length_route
		for j in i:length_route

			temp_stack_assignment = deepcopy(stack_assignment)
			temp_pickup_route = deepcopy(pickup_route)
			temp_delivery_route = deepcopy(delivery_route)

			node1 = temp_pickup_route[i]
			node2 = temp_pickup_route[j]

			if any([(node1 in temp_stack_assignment[j1]) && (node2 in temp_stack_assignment[j1]) for j1 in 1:nstacks])

				# Replace in stack assignment
				replace.(temp_stack_assignment, node1=>node2,node2=>node1)

				# Replace in pickup route
				replace!(temp_pickup_route, node1=>node2, node2=>node1) 

				# Replace in delivery route
				replace!(temp_delivery_route, node1=>node2, node2=>node1) 
			end

		# Update neighborhood list
		if (temp_pickup_route, temp_delivery_route, temp_stack_assignment) ∉ instack_swap_nhlist
			append!(instack_swap_nhlist, [(temp_pickup_route, temp_delivery_route, temp_stack_assignment)])
		end

		end
	end

	return instack_swap_nhlist
end