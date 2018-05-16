
# Optimization

## Local Nonlinear Optimization with Optim.jl

One of the core libraries for nonlinear optimization is Optim.jl. Optim.jl is a lot like the standard optimizers you'd find in SciPy or MATLAB. You give it a function and it finds the minimum. For example, if you give it a univariate function it uses Brent's method to find the minimum in an interval:



```julia
using Optim
f(x) = sin(x)+cos(x)
Optim.optimize(f,0.0,2π) # Find a minimum between 0 and 2π
```




    Results of Optimization Algorithm
     * Algorithm: Brent's Method
     * Search Interval: [0.000000, 6.283185]
     * Minimizer: 3.926991e+00
     * Minimum: -1.414214e+00
     * Iterations: 11
     * Convergence: max(|x - x_upper|, |x - x_lower|) <= 2*(1.5e-08*|x|+2.2e-16): true
     * Objective Function Calls: 12



If you give it a function which requires vector input with scalar output, it will give the vector local minima:


```julia
f(x) = sin(x[1])+cos(x[1]+x[2])
Optim.optimize(f,zeros(2)) # Find a minimum starting at [0.0,0.0]
```




    Results of Optimization Algorithm
     * Algorithm: Nelder-Mead
     * Starting Point: [0.0,0.0]
     * Minimizer: [-1.570684758073873,-1.5708688186478836]
     * Minimum: -2.000000e+00
     * Iterations: 49
     * Convergence: true
       *  √(Σ(yᵢ-ȳ)²)/n < 1.0e-08: true
       * Reached Maximum Number of Iterations: false
     * Objective Calls: 95



You can refer to Optim's [large library of methods](http://julianlsolvers.github.io/Optim.jl/latest/) and pass in a method choice to have different properties. Let's choose BFGS:


```julia
Optim.optimize(f,zeros(2),BFGS())
```




    Results of Optimization Algorithm
     * Algorithm: BFGS
     * Starting Point: [0.0,0.0]
     * Minimizer: [-1.5707963314270867,-1.5707963181008544]
     * Minimum: -2.000000e+00
     * Iterations: 6
     * Convergence: true
       * |x - x'| ≤ 1.0e-32: false 
         |x - x'| = 4.10e-04 
       * |f(x) - f(x')| ≤ 1.0e-32 |f(x)|: false
         |f(x) - f(x')| = -9.67e-08 |f(x)|
       * |g(x)| ≤ 1.0e-08: true 
         |g(x)| = 4.06e-09 
       * Stopped by an increasing objective: false
       * Reached Maximum Number of Iterations: false
     * Objective Calls: 15
     * Gradient Calls: 15



## Global Nonlinear Optimization with BlackBoxOptim.jl

Global optimization is provided with a native Julia implementation at BlackBoxOptim.jl. You have to give it box constraints and tell it the size of the input vector:


```julia
using BlackBoxOptim

function rosenbrock2d(x)
  return (1.0 - x[1])^2 + 100.0 * (x[2] - x[1]^2)^2
end
res = bboptimize(rosenbrock2d; SearchRange = (-5.0, 5.0), NumDimensions = 2)
```

    Starting optimization with optimizer BlackBoxOptim.DiffEvoOpt{BlackBoxOptim.FitPopulation{Float64},BlackBoxOptim.RadiusLimitedSelector,BlackBoxOptim.AdaptiveDiffEvoRandBin{3},BlackBoxOptim.RandomBound{BlackBoxOptim.RangePerDimSearchSpace}}
    0.00 secs, 0 evals, 0 steps
    
    Optimization stopped after 10001 steps and 0.021000146865844727 seconds
    Termination reason: Max number of steps (10000) reached
    Steps per second = 476234.7646370954
    Function evals per second = 482282.3413903112
    Improvements/step = 0.1993
    Total function evaluations = 10128
    
    
    Best candidate found: [1.0, 1.0]
    
    Fitness: 0.000000000
    





    BlackBoxOptim.OptimizationResults("adaptive_de_rand_1_bin_radiuslimited", "Max number of steps (10000) reached", 10001, 1.526431919393e9, 0.021000146865844727, BlackBoxOptim.DictChain{Symbol,Any}[BlackBoxOptim.DictChain{Symbol,Any}[Dict{Symbol,Any}(Pair{Symbol,Any}(:RngSeed, 1466),Pair{Symbol,Any}(:NumDimensions, 2),Pair{Symbol,Any}(:SearchRange, (-5.0, 5.0)),Pair{Symbol,Any}(:MaxSteps, 10000)),Dict{Symbol,Any}()],Dict{Symbol,Any}(Pair{Symbol,Any}(:FitnessScheme, BlackBoxOptim.ScalarFitnessScheme{true}()),Pair{Symbol,Any}(:NumDimensions, :NotSpecified),Pair{Symbol,Any}(:PopulationSize, 50),Pair{Symbol,Any}(:MaxTime, 0.0),Pair{Symbol,Any}(:SearchRange, (-1.0, 1.0)),Pair{Symbol,Any}(:Method, :adaptive_de_rand_1_bin_radiuslimited),Pair{Symbol,Any}(:MaxNumStepsWithoutFuncEvals, 100),Pair{Symbol,Any}(:RngSeed, 1234),Pair{Symbol,Any}(:MaxFuncEvals, 0),Pair{Symbol,Any}(:SaveTrace, false)…)], 10128, BlackBoxOptim.ScalarFitnessScheme{true}(), BlackBoxOptim.TopListArchiveOutput{Float64,Array{Float64,1}}(1.755239653260451e-23, [1.0, 1.0]), BlackBoxOptim.PopulationOptimizerOutput{BlackBoxOptim.FitPopulation{Float64}}(BlackBoxOptim.FitPopulation{Float64}([1.0 1.0 … 1.0 1.0; 1.0 1.0 … 1.0 1.0], NaN, [1.61958e-21, 3.34085e-21, 5.68053e-21, 2.31703e-20, 1.09389e-20, 5.71653e-21, 6.68369e-22, 6.89362e-21, 6.52675e-21, 4.057e-21  …  4.30743e-22, 2.6898e-21, 1.26068e-20, 2.27065e-20, 1.24454e-19, 2.36923e-19, 4.26575e-21, 5.41387e-21, 7.61718e-21, 3.85335e-20], 0, BlackBoxOptim.Candidate{Float64}[BlackBoxOptim.Candidate{Float64}([1.0, 1.0], 24, 1.42957e-21, BlackBoxOptim.AdaptiveDiffEvoRandBin{3}(BlackBoxOptim.AdaptiveDiffEvoParameters(BlackBoxOptim.BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.65, σ=0.1), Distributions.Cauchy{Float64}(μ=1.0, σ=0.1), 0.5, false, true), BlackBoxOptim.BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.1, σ=0.1), Distributions.Cauchy{Float64}(μ=0.95, σ=0.1), 0.5, false, true), [0.701635, 0.822804, 0.497025, 0.686208, 1.0, 0.588519, 0.922643, 0.497291, 0.494365, 1.0  …  1.0, 0.560735, 0.748291, 0.626623, 0.546719, 1.0, 1.0, 0.950497, 0.911785, 0.80654], [0.73129, 0.0617889, 0.909293, 1.0, 1.0, 0.104108, 1.0, 0.937073, 1.0, 0.980383  …  0.0305664, 0.922521, 0.114515, 0.0876894, 1.0, 0.454371, 0.182781, 0.246594, 1.0, 0.894807])), 0), BlackBoxOptim.Candidate{Float64}([1.0, 1.0], 24, 3.43826e-20, BlackBoxOptim.AdaptiveDiffEvoRandBin{3}(BlackBoxOptim.AdaptiveDiffEvoParameters(BlackBoxOptim.BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.65, σ=0.1), Distributions.Cauchy{Float64}(μ=1.0, σ=0.1), 0.5, false, true), BlackBoxOptim.BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.1, σ=0.1), Distributions.Cauchy{Float64}(μ=0.95, σ=0.1), 0.5, false, true), [0.701635, 0.822804, 0.497025, 0.686208, 1.0, 0.588519, 0.922643, 0.497291, 0.494365, 1.0  …  1.0, 0.560735, 0.748291, 0.626623, 0.546719, 1.0, 1.0, 0.950497, 0.911785, 0.80654], [0.73129, 0.0617889, 0.909293, 1.0, 1.0, 0.104108, 1.0, 0.937073, 1.0, 0.980383  …  0.0305664, 0.922521, 0.114515, 0.0876894, 1.0, 0.454371, 0.182781, 0.246594, 1.0, 0.894807])), 0)])))



## JuMP, Convex.jl, NLopt.jl

[JuMP.jl](https://jump.readthedocs.io/en/latest/quickstart.html) is a large library for all sorts of optimization problems. It has solvers for linear, quadratic, etc. programming problems. If you're not doing nonlinear optimization JuMP is a great choice. If you're looking to do convex programming, Convex.jl is a library with methods specific for this purpose. If you want to do nonlinear optimization with constraints, NLopt.jl is a library with a large set of choices. It also has a bunch of derivative-free local optimization methods. It's only issue is that its an interface to a C library and can be more difficult to debug than the native Julia codes, but otherwise it's a great alternative to Optim and BlackBoxOptim.

## Problem 1

Use Optim.jl to optimize [Hosaki's Function](http://al-roomi.org/benchmarks/unconstrained/2-dimensions/58-hosaki-s-function). Use the initial condition `[2.0,2.0]`.

## Problem 2

BlackBoxOptim.jl to find global minima of the [Adjiman Function](https://arxiv.org/pdf/1308.4008.pdf) with $-1 < x_1 < 2$ and $-1 < x_2 < 1$.
