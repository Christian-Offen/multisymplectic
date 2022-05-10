# Backward error analysis on symmetric solutions of PDEs

The following Wolfram Mathematica Notebooks show an approach to backward error analysis for PDEs by analysing modified equations for highly symmetric solutions. In particular, the notebooks allow to compute modified data for a rotating travelling wave in the nonlinear wave equation discretised by the 5-point stencil.
The files accompany the preprint

	Backward error analysis for variational discretisations of partial differential equations
	Robert I McLachlan, Christian Offen
	To appear in Journal of Geometric Mechanics 
	https://arxiv.org/abs/2006.14172

Also see

  *Computational_Results_documented.pdf
  
for details on the analysis, a description of the computational examples, and a presentation of the computational results. Additionally, the file

  *BEA_Leapfrog.nb
  
illustrates on a classical example the presented method of backward error analysis.

1) The folder "Modified_Hamiltonian_System" contains scripts to compute the modified Hamiltonian system governing the dynamics of the rotating travelling wave.
2) The folder "Lmod_PSeries_Ansatz" contains scripts to compute the modified Lagrangian in the case of non-rotating travelling waves using a P-Series ansatz.
3) The folder "Lmod_Polynomial_Ansatz" contains scripts to compute the modified Lagrangian using a polynomial ansatz. Due to theoretical constraints it can only work in special cases such as no rotation, zero wave speed, or special choices of the discretisation parameters. 
4) The folder "Numerical_Experiment" contains MATLAB scripts to run numerical experiments with the computed data.

The script in each subfolder are independent of the scripts in other subfolders. For detailed information on how to run the scripts refer to the README.md files in the subfolders.

To cite this work, please cite the corresponding publication (once it is available). For this, see https://arxiv.org/abs/2006.14172, https://ris.uni-paderborn.de/person/85279, or https://orcid.org/0000-0002-5940-8057

