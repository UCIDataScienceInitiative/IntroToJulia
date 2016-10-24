
## The Array and Iterator Interface

Julia has a few "informal" interfaces. The idea is that, if you subclass a given abstract type and implement a few methods, then by multiple dispatch the type will now "act like" whatever you want it to act like, in any instance you would like.

One example is the array interface. The methods to implement are:

- `size(A)`
- `getindex(A, i::Int)`
- `getindex(A, I::Vararg{Int, N})`
- `setindex!(A, v, i::Int)`
- `setindex!(A, v, I::Vararg{Int, N})`

`size(A)` returns what the size of the array is as a tuple. For example, a 3-dimensional "array" (remember, it can be anything, we are just saying it acts like an array!) would have `size(A)` return a tuple `(dim1,dim2,dim3)` for the sizes along each dimension. `getindex` is the function that is used by `A[i]`, and `setindex!` is the function for mutating `A` via `A[i]=`. 

The `Vararg{Int, N}` just means variable numbers of arguments, so for example `getindex(A,i1,i2)` is what is called by `A[i1,i2]`. More generally, using slurping you can define `getindex(A,I...)` and the function for `A[i1,i2,...,in]`, and `I` will be a tuple of `(i1,i2,...,in)`.

Reference: http://docs.julialang.org/en/release-0.5/manual/interfaces/

## Usage Example

One usage example is in DifferentialEquations.jl. When you solve a differential equation, the solution returns a specialized solution type.


```julia
using DifferentialEquations
sol = solve(prob_ode_linear)
```




    DifferentialEquations.ODESolution, 4 timesteps, final value 1.372803219752981



While there are many fields that the type could hold, such as the errors of a given analytical solution:


```julia
println(sol)
```

    DifferentialEquations.ODESolution with 4 timesteps. Analytical solution is known.
    u: 1.372803219752981
    errors: Dict(:l∞=>2.71224e-6,:final=>2.71224e-6,:l2=>1.57376e-6)
    t: [0.0,0.146343,0.643575,1.0]
    timeseries: [0.5,0.579644,0.957782,1.3728]
    timeseries_analytic: [0.5,0.579644,0.957781,1.3728]
    


An array interface is provided so that the solution "acts" like a traditional solution: i.e. as an array of the numerically computed values:


```julia
println(sol.t[3]) # The third timestep
sol[3] # The value at the third timestep
```

    0.6435749072667494





    0.9577822179420759



An entire Julia organization, JuliaArrays, is devoted to making fast, interesting, and easy to use arrays. It's an odd concept: arrays are just arrays, right? However, Julia's genericism makes it so that way this now works in any place which accepts an `AbstractVector` output, so the solution is directly usable in numerical optimization algorithms, regressions, etc.
