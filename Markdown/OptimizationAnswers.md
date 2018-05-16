
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

    Starting optimization with optimizer BlackBoxOptim.DiffEvoOpt{BlackBoxOptim.FitPopulation{Float64},BlackBoxOptim.RadiusLimitedSelector,BlackBoxOptim.AdaptiveDiffEvoRandBin{3},BlackBoxOptim.RandomBound{BlackBoxOptim.RangePerDimSearchSpace}}
    0.00 secs, 0 evals, 0 steps
    
    Optimization stopped after 10001 steps and 0.1119999885559082 seconds
    Termination reason: Max number of steps (10000) reached
    Steps per second = 89294.65198121603
    Function evals per second = 84160.7228852057
    Improvements/step = 0.4438
    Total function evaluations = 9426
    
    
    Best candidate found: [2.0, 0.105783]
    
    Fitness: -2.021806783
    





    BlackBoxOptim.OptimizationResults("adaptive_de_rand_1_bin_radiuslimited", "Max number of steps (10000) reached", 10001, 1.526432786132e9, 0.1119999885559082, BlackBoxOptim.DictChain{Symbol,Any}[BlackBoxOptim.DictChain{Symbol,Any}[Dict{Symbol,Any}(Pair{Symbol,Any}(:RngSeed, 154997),Pair{Symbol,Any}(:NumDimensions, 2),Pair{Symbol,Any}(:SearchRange, Tuple{Float64,Float64}[(-1.0, 2.0), (-1.0, 1.0)]),Pair{Symbol,Any}(:MaxSteps, 10000)),Dict{Symbol,Any}()],Dict{Symbol,Any}(Pair{Symbol,Any}(:FitnessScheme, BlackBoxOptim.ScalarFitnessScheme{true}()),Pair{Symbol,Any}(:NumDimensions, :NotSpecified),Pair{Symbol,Any}(:PopulationSize, 50),Pair{Symbol,Any}(:MaxTime, 0.0),Pair{Symbol,Any}(:SearchRange, (-1.0, 1.0)),Pair{Symbol,Any}(:Method, :adaptive_de_rand_1_bin_radiuslimited),Pair{Symbol,Any}(:MaxNumStepsWithoutFuncEvals, 100),Pair{Symbol,Any}(:RngSeed, 1234),Pair{Symbol,Any}(:MaxFuncEvals, 0),Pair{Symbol,Any}(:SaveTrace, false)…)], 9426, BlackBoxOptim.ScalarFitnessScheme{true}(), BlackBoxOptim.TopListArchiveOutput{Float64,Array{Float64,1}}(-2.0218067833597875, [2.0, 0.105783]), BlackBoxOptim.PopulationOptimizerOutput{BlackBoxOptim.FitPopulation{Float64}}(BlackBoxOptim.FitPopulation{Float64}([2.0 2.0 … 2.0 2.0; 0.105783 0.105783 … 0.105783 0.105783], NaN, [-2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181  …  -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181, -2.02181], 0, BlackBoxOptim.Candidate{Float64}[BlackBoxOptim.Candidate{Float64}([2.0, 0.105783], 21, -2.02181, BlackBoxOptim.AdaptiveDiffEvoRandBin{3}(BlackBoxOptim.AdaptiveDiffEvoParameters(BlackBoxOptim.BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.65, σ=0.1), Distributions.Cauchy{Float64}(μ=1.0, σ=0.1), 0.5, false, true), BlackBoxOptim.BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.1, σ=0.1), Distributions.Cauchy{Float64}(μ=0.95, σ=0.1), 0.5, false, true), [0.71526, 0.549525, 0.344875, 1.0, 1.0, 1.0, 1.0, 1.0, 0.621643, 0.518125  …  1.0, 0.572988, 1.0, 0.67638, 0.844529, 0.973839, 0.646751, 1.0, 0.627774, 0.569942], [0.665647, 0.0263581, 1.0, 0.294965, 0.990308, 0.730801, 0.158922, 1.0, 0.149218, 0.303809  …  0.431312, 0.908928, 0.873739, 0.948262, 0.96043, 0.923217, 0.0858731, 0.864825, 1.0, 0.870881])), 0), BlackBoxOptim.Candidate{Float64}([2.0, 0.105783], 21, -2.02181, BlackBoxOptim.AdaptiveDiffEvoRandBin{3}(BlackBoxOptim.AdaptiveDiffEvoParameters(BlackBoxOptim.BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.65, σ=0.1), Distributions.Cauchy{Float64}(μ=1.0, σ=0.1), 0.5, false, true), BlackBoxOptim.BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.1, σ=0.1), Distributions.Cauchy{Float64}(μ=0.95, σ=0.1), 0.5, false, true), [0.71526, 0.549525, 0.344875, 1.0, 1.0, 1.0, 1.0, 1.0, 0.621643, 0.518125  …  1.0, 0.572988, 1.0, 0.67638, 0.844529, 0.973839, 0.646751, 1.0, 0.627774, 0.569942], [0.665647, 0.0263581, 1.0, 0.294965, 0.990308, 0.730801, 0.158922, 1.0, 0.149218, 0.303809  …  0.431312, 0.908928, 0.873739, 0.948262, 0.96043, 0.923217, 0.0858731, 0.864825, 1.0, 0.870881])), 0)])))


