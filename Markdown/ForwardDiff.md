
## FowardDiff.jl

[The JuliaDiff website](http://www.juliadiff.org/) describes the advantages (and some of the implementation) of autodifferentiation. The basic idea is as follows. For normal derivative approximations, you do calculations like:

```julia
Df = (f(x+ϵ) - f(x)) / ϵ
```

with ϵ sufficiently small. However, when ϵ is small [catestrophic cancellation](https://en.wikipedia.org/wiki/Loss_of_significance) occurs which causes numerical error. This puts numerical differentiation methods in a bind: a small epsilon is required to not have derivative error (since it's defined as the limit), but small epsilon results in floating point errors due to cancelation. The result is that numerical derivative approximations are very error prone.

Symbolic differentiation isn't always possible since the length of the expressions grows exponentially. But a newer technique, called autodifferentiation, can do this. The central idea is that you can directly define the derivatives of basic expressions (like `sin`), and then use the chain rule to know how to propagate derivatives. This allows you to efficiently calculate derivatives through entire codes without using small epsilon values, meaning it doesn't result in the high numerical errors that plague numerical differentiation. The result is fast and accurate derivatives.

ForwardDiff.jl is an implementation of autodifferentiation which uses [dual numbers](https://en.wikipedia.org/wiki/Dual_number).  The idea is you have a two dimensional number, and you define operators like `+` so that way the first part is the value and the second part is the derivative. For example, `sin(Ax) = sin(Ax) + cos(A)ϵ`, and then you can use the chain rule to define how the epsilon gets passed down. The resulting derivative at the end of the calculation is then simply the coefficient on the epsilon part. Here, ϵ is part of a number type, and this is all done by multiple dispatch and defining new dispatches on basic mathematical functions for Dual numbers which also compute the derivative.

### Problem

The ForwardDiff.jl documentation can be found here: http://www.juliadiff.org/ForwardDiff.jl/stable/user/api.html

1. Use the `ForwardDiff.derivative` function to take the derivative of `x^5 + 3x^2`. Compare the result to the analytical solution by plotting both with Plots.jl, overlaying one on top of the other (hint: `plot!` can be helpful!).

2. The transformation from spherical to cartesian coordinates is given by:

$$
\begin{align}
x &= r\sin(\theta)\cos(\phi) \\
y &= r\sin(\theta)\sin(\phi) \\
z &= r\cos(\theta)
\end{align}
$$

Use ForwardDiff.jl to calculate the Jacobian of the transformation. Compare the determinant of the Jacobian against the analytical solution $r^2 \sin(\theta)$.
