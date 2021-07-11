import CSV
import DataFrames

cd("../Datasets/0")

function distance_between_nodes_matrix(datafile)
	#=
	Input: Distance file, Node 1, Node 2
	(Offset wrt to distance file by 1.
	So node 0 in file is considered node 1 here for simplicity)

	Output: Euclidean distance between Node 1 and Node 2
	=#
	datafile_data = CSV.File(datafile; delim=" ", header=false, skipto=7)
	data = DataFrames.DataFrame(datafile_data)
	# node1 = 1
	# node2 = 2
	# node1_coord = data[node1,2]
	# node2_coord = data[node2,2]


	# println(node1_coord)
	# println(node2_coord)



end


distance_between_nodes_matrix("R00d.tsp")