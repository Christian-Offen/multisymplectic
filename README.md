# Repository "multisymplectic"
Backward error Lagrangian for travelling wave in discretised nonlinear wave equation

I am providing files that can be used to verify the computational example presented in chapter 13 (Section 13.4) of my PhD thesis as well as in Appendix C. Moreover, files for the numerical experiments of section 13.5 can be found in the corresponding subfolder. For these, please refer to the Readme.md files in the corresponding subfolders.

Instructions.
Save the content of the repository locally and open the Wolfram Mathematica Notebook file "MAIN_Compute_Lagrangian.nb". The notebook displays computational results for the modified Lagrangian up to (including) order 6. Here, the rotation constant alpha is set to zero. The modified 2nd order ODE for general alpha is displayed the notebook "Reduced_BackwardODE.nb".

Moreover, the following computed variables "order, phi2Red, LAnsatzsolas" are saved in the file "ComputedData.wl" which is contained in the zip-folder "ComputedData.zip". The variables can be loaded into a Mathematica notebook using the command "Get" (after unzipping). For an illustration how to load the computed data, please extract "ComputedData.zip" into the directory in which the notebook "LoadScript.nb" is located and view or run the notebook "LoadScript.nb". The variables have the following meaning:

order = The order up to which the backward error analysis was performed. The value is inclusive.

phi2Red = The modified ODE for a rotating travelling wave in the discretised nonlinear wave equation.

LAnsatzsolas = The computed modified Lagrangian for the non-rotational case (alpha=0) 

To run the files, please follow the instructions outlined in "MAIN_Compute_Lagrangian.nb".

If you run the files (without commenting out save commands) the computed data saved in "ComputedData.wl" will be overwritten. Alternatively, use DumpSave to save computed values locally. However, note that this makes the data platform dependent.

The scripts have been tested in Wolfram Mathematica 11.0.1.0. 

To cite this work please use the doi 10.5281/zenodo.3726256
