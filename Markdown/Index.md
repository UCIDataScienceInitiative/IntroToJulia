
# A Nontrivial Introduction to Julia for Data Science and Scientific Computing

## Introduction

This workshop is put together by Chris Rackauckas as part of the UC Irvine Data Science Initiative. This workshop is made to teach people who are experienced with other scripting languages the relatively new language Julia. Unlike the other Data Science Initiative workshops, this workshop assumes prior knowledge of some form of programming in a language such as Python, R, or MATLAB.

We will start by introducing the basic syntax of the language, and quickly move into the details of how Julia is different from other scripting languages and how to exploit Julia's type system + multiple dispatch to be able to achieve C/Fortran-like performance while maintaining the concise syntax of a scripting language. Large parts of the package ecosystem will be explored and some information on implementation details will be highlighted in order for the participants to learn how to design Julia projects.

The ideal participant is anyone who is interested in Julia. There are many groups of people interested in using Julia. One large fraction come with a strong software development background and C/Fortran knowledge, and are looking to learn Julia as a tool to create packages with enhanced productivity while not losing performance. On the other side, there are users who are interested in the growing package ecosystem of Julia and would like to add Julia to their knowledge-base. And then there's everything in between. One major goal of this workshop is to use Julia's language and syntax to bridge the gap between "package users" and "package developers" in the way that Julia has done. 


## Introduction to the Author

Chris is a PhD student in Mathematics from the Mathematical, Computational, and Systems Biology (MCSB) Gateway program and is an active part of the Julia community. He runs the blog, http://www.stochasticlifestyle.com/, where he write tutorials on using the Julia languages covering many topics, such as high-performance and GPGPU computing, package development, and Julia tips. He is part of the JuliaMath and JuliaDiffEq communities for curating the Julia libraries for mathematics and differential equations respectively. Chris is the developer of many Julia packages, the most prominent being [DifferentialEquations.jl](https://github.com/JuliaDiffEq/DifferentialEquations.jl), a Julia library with the large goal of being a standard solver for many forms of differential equations.

## Installation and Setup

To get started, see the [Tooling, Documentation, and Community notebook](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ToolingDocumentationCommunity).

## Jupyter Notebooks


### Basics

- [Tooling, Documentation, and Community](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ToolingDocumentationCommunity)
- [A Very Quick Introduction to Git/Github for Julia Users](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/GithubIntroduction)
- [An Introduction to Basic Julia](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/BasicIntroduction)
- [Why Julia?](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/WhyJulia)

### Detailed Usage

- [More Details on Arrays and Matrices](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ArraysAndMatrices)
- [Call Overloading](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/CallOverloading)
- [Overview of the Package Ecosystem](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/PackageEcosystem)
- [An In-Depth Look at Plots.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/PlotsJL)
- [Parallelism](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/Parallelism)
- [Array and Iterator Interfaces](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ArrayIteratorInterfaces)
- [Metaprogramming](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/Metaprogramming)

### Projects / Experiments

- [Type-Stability Experiment](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/TypeStabilityExperiment)
- [Scoping Experiment](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ScopingExperiment)
- [HPC Julia](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/HPCProject)
- [Logistic Bifurcation Diagram](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/LogisticProject)


---------------------------
# Extras
---------------------------


## Slides


### Basics

- [Tooling, Documentation, and Community](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/ToolingDocumentationCommunity)
- [A Very Quick Introduction to Git/Github for Julia Users](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/GithubIntroduction)
- [An Introduction to Basic Julia](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/BasicIntroduction)
- [Why Julia?](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/WhyJulia)

### Detailed Usage

- [More Details on Arrays and Matrices](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/ArraysAndMatrices)
- [Call Overloading](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/CallOverloading)
- [Overview of the Package Ecosystem](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/PackageEcosystem)
- [An In-Depth Look at Plots.jl](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/PlotsJL)
- [Parallelism](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/Parallelism)
- [Array and Iterator Interfaces](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/ArrayIteratorInterfaces)
- [Metaprogramming](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/Metaprogramming)

### Projects / Experiments
- [Type-Stability Experiment](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/TypeStabilityExperiment)
- [Scoping Experiment](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/ScopingExperiment)
- [HPC Julia](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/HPCProject)
- [Logistic Bifurcation Diagram](http://ucidatascienceinitiative.github.io/IntroToJulia/Slides/LogisticProject)

## How These Were Made

This entire repository is made using Jupyter notebooks using the template from the [JupyterSite](https://github.com/ChrisRackauckas/JupyterSite) repository.
