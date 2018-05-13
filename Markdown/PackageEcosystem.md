
# Overview of the Package Ecosystem

Julia's package ecosystem is organized in terms of Github organizations. While this is informal, many of the main packages (but not all!) can be found in the various organizations.

http://julialang.org/community/

A useful source on the the changing package ecosystem (might be) found here:

http://www.pkgupdate.com/

## A Quick Look At Some Organizations

Let's take a quick look at some organizations which provide important functionality to Julia. I will go through some of the most well-developed and "ready for use orgs". Of course, there are more that I will be leaving off the list.



### JuliaLang

- JuliaLang is the Base organization
- It holds the Julia language itself
- Other core pacakges exist in JuliaLang
  - PkgDev for package development
  - IJulia
  - Compat for version compatibility
- There is a general trend of "slimming Base" to lower the Travis load on JuliaLang

### JuliaStats

- Hosts Dataframes.jl, the data frame implementation of Julia
- Distributions.jl holds probability distributions and methods for generating random numbers according to specific distributions
- The standard regression and hypothesis testing libraries are held here
- Klara.jl is a native MCMC engine
- One of the main R linear model library developers, Douglas Bates, is a heavy contributor

>As some of you may know, I have had a (rather late) mid-life crisis and run off with another language called Julia. (http://julialang.org)

Note, Dataframes used to be slow. A very large change is coming in the next week. To understand it in detail, read: http://www.johnmyleswhite.com/notebook/2015/11/28/why-julias-dataframes-are-still-slow/

## JuliaOpt

- Julia for Mathematical Programming (JuMP) is one of the premire Julia libraries. It implements a DSL for interfacing with many commercial and non-commercial mathematical optimization (linear, mixed-integer, conic, semidefinite, nonlinear) algorithms. Most of JuliaOpt can be used through JuMP
- Optim.jl are a set of native Julia optimization algorithms
- An interesting fact is that the creator of NLopt is a heavy contributor to Julia and JuliaOpt

## JuliaParallel

Bindings to many popular parallel libraries / APIs are found in JuliaParallel:

- DistributedArrays.jl: A distributed array implmentation
- PETSc.jl
- MPI.jl
- ScaLAPACK.jl

## JuliaGPU

Bindings for common GPU libraries:

- ArrayFire.jl
- CUDArt.jl
- CUSPARSE.jl
- CUDNN.jl
- CUFFT.jl
- CUBLAS.jl

JuliaGPU is also developing a framework for easy GPU usage:

- CUDAnative.jl
- GPUArrays.jl

## JuliaDiff

JuliaDiff holds libraries for differentiation in Julia

- ForwardDiff.jl: A robust implementation of forward-mode autodifferentiation
- ReverseDiffSource.jl: A newer library for reverse-mode autodifferentiation (backwards propogation)

## JuliaGraphs

JuliaGraphs is built around LightGraphs.jl, a fast and performant implementation of graph algorithms in Julia

## JuliaMath

JuliaMath holds basic mathematical libraries.

- IterativeSolvers.jl: Iterative methods for `Ax=b`, Krylov subspace methods, etc.
- Roots.jl: Root-finding algorithms

## JuliaDiffEq

JuliaDiffEq holds the packages for solving differential equations.

- DifferentialEquations.jl: The core package for solving ODEs, SDEs, PDEs, DAEs, DDEs, jump problems, etc.
- Sundials.jl: Wrappers for the Sundials ODE/DAE solvers

## JuliaInterop

Interoperability of Julia with other languages.

- MATLAB.jl
- RCall.jl
- Mathematica.jl
- JavaCall.jl
- CxxWrap.jl
- ObjectiveC.jl

## JuliaPy

Julia interop with Python

- PyPlot.jl: A wrapper for the Python matplotlib library
- SymPy.jl
- PyCall.jl
- pyjulia
- Pandas.jl

## Misc

- JLD.jl: An HDF5-based saving format for Julia
- Bio.jl: A huge library for bioinformatics in Julia
