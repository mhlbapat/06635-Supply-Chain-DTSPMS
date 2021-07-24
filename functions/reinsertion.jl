import Random
include("../constants.jl")
include("../functions/distance_between_nodes_matrix.jl")
include("../functions/initial_solution_generator.jl")

function reinsertion(pickup_route, delivery_route, stack_assignment)
	#=
	Input: Pickup route, delivery route and stack assignment

	Output: The re-insertion neighborhood
	=#

	length_route = length(pickup_route)

	# Re-insertion neighborhood list
	reinsertion_nhlist = []

	for i in 1:length_route
		for j in 1:length_route
			temp_stack_assignment = deepcopy(stack_assignment)
			temp_pickup_route = deepcopy(pickup_route)
			temp_delivery_route = deepcopy(delivery_route)

			node_U = temp_pickup_route[i]
			node_V = temp_pickup_route[j]

			if node_U != node_V
				position_U = findall!(x->x==node_U,temp_pickup_route)
			end
		end
	end

	return complete_swap_nhlist
end