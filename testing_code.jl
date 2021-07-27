include("constants.jl")
include("functions/distance_between_nodes_matrix.jl")
include("functions/initial_solution_generator.jl")
include("functions/route_swap.jl")
include("functions/complete_swap.jl")
include("functions/instack_swap.jl")
include("functions/reinsertion.jl")


pickupnodes, deliverynodes, stacks = initial_solution_generator(11)
a = [1,2,3,4,5]
# instack_swap_neighborhood = instack_swap(pickupnodes,deliverynodes,stacks)
# println(size(route_swap_neighborhood))
# println(pickupnodes)
# println(deliverynodes)
# println([length(stacks[i]) for i in 1:nstacks])
# println(length(instack_swap_neighborhood))
# println(33^2)
# println(length(instack_swap_neighborhood)/33^2)
# println(binomial(33,2))
reinsertion_neighborhood = reinsertion(pickupnodes,deliverynodes,stacks)

println(length(reinsertion_neighborhood))