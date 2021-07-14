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

	# Swap for pickup route only
	for i in 1:length_route-1
		temp_stack_assignment = deepcopy(stack_assignment)
		temp_pickup_route = deepcopy(pickup_route)
		temp_delivery_route = deepcopy(delivery_route)

		# Swap in pickup route
		temp_pickup_route[i], temp_pickup_route[i+1] = temp_pickup_route[i+1], temp_pickup_route[i]

		# Check if in the same stack
		if any([(temp_pickup_route[i] in temp_stack_assignment[j]) && (temp_pickup_route[i+1] in temp_stack_assignment[j]) for j in 1:nstacks])
			# Swap in stack assignment
			replace.(temp_stack_assignment, temp_pickup_route[i]=>temp_pickup_route[i+1], temp_pickup_route[i+1]=>temp_pickup_route[i])

			# Swap in delivery route
			replace!(temp_delivery_route, temp_pickup_route[i]=>temp_pickup_route[i+1], temp_pickup_route[i+1]=>temp_pickup_route[i])
			
		end

		if (temp_pickup_route, temp_delivery_route, temp_stack_assignment) ∉ route_swap_nhlist
			append!(route_swap_nhlist, [(temp_pickup_route, temp_delivery_route, temp_stack_assignment)])
		end
	end


	for i in 1:length_route-1
		temp_dstack_assignment = deepcopy(stack_assignment)
		temp_dpickup_route = deepcopy(pickup_route)
		temp_ddelivery_route = deepcopy(delivery_route)

		# Swap in delivery route now:
		temp_ddelivery_route[i], temp_ddelivery_route[i+1] = temp_ddelivery_route[i+1], temp_ddelivery_route[i]

		# Check if the delivery was made from same stack
		if any([(temp_ddelivery_route[i] in temp_dstack_assignment[j]) && (temp_ddelivery_route[i+1] in temp_dstack_assignment[j]) for j in 1:nstacks])
			# Swap in stack assignment
			replace.(temp_dstack_assignment, temp_ddelivery_route[i]=>temp_ddelivery_route[i+1], temp_ddelivery_route[i+1]=>temp_ddelivery_route[i])

			# Swap in pickup route
			replace!(temp_dpickup_route, temp_ddelivery_route[i]=>temp_ddelivery_route[i+1], temp_ddelivery_route[i+1]=>temp_ddelivery_route[i])
		end

		if (temp_dpickup_route, temp_ddelivery_route, temp_dstack_assignment) ∉ route_swap_nhlist
			append!(route_swap_nhlist, [(temp_dpickup_route, temp_ddelivery_route, temp_dstack_assignment)])
		end
	end


	return route_swap_nhlist

end