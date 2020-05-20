# Repository "multisymplectic"

The provided Wolfram Mathematica files can be used to compute the modified Hamiltonian system which governs rotating travelling waves in the non-linear wave equation discretised by the 5-point stencil. 

The result for the modified Hamiltonian is contained in the file "ComputeHmod.nb". 
The result for the modified symplectic structure is contained in the file "SymplecticStructure.nb".
The result for the modified conserved rotational quantity is contained in the file "ComputeImod.nb". 

When running the scripts, run 
1) "ModLSymJetSpace.nb" first, which computes the high order data. The order is set in the variable "order". Then run 
2) "ComputeHmod.nb" followed by
3) "SymplecticStructure.nb".

The scripts have been created and tested in Wolfram Mathematica 12.0.

To cite this work, please cite the zenodo doi of most current release.
