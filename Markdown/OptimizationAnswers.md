
# Optimization Solutions

## Problem 1


```julia
f(x) = (1 - 8x[1] + 7x[1]^2 - 7/3 * x[1]^3 + x[1]^4 / 4)*x[2]^2 * exp(-x[2])
using Optim
Optim.optimize(f,[2.0,2.0])
```




    Results of Optimization Algorithm
     * Algorithm: Nelder-Mead
     * Starting Point: [2.0,2.0]
     * Minimizer: [4.000080592514454,1.9999322044270897]
     * Minimum: -2.345812e+00
     * Iterations: 31
     * Convergence: true
       *  √(Σ(yᵢ-ȳ)²)/n < 1.0e-08: true
       * Reached Maximum Number of Iterations: false
     * Objective Calls: 64



## Problem 2


```julia
f(x) = cos(x[1])*sin(x[2])-x[1]/(x[2]^2+1)
using BlackBoxOptim
bboptimize(f,SearchRange = [(-1.0, 2.0),(-1.0,1.0)], NumDimensions = 2)
```

    Starting optimization with optimizer DiffEvoOpt{FitPopulation{Float64},RadiusLimitedSelector,BlackBoxOptim.AdaptiveDiffEvoRandBin{3},RandomBound{RangePerDimSearchSpace}}
    0.00 secs, 0 evals, 0 steps
    
    Optimization stopped after 10001 steps and 0.14388179779052734 seconds
    Termination reason: Max number of steps (10000) reached
    Steps per second = 69508.44480383904
    Function evals per second = 65227.152733129624
    Improvements/step = 0.4377
    Total function evaluations = 9385
    
    
    Best candidate found: [2.0, 0.105783]
    
    Fitness: -2.021806783
    





    BlackBoxOptim.OptimizationResults("adaptive_de_rand_1_bin_radiuslimited", "Max number of steps (10000) reached", 10001, 1.536689152035643e9, 0.14388179779052734, DictChain{Symbol,Any}[DictChain{Symbol,Any}[Dict{Symbol,Any}(:RngSeed=>586919,:NumDimensions=>2,:SearchRange=>Tuple{Float64,Float64}[(-1.0, 2.0), (-1.0, 1.0)],:MaxSteps=>10000),Dict{Symbol,Any}()],Dict{Symbol,Any}(:FitnessScheme=>ScalarFitnessScheme{true}(),:NumDimensions=>:NotSpecified,:PopulationSize=>50,:MaxTime=>0.0,:SearchRange=>(-1.0, 1.0),:Method=>:adaptive_de_rand_1_bin_radiuslimited,:MaxNumStepsWithoutFuncEvals=>100,:RngSeed=>1234,:MaxFuncEvals=>0,:SaveTrace=>false…)], 9385, ScalarFitnessScheme{true}(), BlackBoxOptim.TopListArchiveOutput{Float64,Array{Float64,1}}(-2.0218067833597875, [2.0, 0.105783]), BlackBoxOptim.PopulationOptimizerOutput{FitPopulation{Float64}}(FitPopulation{Float64}([2.0 2.0 … 2.0 2.0; 0.105783 0.105783 … 0.105783 0.105783], NaN, [-2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181  …  -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181], 0, BlackBoxOptim.Candidate{Float64}[Candidate{Float64}([2.0, 0.105783], 21, -2.02181, AdaptiveDiffEvoRandBin{3}(AdaptiveDiffEvoParameters(BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.65, σ=0.1), Distributions.Cauchy{Float64}(μ=1.0, σ=0.1), 0.5, false, true), BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.1, σ=0.1), Distributions.Cauchy{Float64}(μ=0.95, σ=0.1), 0.5, false, true), [0.986132, 0.686396, 1.0, 0.900951, 0.676487, 1.0, 1.0, 1.0, 0.568759, 0.602577  …  1.0, 0.675674, 1.0, 0.793572, 0.760721, 0.617878, 0.794706, 0.799388, 0.67912, 0.26578], [0.877314, 0.186429, 1.0, 0.649575, 0.11606, 1.0, 0.863943, 0.977893, 1.0, 0.937058  …  0.991395, 0.0777023, 1.0, 1.0, 0.954632, 1.0, 0.907233, 0.294719, 0.238339, 0.91076])), 0), Candidate{Float64}([2.0, 0.105783], 21, -2.02181, AdaptiveDiffEvoRandBin{3}(AdaptiveDiffEvoParameters(BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.65, σ=0.1), Distributions.Cauchy{Float64}(μ=1.0, σ=0.1), 0.5, false, true), BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.1, σ=0.1), Distributions.Cauchy{Float64}(μ=0.95, σ=0.1), 0.5, false, true), [0.986132, 0.686396, 1.0, 0.900951, 0.676487, 1.0, 1.0, 1.0, 0.568759, 0.602577  …  1.0, 0.675674, 1.0, 0.793572, 0.760721, 0.617878, 0.794706, 0.799388, 0.67912, 0.26578], [0.877314, 0.186429, 1.0, 0.649575, 0.11606, 1.0, 0.863943, 0.977893, 1.0, 0.937058  …  0.991395, 0.0777023, 1.0, 1.0, 0.954632, 1.0, 0.907233, 0.294719, 0.238339, 0.91076])), 0)])))


