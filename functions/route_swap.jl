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
			index_of_temp_i = [findfirst(!isempty, findall.(x->x==temp_pickup_route[i], temp_stack_assignment)), findall.(x->x==temp_pickup_route[i], temp_stack_assignment)[findfirst(!isempty, findall.(x->x==temp_pickup_route[i],temp_stack_assignment))][1]]
			index_of_temp_iplus1 = [findfirst(!isempty, findall.(x->x==temp_pickup_route[i+1], temp_stack_assignment)), findall.(x->x==temp_pickup_route[i+1], temp_stack_assignment)[findfirst(!isempty, findall.(x->x==temp_pickup_route[i+1], temp_stack_assignment))][1]]
			temp_stack_assignment[index_of_temp_i], temp_stack_assignment[index_of_temp_iplus1] = temp_stack_assignment[index_of_temp_iplus1], temp_stack_assignment[index_of_temp_i]

			# Swap in delivery route
			temp_delivery_route[findall(x->x==temp_pickup_route[i],temp_delivery_route)], temp_delivery_route[findall(x->x==temp_pickup_route[i+1],temp_delivery_route)] = temp_delivery_route[findall(x->x==temp_pickup_route[i+1],temp_delivery_route)], temp_delivery_route[findall(x->x==temp_pickup_route[i],temp_delivery_route)]
		end

		if (temp_pickup_route, temp_delivery_route, temp_stack_assignment) ∉ route_swap_nhlist
			append!(route_swap_nhlist, [(temp_pickup_route, temp_delivery_route, temp_stack_assignment)])
		end
	end

	




	return route_swap_nhlist

end