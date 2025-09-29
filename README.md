# Numerical Mathematics (MAT/08) course

## Main topics 
This course covered fundamental and advanced topics in numerical methods, including:
- IEEE (Institute of Electrical and Electronics Engineers) arithmetic and error analysis  
- Direct and iterative methods for solving linear systems  
- Approximation of eigenvalues and eigenvectors  
- Numerical methods for nonlinear equations  
- Data approximation and interpolation techniques  
- Numerical integration formulas  
- Numerical methods for ordinary differential equations  

Practical sessions were carried out in **MATLAB**, applying the introduced algorithms to real computational problems. Here in this repository different scripts can be found about the different algorrithm implementation

## FEM4MI folder

FEM4MI is a MATLAB educational code developed for the *Numerical Analysis* course in Mathematical Engineering.  It is not an official library, but a collection of scripts and functions that implement the Finite Element Method (FEM) in 1D. The code provides a simple framework for mesh generation, assembly of matrices and right-hand sides, application of boundary conditions, error analysis, and visualization, allowing students to practice and experiment with FEM algorithms in MATLAB. For more details on how the methods work, see the text file explanation in this repository.

### FEM4MI_lab1 folder
This is a practical example on how in this course I combined the study of ordinary differential equations (ODEs) with matrix-based numerical approximations.  
Using the Finite Element Method (FEM) framework in MATLAB, boundary value problems were transformed into linear algebra systems, allowing their solution through direct factorizations and iterative methods.

In this folder we solve the following boundary value problem:

    -0.25 u''(x) = 1 - 3x²    for -1 < x < 1
    u(-1) = 0,  u(1) = 0

using the FEM4MIcode with `nRef = 5`. The task requires creating two files:
- `Eser03_dati.m` to define the problem data  
- `Eser03_main1D.m` to assemble and solve the system `A * u_h = b`

The linear system must be solved using direct methods:
1. LU factorization (`lu`)  
2. Cholesky factorization (`chol`)  

## Richardson_PCG folder 
Here is another example of what I developed during this course, including a short overview of the iterative methods studied and applied in this part of the course: 

1. The Richardson method is one of the iterative solvers for linear systems: at each step, the solution is updated along the residual direction, scaled by a parameter α.  
It can be used in two versions:
- **Stationary**: with a fixed α.  
- **Dynamic**: with an optimal α chosen at each iteration (equivalent to the gradient method).  
While conceptually simple, its convergence can be slow without preconditioning.  

2. Preconditioned CG (PCG)
The Conjugate Gradient method is an efficient iterative solver for symmetric positive definite systems. Unlike Richardson, CG builds mutually conjugate search directions, leading to much faster convergence. The preconditioned version (PCG) further improves performance by reducing numerical difficulties and accelerating convergence by working on an invertible matrix P which well approximate A.  
  

