
# stoichiometric matrix: fluxes (in order) are v1-v6 (v6 is reverse of v5), b1-b20
S = [-1 0 0 1 2 -2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; #citrulline
     -1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;  #aspartate
     1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; #arginosuccinate
     0 1 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; #fumarate
     0 1 -1 0 -2 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; #arginine
     0 0 1 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;  #ornithine
     0 0 1 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; #urea
     0 0 0 -1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; #carbamoyl phosphate
     -1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0; #ATP
     1 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0; #AMP
     1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0; #diphosphate
     0 0 0 1 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0 0 0 0; #phosphate
     0 0 0 0 -3 3 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0 0 0; #NADPH
     0 0 0 0 -3 3 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0 0 0; #H+
     0 0 0 0 -4 4 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0 0 0; #O2
     0 0 0 0 2 -2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0 0 0; #NO2
     0 0 0 0 3 -3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1 0 0; #NADP+
     0 0 -1 0 4 -4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1]; #H2O

#atom matrix: C H N O P S 
A = [6 13 3 3 0 0; #citrulline
    4 7 1 4 0 0;  #aspartate
    10 18 4 6 0 0; #arginosuccinate
    4 4 0 4 0 0; #fumarate
    6 14 4 2 0 0; #arginine
    5 12 2 2 0 0; #ornithine
    1 4 2 1 0 0; #urea
    1 4 1 5 1 0; #carbamoyl phosphate
    10 16 5 13 3 0; #ATP
    10 14 5 7 1 0;  #AMP
    0 4 0 7 2 0;  #diphosphate
    0 3 0 4 1 0;  #phosphate
    21 30 7 17 3 0; #NADPH
    0 1 0 0 0 0; #H+
    0 0 0 2 0 0; #O2
    0 0 1 1 0 0; #NO
    21 29 7 17 3 0; #NADP+
    0 2 0 1 0 0] #H2O

e = transpose(A)*S

#look at only the balances for v1-v6, species are not balanced over boundaries
print(e[:,1:6])

 