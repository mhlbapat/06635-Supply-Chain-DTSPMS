import Random
include("../constants.jl")
include("../functions/distance_between_nodes_matrix.jl")
include("../functions/initial_solution_generator.jl")

function route_swap(pickup_route, delivery_route, stack_assignment)
	#=
	Input: Pickup route, delivery route and stack assignment

	Output: The route swap neighborhood
	=#

	length_route = length(pickup_route)

	# Route swap neighborhood list
	route_swap_nhlist = []

	for i in 1:length_route-1
		temp_stack_assignment = deepcopy(stack_assignment)
		temp_pickup_route = deepcopy(pickup_route)
		temp_delivery_route = deepcopy(delivery_route)

		# Swap in pickup route
		temp_pickup_route[i], temp_pickup_route[i+1] = temp_pickup_route[i+1], temp_pickup_route[i]

		if 

	end


end