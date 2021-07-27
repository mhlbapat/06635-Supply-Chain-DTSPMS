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

			node_U = temp_pickup_route[i] # This is the node to be shifted
			node_V = temp_pickup_route[j]

			if node_U != node_V
				position_U_pickup = findall(x->x==node_U, temp_pickup_route)[1]
				position_V_pickup = findall(x->x==node_V, temp_pickup_route)[1]

				position_U_delilvery = findall(x->x==node_U, temp_delivery_route)[1]
				position_V_delilvery = findall(x->x==node_V, temp_delivery_route)[1]

				# Change in pickup route
				if position_U_pickup < position_V_pickup
					insert!(temp_pickup_route, position_V_pickup+1,node_U)
					deleteat!(temp_pickup_route, position_U_pickup)
				else
					insert!(temp_pickup_route, position_V_pickup, node_U)
					deleteat!(temp_pickup_route, position_U_pickup)
				end

				# Change in delivery route
				if position_U_delilvery < position_V_delilvery
					insert!(temp_delivery_route, position_V_delilvery+1, node_U)
					deleteat!(temp_delivery_route, position_U_delilvery)
				else
					insert!(temp_delivery_route, position_V_delilvery, node_U)
					deleteat!(temp_delivery_route, position_U_delilvery)
				end


				## Rearrange stack assignment

				# Find out which stack node_U belongs to and choose from remaining stacks randomly
				stack_of_U = findfirst(!isempty, findall.(x->x==node_U, stack_assignment))
				new_stack_of_U = rand(setdiff(collect(1:nstacks), stack_of_U))

				# Remove the node_U from temp_stack_assignment from old stack
				deleteat!(temp_stack_assignment[stack_of_U], findall(y->y==node_U, temp_stack_assignment[stack_of_U]))
				
				new_position_of_U_delivery = findall(x->x==node_U, temp_delivery_route)[1]

				# Remove last element from the new_stack_of_U
				println(new_stack_of_U)
				println(temp_stack_assignment)
				last_node_new_stack_of_U = temp_stack_assignment[new_stack_of_U][end]
				deleteat!(temp_stack_assignment[new_stack_of_U], findall(y->y==last_node_new_stack_of_U, temp_stack_assignment[new_stack_of_U]))


				# Find the items delivered before node_U and in the new stack of node_U
				delivered_before_U_new_stack = intersect(temp_delivery_route[1:(new_position_of_U_delivery-1)], temp_stack_assignment[new_stack_of_U])
				position_of_U_new_stack = minimum([findall(x->x==delivered_before_U_new_stack[l], temp_stack_assignment[new_stack_of_U]) for l in 1:length(delivered_before_U_new_stack)])
				insert!(temp_stack_assignment[new_stack_of_U], position_of_U_new_stack, node_U)

				# Insert last_node_new_stack_of_U into stack_of_U such that its position is before the items delivered before it
				position_last_node_nsU = findall(x->x==last_node_new_stack_of_U, temp_delivery_route)
				delivered_before_last_node_nsU = intersect(temp_delivery_route(1:(position_last_node_nsU-1)), temp_stack_assignment[stack_of_U])
				position_of_item_before_last_node_nsU = minimum([findall(x->x==delivered_before_last_node_nsU[l], temp_stack_assignment[stack_of_U]) for l in 1:length(delivered_before_last_node_nsU)])
				insert!(temp_stack_assignment[stack_of_U], position_of_item_before_last_node_nsU, last_node_new_stack_of_U)

				# Append into the nhlist
				if (temp_pickup_route, temp_delivery_route, temp_stack_assignment) ∉ reinsertion_nhlist
					append!(reinsertion_nhlist, [(temp_pickup_route, temp_delivery_route, temp_stack_assignment)])
				end





				
			end
		end
	end

	return reinsertion_nhlist
end