
# Logistic Map Bifurcation Diagram


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
