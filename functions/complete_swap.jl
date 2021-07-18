import Random
include("../constants.jl")
include("../functions/distance_between_nodes_matrix.jl")
include("../functions/initial_solution_generator.jl")

function complete_swap(pickup_route, delivery_route, stack_assignment)
	#=
	Input: Pickup route, delivery route and stack assignment

	Output: The complete swap neighborhood
	=#

	length_route = length(pickup_route)

	# Complete swap neighborhood list
	complete_swap_nhlist = []

	for i in 1:length_route
		for j in i:length_route
			
		end
	end