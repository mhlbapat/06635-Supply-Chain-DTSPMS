include("constants.jl")
include("functions/distance_between_nodes_matrix.jl")
include("functions/initial_solution_generator.jl")
include("functions/route_swap.jl")


pickupnodes, deliverynodes, stacks = initial_solution_generator(10)

# println(stacks)

route_swap_neighborhood = route_swap(pickupnodes,deliverynodes,stacks)

# println(size(route_swap_neighborhood))
# println(route_swap_neighborhood[2])