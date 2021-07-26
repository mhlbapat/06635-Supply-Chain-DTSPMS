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
				position_U_pickup = findall(x->x==node_U, temp_pickup_route)
				position_V_pickup = findall(x->x==node_V, temp_pickup_route)

				position_U_delilvery = findall(x->x==node_U, temp_delilvery_route)
				position_V_delilvery = findall(x->x==node_V, temp_delilvery_route)

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
					insert!(temp_delilvery_route, position_V_delilvery+1, node_U)
					deleteat!(temp_delilvery_route, position_U_delilvery)
				else
					insert!(temp_delilvery_route, position_V_delilvery, node_U)
					deleteat!(temp_delilvery_route, position_U_delilvery)
				end


				## Rearrange stack assignment

				# Find out which stack node_U belongs to
				stack_of_U = findfirst(!isempty, findall.(x->x==node_U, stack_assignment))

				



				
			end
		end
	end

	return complete_swap_nhlist
end