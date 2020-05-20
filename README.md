# Repository "multisymplectic"
Backward error analysis for travelling wave in discretised nonlinear wave equation

The following Wolfram Mathematica Notebooks compute modified data for a rotating travelling wave in the nonlinear wave equation discretised by the 5-point stencil. 

1) The folder "Modified_Hamiltonian_System" contains scripts to compute the modified Hamiltonian system governing the dynamics. 
2) The folder "Lmod_PSeries_Ansatz" contains scripts to compute the modified Lagrangian in the case of non-rotating travelling waves using a P-Series ansatz.
3) The folder "Lmod_Polynomial_Ansatz" contains scripts to compute the modified Lagrangian using a polynomial ansatz. Due to theoretical constraints it can only work in special cases such as not rotation, zero wave speed, or special choices of the discretisation parameters.
4) To compute the modified ODE governing the dynamics, run "ModODE_TravellingWave.nb". 
5) The folder "Numerical_Experiment" contains MATLAB scripts to run numerical experiments with the computed data.

The script listed in the above enumerated list work independently. For detailed information on how to run the scripts refer to the README.md files in the subfolders.

To cite this work, please cite the zenodo doi of most current release.

