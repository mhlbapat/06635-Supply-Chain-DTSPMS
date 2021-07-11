import DataFrames as df
import CSV
import LinearAlgebra as linalg

function distance_between_nodes_matrix(datafile)
	#=
	Input: Distance file, Node 1, Node 2
	(Offset wrt to distance file by 1.
	So node 0 in file is considered node 1 here for simplicity)

	Output: Euclidean distance between Node 1 and Node 2
	=#

	datafile_data = CSV.File(datafile; delim=" ", header=false, skipto=7)
	data = df.DataFrame(datafile_data)
	total_nodes_datafile = size(data)[1]

	# Square matrix of distances, distance_matrix[i][j] is the distance between node i and node j
	distance_matrix = zeros(total_nodes_datafile, total_nodes_datafile)

	for i in 1:total_nodes_datafile
		for j in 1:total_nodes_datafile
			node1 = Array(data[i,2:3])
			node2 = Array(data[j,2:3])

			distance_matrix[i,j] = linalg.norm(node1-node2)
		end

	end

	return distance_matrix

end