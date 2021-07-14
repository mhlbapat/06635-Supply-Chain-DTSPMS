include("constants.jl")
include("functions/distance_between_nodes_matrix.jl")
include("functions/initial_solution_generator.jl")
include("functions/route_swap.jl")


pickupnodes, deliverynodes, stacks = initial_solution_generator(33)

# println(stacks)

# route_swap_neighborhood = route_swap(pickupnodes,deliverynodes,stacks)
# println(size(route_swap_neighborhood))
println(pickupnodes)
println(deliverynodes)
println([length(stacks[i]) for i in 1:nstacks])
# println(route_swap_neighborhood)