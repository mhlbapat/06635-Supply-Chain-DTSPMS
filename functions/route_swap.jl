import Random
include("../constants.jl")
include("../functions/distance_between_nodes_matrix.jl")
include("../functions/initial_solution_generator.jl")

function route_swap(pickup_route, delivery_route, stack_assignment)
	#=
	Input: Pickup route, delivery route and stack assignment

	Output: The route swap neighborhood
	=#

	# distance_matrix_pickup = distance_between_nodes_matrix(datafile*"p.tsp")
	# distance_matrix_delivery = distance_between_nodes_matrix(datafile*"d.tsp")

	length_route = length(pickup_route)
	


end