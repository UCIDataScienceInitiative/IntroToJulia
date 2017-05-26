
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
