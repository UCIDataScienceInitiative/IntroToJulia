
## LightGraphs Problem


```julia
using LightGraphs, Distributions
function mkTree(maxdepth::Int = 10, p::Float64 = 0.8, g::SimpleGraph = Graph(1), currhead::Int = 1)
    if (maxdepth <= 1) g
    else
       b = Binomial(2, p)
       nEdges = max(1, rand(b))
        for leaves in 1:nEdges
            add_vertex!(g)
            newnode = nv(g)
            add_edge!(g, currhead, newnode)
            mkTree(maxdepth-1, p, g, newnode)
        end
    end
    g
end
```

## Rootfinding Problems


```julia
using Roots
f(x) = 10 - x + e*sin(x)
fzero(f,BigFloat(2.0))
```


```julia
f! = function (x,dx)
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
