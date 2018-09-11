
## Nonlinear Solve Answers

### Solution to Problem 1


```julia
using Roots
f(x) = 10 - x + exp(1)*sin(x)
fzero(f,BigFloat(2.0))
```




    9.579933542259600850706664022606528199400333915466167486112544651727603280614496



### Solution to Problem 2


```julia
f! = function (dx,x)
  dx[1] = x[1]   + x[2]   + x[3]^2 -12
  dx[2] = x[1]^2 - x[2]   + x[3]   - 2
  dx[3] = 2x[1]  - x[2]^2 + x[3]   - 1
end
using NLsolve
res = nlsolve(f!,[1.0;1.0;1.0])
res.zero
res = nlsolve(f!,[1.0;1.0;1.0],autodiff=true)
res.zero
```




    3-element Array{Float64,1}:
     1.0000000021270776
     2.000000001120045 
     2.9999999994843582


