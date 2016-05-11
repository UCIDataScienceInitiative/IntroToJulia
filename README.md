# IntroToJulia

[![Join the chat at https://gitter.im/ChrisRackauckas/IntroToJulia](https://badges.gitter.im/ChrisRackauckas/IntroToJulia.svg)](https://gitter.im/ChrisRackauckas/IntroToJulia?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
Repository for the workshop *A Nontrivial Introduction to Julia for Data Science and Scientific Computing* by Chris Rackauckas.

**Prerequisites:** Previous experience with a scripting language (R/Python/MATLAB etc.).

**Contact**: Please mail [crackauc@uci.edu](mailto:crackauc@uci.edu) for more information.

## <a name="Repository Contents"></a>Repository Contents

* Slides
  * [introToJulia.pdf](Slides/introToJulia.pdf), the slides for the workshop
* Example Code
  * [juliaIntroCode.jl](ExampleCode/juliaIntroCode.jl), code for introducing Julia constructs
  * [scoping.jl](ExampleCode/scoping.jl), code for detailing Julia's scoping behavior
  * [jobScript.sh](ExampleCode/jobScript.sh), an example job script for SGE clusters (UCI's)
  * [test.jl](ExampleCode/test.jl), small Julia script for testing multi-node parallelism
  * [animateExample.jl](ExampleCode/animateExample.jl), a script for producing an animation.



## <a name="Syllabus"></a>Syllabus

* Basic Introduction
  * Why Julia? When to choose Julia?
  * Installing/Building Julia, Setting up an IDE
  * Package Management and Github
  * Basic usage: control statements, types, and functions
  * Where to get help: documentation, message boards, etc.
  * Plotting and Data Visualization in R
  * Data visualization & Statistical Analysis
* Fundamentals of Julia
  * Differences from other common languages
  * Linear algebra
  * Data-oriented programming
  * Macro meta-programming
  * Levels of parallelization
  * De-vectorization, SIMD, threading
  * Named functions
  * Subscoping
  * LLVM
* Guided Projects
  * Mathematical Modeling
  * Data Visualization
  * Multi-node HPC ("Julia's MPI")
  * Investigating LLVM
  * Modules and Package Development
  * Langugage Bindings
  * Data Saving and Serialization

* * *

## <a name="Instructions"></a>Pre-Workshop Instructions

Installing Julia beforehand is not required, though highly recommended. Attendees may wish to install the Julia/Atom IDE before the workshop, though be advised this may not be easy (https://github.com/JunoLab/atom-julia-client/tree/master/manual). Help for doing so can be found at the UCI Data Science Initiative Gitter (https://gitter.im/UCIDataScienceInitiative/Julia) and the JunoLab Gitter (https://gitter.im/JunoLab/Juno). Note that on Windows you need to include the Julia path in your environment: `C:\Users\<USERNAME>\AppData\Local\Julia-0.4.5\bin`. Before the workshop we will have a one-hour installation session for users who are having issues.
