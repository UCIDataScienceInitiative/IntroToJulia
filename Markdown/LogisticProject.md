
# Logistic Map Bifurcation Diagram

The logistic difference equation is defined by the recursion

$$ b_{n+1}=r*b_{n}(1-b_{n}) $$

where $b_{n}$ is the number of bunnies at time $n$. Starting with $b_{0}=.25$, by around $400$ iterations this will reach a steady state. This steady state (or steady periodic state) is dependent on $r$. Write a function which solves for the steady state(s) for each given $r$, and plot every state in the steady attractor for each $r$ (x-axis is $r$, $y$=value seen in the attractor) using PyPlot. Take $r\in\left(2.9,4\right)$

Optimize this function.

## Old Solution

Please try solving this yourself first! Use this one as a hint if you get stuck.


```julia
## Produces the logstic plot
# Requires PyPlot

function logisticPlot()
  tic()
  r = 2.9:.00005:4; numAttract = 100;
  steady = ones(length(r),1)*.25;
  for i=1:400 ## Get to steady state
    @devec steady = r.*steady.*(1-steady);
  end
  x = zeros(length(steady),numAttract);
  x[:,1] = steady;
  @simd for i=2:numAttract ## Grab values at the attractor
    @inbounds @fastmath x[:,i] = r.*x[:,i-1].*(1-x[:,i-1]);
  end
  toc()
  fig = figure(figsize=(20,10));
  plot(collect(r),x,"b.",markersize=.06)
  savefig("plot.png",dpi=300);
end
using PyPlot
@time logisticPlot()
```
