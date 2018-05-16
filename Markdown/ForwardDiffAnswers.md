
# ForwardDiff Answers

## Problem 1


```julia
f(x) = x^5 + 3x^2
using ForwardDiff
fprime(x) = ForwardDiff.derivative(f,x)
```




    fprime (generic function with 1 method)




```julia
using Plots; gr()
x = -5:0.1:5
plot(x,fprime.(x))
```




![svg](ForwardDiffAnswers_files/ForwardDiffAnswers_2_0.svg)




```julia
plot!(x,5x.^4+6x)
```




![svg](ForwardDiffAnswers_files/ForwardDiffAnswers_3_0.svg)



## Problem 2


```julia
function spherical2Cartesian(coordinates)
    r, θ, ϕ = coordinates
    x = r*sin(θ)*cos(ϕ)
    y = r*sin(θ)*sin(ϕ)
    z = r*cos(θ)
    [x, y, z]
end

ρ, θ, ϕ = 2.5, π/4, π/2
coordinates = [ρ, θ, ϕ]
J = ForwardDiff.jacobian(spherical2Cartesian, coordinates)
detJ = det(J)

det_analytical = ρ^2 * sin(θ)
det_analytical ≈ detJ
```




    true


