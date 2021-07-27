include("constants.jl")
include("functions/distance_between_nodes_matrix.jl")
include("functions/initial_solution_generator.jl")
include("functions/route_swap.jl")
include("functions/complete_swap.jl")
include("functions/instack_swap.jl")
include("functions/reinsertion.jl")


pickupnodes, deliverynodes, stacks = initial_solution_generator(33)
reinsertion_neighborhood = reinsertion(pickupnodes,deliverynodes,stacks)

println(length(reinsertion_neighborhood), "    ", 33^2)