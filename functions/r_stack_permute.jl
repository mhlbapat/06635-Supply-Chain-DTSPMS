import Random
include("../constants.jl")
include("../functions/distance_between_nodes_matrix.jl")
include("../functions/initial_solution_generator.jl")

function r_stack_permute(pickup_route, delivery_route, stack_assignment)
	#=
	Input: Pickup route, delivery route and stack assignment

	Output: The r-Stack Permutation neighborhood
	=#

	length_route = length(pickup_route)

	# r-Stack Permutation neighborhood list
	r_stack_permute_nhlist = []

	for i in 1:length_route
		for j in 1:length_route
			temp_stack_assignment = deepcopy(stack_assignment)
			temp_pickup_route = deepcopy(pickup_route)
			temp_delivery_route = deepcopy(delivery_route)

			rvalues = [3,4,5]

			for k in 1:nstacks
				for rvalue_current in rvalues
					
				end
			end

			
		end
	end

	return r_stack_permute_nhlist
end