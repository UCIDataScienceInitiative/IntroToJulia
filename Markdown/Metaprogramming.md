
## Why Metaprogramming?

- Metaprogramming is used to write code at parsing time in order to help the compiler achieve good performance
- Metaprogramming is used to write Domain-Specific Languages (DSLs) to make easy syntax for complicated functions

## Examples of Improving Performance

- `@fastmath 3*5`
- ParallelAccelerator's `@acc`
- `@simd`
- `@parallel`
- `Threads.@threads`
- Even DSLs will use symbolic mathematics to automatically simplify a problem for you!

## Examples of Domain-Specific Languages:

### JuliaStats

`~` for Formulas was actually in in-place macro!

### DifferentialEquations.jl

For differential equations packages, the standard way to define a differential equation like the Lorenz equation:

$$
\begin{align}
x\prime &= \sigma (y-x)\\
y\prime &= x (\rho - z) - y\\
z\prime &= xy - \beta z\\
\end{align}
$$

is the following:



```julia
f = (du,u,p,t) -> begin
 σ, ρ, β = p
 du[1] = σ*(u[2]-u[1])
 du[2] = u[1]*(ρ-u[3]) - u[2]
 du[3] = u[1]*u[2] - β*u[3]
end
```

However, we can define a DSL to make this easier to do:


```julia
g = @ode_def begin
  dx = σ*(y-x)
  dy = x*(ρ-z) - y
  dz = x*y - β*z
end σ ρ β
```

### JuMP.jl

JuMP has a DSL which allows you to define constrainted optimization problems without reference to the package or type of equation which is being solved. You can then swap out different optimization packages to use as the solver without care.


```julia
using JuMP

m = Model()
@variable(m, 0 <= x <= 2 )
@variable(m, 0 <= y <= 30 )

@objective(m, Max, 5x + 3*y )
@constraint(m, 1x + 5y <= 3.0 )

print(m)

status = solve(m)

println("Objective value: ", getobjectivevalue(m))
println("x = ", getvalue(x))
println("y = ", getvalue(y))
```

## Writing Your Own Macros

An easy way to write macros is the "QuoteLater" method:

- Write a macro, make it work (in the REPL)
- Later, quote it and interpolate in the value

The Julia manual is very complete on Metaprogramming: http://docs.julialang.org/en/release-0.5/manual/metaprogramming/

One fact that it misses: How to interpolate an expression as an expression (not as a value) into another expression.


```julia
ex_new = Meta.quot(ex)
quote
    still_expression = $(esc(ex_new)) 
end
```

### Metaprogramming Project

You have a way to compute least squares, how about letting it work like an `R` function? Define your own version `solve_least_squares(Y,X)` using your previous result, and define the `@~` macro so that way `solve_least_squares(Y~1+X1+X2+X4)` solves the least square problem on the data matrix `X` on its columns 1, 2, and 4.

Metaprogramming is hard the first few times you do it. You might want to work in pairs!

Hints:

- You cannot "get a character" from a symbol
- You can use `string` to change a symbol to a string
- You can `parse` a string to a number
- Check out the `args` field of an expression: it's an array that holds a bunch of goodies!


```julia
y = rand(10)
X = rand(10,4)
y~1+X1+X2+X4 # Make a tuple
solve_least_squares(y~1+X1+X2+X4) # Solve the least square problem on a tuple
```
