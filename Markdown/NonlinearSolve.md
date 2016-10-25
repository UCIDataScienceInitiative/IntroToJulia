
## Roots.jl and NLsolve.jl

Roots.jl and NLSolve.jl are two libraries for root finding in Julia. Roots.jl is for univariate problems and NLsolve.jl is for multivariate problems. NLsolve.jl uses the autodifferentiation libraries and Optim.jl to improve its calculations.

### Problem 1

Use Roots.jl to solve [the Kepler equation](https://github.com/JuliaMath/Roots.jl#usage-examples):

$$ f(x) = 10 - x + e \sin(x) $$

### Problem 2

Use NLsolve.jl to solve for the roots of the following equation:

$$\begin{align}
f_1(x_1,x_2,x_3) &= x_1 + x_2 + x_3^2 - 12 \\
f_2(x_1,x_2,x_3) &= x_1^2 - x_2 + x_3 - 2 \\
f_3(x_1,x_2,x_3) &= 2x_1 - x_2^2 + x_3 -1
\end{align}$$

[Use an in-place updating function to make the solving more efficient!]
