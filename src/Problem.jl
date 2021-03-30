# ----------------------------------------------------------------------------------- #
# Copyright (c) 2018 Varnerlab
# Robert Frederick Smith School of Chemical and Biomolecular Engineering
# Cornell University, Ithaca NY 14850
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
# Function: generate_problem_dictionary
# Description: Holds simulation and model parameters as key => value pairs in a Julia Dict()
# Generated on: 2018-03-15T00:00:56.939
#
# Output arguments:
# data_dictionary::Dict{AbstractString,Any} => Dictionary holding model and simulation parameters as key => value pairs
# ----------------------------------------------------------------------------------- #
function generate_problem_dictionary()

	# Load the stoichiometric network from disk -
	path_to_network_file = joinpath(_PATH_TO_CONFIG,"Network.dat")
	stoichiometric_matrix = readdlm(path_to_network_file);

	# What is the system dimension? -
	(number_of_species,number_of_reactions) = size(stoichiometric_matrix)

	# Setup the flux bounds array -
	flux_bounds_array = zeros(number_of_reactions,2)
	
	E = 0.01/1000 # [E] in mmol/gDW
	# since we are assuming max activity, lower bound = upper bound = Vmax = kcat*E
	flux_bounds_array[1,2] = E*203*3600 #v1, in mmol/gDW-hr
	flux_bounds_array[2,2] = E*34.5*3600 #v2, in mmol/gDW-hr
	flux_bounds_array[3,2] = E*249*3600 #v3, in mmol/gDW-hr
	flux_bounds_array[4,2] = E*88.1*3600 #v4, in mmol/gDW-hr
	flux_bounds_array[5,2] = E*13.7*3600 #v5, in mmol/gDW-hr
	flux_bounds_array[6,2] = E*13.7*3600 #v6, in mmol/gDW-hr

	flux_bounds_array[7:26,2] .= 10 #upper bound of bj, in mmol/gDW-hr
	


	# Setup default species bounds array -
	species_bounds_array = zeros(number_of_species,2)
	# TODO: NOTE - we by default assume Sv = 0, so species_bounds_array should be a M x 2 array of zeros
	# TODO: however, if you formulate the problem differently you *may* need to change this 

	# Min/Max flag - default is minimum -
	is_minimum_flag = true

	# Setup the objective coefficient array -
	objective_coefficient_array = zeros(number_of_reactions)
	# TODO: update me to maximize Urea production (Urea leaving the virtual box)
	# TODO: if is_minimum_flag = true => put a -1 in the index for Urea export
	if is_minimum_flag == 1
		objective_coefficient_array[10] = -1;
	end
	
	# =============================== DO NOT EDIT BELOW THIS LINE ============================== #
	data_dictionary = Dict{String,Any}()
	data_dictionary["stoichiometric_matrix"] = stoichiometric_matrix
	data_dictionary["objective_coefficient_array"] = objective_coefficient_array
	data_dictionary["flux_bounds_array"] = flux_bounds_array;
	data_dictionary["species_bounds_array"] = species_bounds_array
	data_dictionary["is_minimum_flag"] = is_minimum_flag
	data_dictionary["number_of_species"] = number_of_species
	data_dictionary["number_of_reactions"] = number_of_reactions
	# =============================== DO NOT EDIT ABOVE THIS LINE ============================== #
	return data_dictionary
end
