import Random
include("../constants.jl")
include("../functions/distance_between_nodes_matrix.jl")
include("../functions/initial_solution_generator.jl")

function objective_function(distance_matrix_pickup, distance_matrix_delivery, pickup_route, delivery_route)
	#=
	Input: Distance matrices for pickup and delivery, pickup and delivery routes

	Output: The objective function to be optimized
	=#

	# distance_matrix_pickup = distance_between_nodes_matrix(datafile*"p.tsp")
	# distance_matrix_delivery = distance_between_nodes_matrix(datafile*"d.tsp")

	length_route = length(pickup_route)
	cost_pickup = 0
	cost_delivery = 0

	for i in 1:(length_route-1)
		cost_pickup = cost_pickup + distance_matrix_pickup[i,i+1]
		cost_delivery = cost_delivery + distance_matrix_delivery[i,i+1]
	end

	cost_pickup = cost_pickup + distance_matrix_pickup[pickup_route[1],pickup_route[end]]
	cost_delivery = cost_delivery + distance_matrix_delivery[delivery_route[1], delivery_route[end]]

	cost_function = cost_pickup + cost_delivery



	return cost_function


end