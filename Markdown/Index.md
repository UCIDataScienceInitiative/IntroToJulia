
# A Deep Introduction to Julia for Data Science and Scientific Computing

## Introduction

This workshop is put together by Chris Rackauckas as part of the UC Irvine Data Science Initiative. This workshop is made to teach people who are experienced with other scripting languages the relatively new language Julia. Unlike the other Data Science Initiative workshops, this workshop assumes prior knowledge of some form of programming in a language such as Python, R, or MATLAB.

We will start by introducing the basic syntax of the language, and quickly move into the details of how Julia is different from other scripting languages and how to exploit Julia's type system + multiple dispatch to be able to achieve C/Fortran-like performance while maintaining the concise syntax of a scripting language. Large parts of the package ecosystem will be explored and some information on implementation details will be highlighted in order for the participants to learn how to design Julia projects.

The ideal participant is anyone who is interested in Julia. There are many groups of people interested in using Julia. One large fraction come with a strong software development background and C/Fortran knowledge, and are looking to learn Julia as a tool to create packages with enhanced productivity while not losing performance. On the other side, there are users who are interested in the growing package ecosystem of Julia and would like to add Julia to their knowledge-base. And then there's everything in between. One major goal of this workshop is to use Julia's language and syntax to bridge the gap between "package users" and "package developers" in the way that Julia has done. 

#### This is very problem-focused. The method is not passive: the goal is to get you using Julia!


## Introduction to the Author

Chris is a PhD student in Mathematics from the Mathematical, Computational, and Systems Biology (MCSB) Gateway program and is an active part of the Julia community. He runs the blog, http://www.stochasticlifestyle.com/, where he write tutorials on using the Julia languages covering many topics, such as high-performance and GPGPU computing, package development, and Julia tips. He is part of the JuliaMath and JuliaDiffEq communities for curating the Julia libraries for mathematics and differential equations respectively. Chris is the developer of many Julia packages, the most prominent being [DifferentialEquations.jl](https://github.com/JuliaDiffEq/DifferentialEquations.jl), a Julia library which has become a standard solver for many forms of differential equations.

## Notes Before We Get Started

- Please install some version of IJulia/Jupyter to follow along. I also recommend working through longer problems using the Juno IDE.
- The start of the course will be on developing general performant Julia code. After lunch it will be about the package ecosystem. This understanding of Julia will be useful even for "Julia users" (i.e. non package developers) to use packages effectively, but don't worry we will get to packages. 
- Please do the problems/projects at your own pace. Not everyone is expected to complete all of the material in the allotted time. **Some of the problems are supposed to be hard!** Instead, this is supposed to be a resource to introduce you to a large amount of Julia, and the material may take awhile to fully be digested. That's okay!
- During the basic introduction, there will be information that is not included in these notebooks. That is intentional. One major hurdle for learning a language is learning how to find out more about the language. Please use the manual, chatrooms, StackExchange, etc. If these aren't working for you, ask for help.

A good primer for the workshop: https://www.youtube.com/watch?v=JNvMs0j3a4E

## Installation and Setup

To get started, see the [Tooling, Documentation, and Community notebook](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ToolingDocumentationCommunity).

## Rendered Jupyter Notebooks

### Introduction

- [Tooling, Documentation, and Community](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ToolingDocumentationCommunity)
- [Juno, the Julia IDE (Debugging, Progress Bars, etc.): JunoLab](http://docs.junolab.org/latest/)
- [A Mental Model for Julia](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/JuliaMentalModel)
- [A Very Quick Introduction to Git/Github for Julia Users](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/GithubIntroduction)

### Basics

- [A Basic Introduction to Julia](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/BasicIntroduction)
- [Why Julia?](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/WhyJulia)
- [More Details on Arrays and Matrices - How to get Fortran Speeds in Linear Algebra](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ArraysAndMatrices)
- [The Julia Manual](https://docs.julialang.org/en/stable/)
- [The Julia Wikibook](https://en.wikibooks.org/wiki/Introducing_Julia)
- [Noteworthy Differences from Other Languages (Julia's Manual)](https://docs.julialang.org/en/stable/manual/noteworthy-differences/)
- [Julia Cheatsheet Reference (with MATLAB and Python)](https://cheatsheets.quantecon.org/)

### General Problems

- [Basic Problems](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/BasicProblems)
- [Intermediate Problems](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/IntermediateProblems)
- [Advanced Problems](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/AdvancedProblems)

### Detailed Usage: A Peek Into "the Rabbit Hole"

- [Multiple Dispatch Designs: Duck Typing, Hierarchies and Traits](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/DispatchDesigns)
- [Metaprogramming](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/Metaprogramming)
- [Call Overloading](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/CallOverloading)
- [7 Julia Gotchas and How to Handle Them](http://www.stochasticlifestyle.com/7-julia-gotchas-handle/)
- [Array and Iterator Interfaces](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ArrayIteratorInterfaces)

### Packages to Explore (with Problems!)

This section introduces you to a wide variety of packages for data science and scientific computing in Julia. Many of these pages have example problems for you to have a guided tour through the package basics.

- [Overview of the Package Ecosystem](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/PackageEcosystem)

#### Data Science

- [Clustering: Clustering.jl and Distances.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/Clustering)
- [Dimensionality Reduction: MultivariateStats.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/DimensionalityReduction)
- [Data Visualization: Plots.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/PlotsJL)
- Bioinformatics: Bio.jl
- Deep Learning: Flux.jl

#### Scientific Computing

- [Differential Equations: DifferentialEquations.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/DiffEq)
- [Solving Nonlinear Equations: NLsolve.jl and Roots.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/NonlinearSolve)
- [Graph Algorithms and Analysis: LightGraphs.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/Graphs)

#### Both!

- [Mathematical Programming / Optimization: JuMP and Optim.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/Optimization)
- [Forward-mode Autodifferentiation (with Optimization): ForwardDiff.jl and Optim.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ForwardDiff)

### Extra Projects and Problems

- [Using External Languages from Julia (Interop)](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/Interop)
- [Parallelism and HPC](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/HPCJulia)
- [Package Development, Documentation, and Testing](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/PackageDevelopment)
- Robust Benchmarking: [BenchmarkTools.jl](https://github.com/JuliaCI/BenchmarkTools.jl) and [ProfileView.jl](https://github.com/timholy/ProfileView.jl)

### Experiments

Probe around and understand the following results:

- [Type-Stability Experiment](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/TypeStabilityExperiment)
- [Scoping Experiment](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ScopingExperiment)


---------------------------
# Problem Answers
---------------------------

#### Answers to the Problems
- [Basic Problem Answers](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/BasicProblemAnswers)
- [Intermediate Problem Answers](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/IntermediateProblemAnswers)
- [Advanced Problem Answers](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/AdvancedProblemAnswers)
- [Answer to the LightGraphs Problem](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/LightGraphsAnswers)
- [Answer to the Nonlinear Solver Problems](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/NonlinearSolveAnswers)
- [Answer to the DiffEq Problems](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/DiffEqSolutions)
- [Answer to Dimensionality Reduction Problem](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/DimensionalityReductionSolutions)
- [Answer to Clustering Problem](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ClusteringSolutions)

# Slide Versions of the Pages

### Introduction

- [Tooling, Documentation, and Community](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/ToolingDocumentationCommunity)
- [A Mental Model for Julia](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/JuliaMentalModel)
- [A Very Quick Introduction to Git/Github for Julia Users](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/GithubIntroduction)

### Basics

- [A Basic Introduction to Julia](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/BasicIntroduction)
- [Basic Problems](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/BasicProblems)
- [Intermediate Problems Problems](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/BasicProblems)
- [Why Julia?](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/WhyJulia)

### Detailed Usage: A Peak Into "the Rabbit Hole"

- [Metaprogramming](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/Metaprogramming)
- [Call Overloading](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/CallOverloading)
- [Array and Iterator Interfaces](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/ArrayIteratorInterfaces)
- [More Details on Arrays and Matrices - How to get Fortran Speeds from Linear Algebra](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/ArraysAndMatrices)

### Packages to Explore

- [Overview of the Package Ecosystem](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/PackageEcosystem)
- [Data Visualization: Plots.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/PlotsJL)
- [Differential Equations: DifferentialEquations.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/DiffEq)
- [Clustering: Clustering.jl and Distances.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/Clustering)
- [Dimensionality Reduction: MultivariateStats.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/DimensionalityReduction)
- [Mathematical Programming / Optimization: JuMP and Optim.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/Optimization)
- [Solving Nonlinear Equations: NLsolve.jl and Roots.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/NonlinearSolve)
- [Forward-mode Autodifferentiation (with Optimization): ForwardDiff.jl and Optim.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/ForwardDiff)
- [Graph Algorithms and Analysis: LightGraphs.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/Graphs)
- Bioinformatics: Bio.jl
- Deep Learning: KNet.jl, TensorFlow.jl, MXNet.jl, and Flux.jl


### Extra Projects and Problems

- [Using External Languages from Julia (Interop)](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/Interop)
- [Parallelism and HPC](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/HPCJulia)
- [Work in Progress: JuliaML for Machine Learning](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/JuliaML)
- [Package Development, Documentation, and Testing](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/PackageDevelopment)
- Tools for Faster Code: [InplaceOps.jl](https://github.com/simonbyrne/InplaceOps.jl), [CatViews.jl](https://github.com/ahwillia/CatViews.jl), and [VML.jl](https://github.com/JuliaMath/VML.jl)
- Robust Benchmarking: [BenchmarkTools.jl](https://github.com/JuliaCI/BenchmarkTools.jl) and [ProfileView.jl](https://github.com/timholy/ProfileView.jl)

### Experiments

Probe around and understand the following results:

- [Type-Stability Experiment](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/TypeStabilityExperiment)
- [Scoping Experiment](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/ScopingExperiment)

## How These Were Made

This entire repository is made using Jupyter notebooks using the template from the [JupyterSite](https://github.com/ChrisRackauckas/JupyterSite) repository. To contribute to these materials, see [the Github repository](https://github.com/UCIDataScienceInitiative/IntroToJulia).
