
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
       * |x - x'| ≤ 0.0e+00: false 
         |x - x'| = 4.10e-04 
       * |f(x) - f(x')| ≤ 0.0e+00 |f(x)|: false
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

    Starting optimization with optimizer DiffEvoOpt{FitPopulation{Float64},RadiusLimitedSelector,BlackBoxOptim.AdaptiveDiffEvoRandBin{3},RandomBound{RangePerDimSearchSpace}}
    0.00 secs, 0 evals, 0 steps
    
    Optimization stopped after 10001 steps and 0.013683080673217773 seconds
    Termination reason: Max number of steps (10000) reached
    Steps per second = 730902.6555383248
    Function evals per second = 738722.5319649422
    Improvements/step = 0.2172
    Total function evaluations = 10108
    
    
    Best candidate found: [1.0, 1.0]
    
    Fitness: 0.000000000
    





    BlackBoxOptim.OptimizationResults("adaptive_de_rand_1_bin_radiuslimited", "Max number of steps (10000) reached", 10001, 1.536689117938819e9, 0.013683080673217773, DictChain{Symbol,Any}[DictChain{Symbol,Any}[Dict{Symbol,Any}(:RngSeed=>189964,:NumDimensions=>2,:SearchRange=>(-5.0, 5.0),:MaxSteps=>10000),Dict{Symbol,Any}()],Dict{Symbol,Any}(:FitnessScheme=>ScalarFitnessScheme{true}(),:NumDimensions=>:NotSpecified,:PopulationSize=>50,:MaxTime=>0.0,:SearchRange=>(-1.0, 1.0),:Method=>:adaptive_de_rand_1_bin_radiuslimited,:MaxNumStepsWithoutFuncEvals=>100,:RngSeed=>1234,:MaxFuncEvals=>0,:SaveTrace=>false…)], 10108, ScalarFitnessScheme{true}(), BlackBoxOptim.TopListArchiveOutput{Float64,Array{Float64,1}}(7.794981123521699e-27, [1.0, 1.0]), BlackBoxOptim.PopulationOptimizerOutput{FitPopulation{Float64}}(FitPopulation{Float64}([1.0 1.0 … 1.0 1.0; 1.0 1.0 … 1.0 1.0], NaN, [1.27603e-23, 3.92402e-23, 1.60016e-23, 1.61726e-23, 2.00834e-23, 6.01524e-23, 2.16747e-22, 4.2942e-23, 3.83008e-23, 8.03423e-23  …  6.35954e-25, 1.22529e-24, 1.60825e-25, 9.94304e-25, 1.41704e-24, 6.42558e-24, 3.93374e-24, 8.25185e-24, 1.89228e-23, 1.44361e-23], 0, BlackBoxOptim.Candidate{Float64}[Candidate{Float64}([1.0, 1.0], 10, 8.03423e-23, AdaptiveDiffEvoRandBin{3}(AdaptiveDiffEvoParameters(BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.65, σ=0.1), Distributions.Cauchy{Float64}(μ=1.0, σ=0.1), 0.5, false, true), BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.1, σ=0.1), Distributions.Cauchy{Float64}(μ=0.95, σ=0.1), 0.5, false, true), [0.697891, 0.720263, 0.88478, 0.809857, 0.434573, 0.280839, 1.0, 0.653261, 0.990107, 0.54517  …  0.829696, 0.680993, 0.96154, 1.0, 0.917572, 1.0, 0.835965, 1.0, 0.996137, 0.999622], [0.830166, 0.160064, 0.153951, 1.0, 0.78871, 0.256191, 0.139636, 1.0, 0.986488, 0.229464  …  0.932861, 0.0857158, 0.0022386, 0.595109, 0.980229, 0.122564, 0.39074, 1.0, 0.848218, 0.913758])), 0), Candidate{Float64}([1.0, 1.0], 10, 8.63425e-22, AdaptiveDiffEvoRandBin{3}(AdaptiveDiffEvoParameters(BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.65, σ=0.1), Distributions.Cauchy{Float64}(μ=1.0, σ=0.1), 0.5, false, true), BimodalCauchy(Distributions.Cauchy{Float64}(μ=0.1, σ=0.1), Distributions.Cauchy{Float64}(μ=0.95, σ=0.1), 0.5, false, true), [0.697891, 0.720263, 0.88478, 0.809857, 0.434573, 0.280839, 1.0, 0.653261, 0.990107, 0.54517  …  0.829696, 0.680993, 0.96154, 1.0, 0.917572, 1.0, 0.835965, 1.0, 0.996137, 0.999622], [0.830166, 0.160064, 0.153951, 1.0, 0.78871, 0.256191, 0.139636, 1.0, 0.986488, 0.229464  …  0.932861, 0.0857158, 0.0022386, 0.595109, 0.980229, 0.122564, 0.39074, 1.0, 0.848218, 0.913758])), 0)])))



## JuMP, Convex.jl, NLopt.jl

[JuMP.jl](https://jump.readthedocs.io/en/latest/quickstart.html) is a large library for all sorts of optimization problems. It has solvers for linear, quadratic, etc. programming problems. If you're not doing nonlinear optimization JuMP is a great choice. If you're looking to do convex programming, Convex.jl is a library with methods specific for this purpose. If you want to do nonlinear optimization with constraints, NLopt.jl is a library with a large set of choices. It also has a bunch of derivative-free local optimization methods. It's only issue is that its an interface to a C library and can be more difficult to debug than the native Julia codes, but otherwise it's a great alternative to Optim and BlackBoxOptim.

## Problem 1

Use Optim.jl to optimize [Hosaki's Function](http://al-roomi.org/benchmarks/unconstrained/2-dimensions/58-hosaki-s-function). Use the initial condition `[2.0,2.0]`.

## Problem 2

BlackBoxOptim.jl to find global minima of the [Adjiman Function](https://arxiv.org/pdf/1308.4008.pdf) with $-1 < x_1 < 2$ and $-1 < x_2 < 1$.
