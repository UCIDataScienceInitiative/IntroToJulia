
## A Quick Tour of DifferentialEquations.jl

DifferentialEquations.jl is a metapackage for solving differential equations in Julia. The basic workflow is:

- Define a problem
- Solve a problem
- Plot the solution

The API between different types of differential equations is unified through multiple dispatch

## Example: Lotka-Volterra ODE

$$\begin{align}
x' &= ax - bxy\\
y' &= -cy + dxy
\end{align}$$


```julia
using DifferentialEquations
# Define a problem
const a = 1.0; const b = 2.0
const c = 1.5; const d = 1.25
f = function (t,u,du) # Define f as an in-place update into du
    du[1] = a*u[1] - b*u[1]*u[2]
    du[2] = -c*u[2]+ d*u[1]*u[2]
end
u0 = [1.0;1.0]; tspan = (0.0,10.0)
prob = ODEProblem(f,u0,tspan)
```




    DiffEqBase.ODEProblem{Array{Float64,1},Float64,true,##1#2}(#1,[1.0,1.0],(0.0,10.0))




```julia
# Solve the problem
sol = solve(prob)
```




    DiffEqBase.ODESolution{Array{Array{Float64,1},1},Array{Float64,1},Array{Array{Array{Float64,1},1},1},DiffEqBase.ODEProblem{Array{Float64,1},Float64,true,##1#2},OrdinaryDiffEq.Tsit5}(Array{Float64,1}[[1.0,1.0],[0.912378,0.971564],[0.768635,0.887673],[0.640215,0.739539],[0.579038,0.586645],[0.575609,0.43638],[0.647248,0.312288],[0.858273,0.222465],[1.35784,0.199293],[1.9923,0.308114],[2.0708,0.692973],[1.38472,1.00669],[0.749332,0.868987],[0.585712,0.607774],[0.61316,0.352207],[0.830329,0.229312],[1.6363,0.225058],[2.17455,0.525744],[1.95406,0.781683]],[0.0,0.0942336,0.292772,0.583403,0.894442,1.27134,1.72127,2.31275,3.08354,3.81497,4.51466,5.0524,5.69616,6.21559,6.92158,7.61688,8.7721,9.6451,10.0],Array{Array{Float64,1},1}[Array{Float64,1}[[Inf,Inf]],Array{Float64,1}[[-1.0,-0.25],[-0.977358,-0.267944],[-0.953858,-0.285244],[-0.874675,-0.340554],[-0.864124,-0.347634],[-0.861484,-0.349373],[-0.860489,-0.349304]],Array{Float64,1}[[-0.860489,-0.349304],[-0.814788,-0.37831],[-0.768366,-0.40298],[-0.623447,-0.471329],[-0.607034,-0.479105],[-0.602901,-0.480922],[-0.595958,-0.478639]],Array{Float64,1}[[-0.595958,-0.478639],[-0.541156,-0.496724],[-0.488396,-0.507047],[-0.336725,-0.524479],[-0.322681,-0.527544],[-0.319131,-0.528077],[-0.306713,-0.517479]],Array{Float64,1}[[-0.306713,-0.517479],[-0.266969,-0.513047],[-0.229776,-0.504214],[-0.120563,-0.467931],[-0.109463,-0.464552],[-0.106698,-0.463573],[-0.100342,-0.455355]],Array{Float64,1}[[-0.100342,-0.455355],[-0.0676245,-0.438163],[-0.0373299,-0.418962],[0.0560904,-0.354913],[0.066499,-0.347975],[0.0690868,-0.34618],[0.0732407,-0.34059]],Array{Float64,1}[[0.0732407,-0.34059],[0.10258,-0.318603],[0.130465,-0.296665],[0.225873,-0.227795],[0.238624,-0.219607],[0.241807,-0.217569],[0.242992,-0.215772]],Array{Float64,1}[[0.242992,-0.215772],[0.279229,-0.193137],[0.315581,-0.17141],[0.452284,-0.105553],[0.473176,-0.097418],[0.478416,-0.0954156],[0.476402,-0.0950276]],Array{Float64,1}[[0.476402,-0.0950276],[0.530856,-0.0744214],[0.587835,-0.0528887],[0.785114,0.023796],[0.810624,0.0365301],[0.816915,0.0398332],[0.816626,0.0393212]],Array{Float64,1}[[0.816626,0.0393212],[0.860996,0.0647479],[0.891706,0.0978093],[0.796413,0.267322],[0.733842,0.304354],[0.717618,0.314065],[0.764589,0.305151]],Array{Float64,1}[[0.764589,0.305151],[0.654751,0.376068],[0.451512,0.464349],[-0.684867,0.676435],[-0.917973,0.625448],[-0.972402,0.610386],[-0.799214,0.754298]],Array{Float64,1}[[-0.799214,0.754298],[-1.03394,0.759797],[-1.23319,0.710792],[-1.28411,0.314734],[-1.13229,0.233961],[-1.0974,0.214075],[-1.40325,0.232449]],Array{Float64,1}[[-1.40325,0.232449],[-1.31558,0.050614],[-1.1445,-0.116552],[-0.762234,-0.295025],[-0.787111,-0.167891],[-0.786233,-0.140416],[-0.552988,-0.489531]],Array{Float64,1}[[-0.552988,-0.489531],[-0.461295,-0.514335],[-0.378013,-0.516403],[-0.188398,-0.508778],[-0.191578,-0.523974],[-0.191915,-0.526953],[-0.126249,-0.466685]],Array{Float64,1}[[-0.126249,-0.466685],[-0.0625391,-0.435904],[-0.00837493,-0.398468],[0.136143,-0.295743],[0.13908,-0.295662],[0.140036,-0.295226],[0.181242,-0.258361]],Array{Float64,1}[[0.181242,-0.258361],[0.223879,-0.228947],[0.265291,-0.201101],[0.421627,-0.119131],[0.445462,-0.109591],[0.451447,-0.107246],[0.44952,-0.105962]],Array{Float64,1}[[0.44952,-0.105962],[0.530807,-0.0749502],[0.616297,-0.0423637],[0.888188,0.0902778],[0.920606,0.118146],[0.927983,0.125535],[0.899776,0.122741]],Array{Float64,1}[[0.899776,0.122741],[0.908496,0.170455],[0.856593,0.238345],[0.0134149,0.577832],[-0.254365,0.634424],[-0.320807,0.648238],[-0.111962,0.640453]],Array{Float64,1}[[-0.111962,0.640453],[-0.270317,0.680535],[-0.449287,0.71273],[-0.993857,0.727265],[-1.0439,0.700943],[-1.05652,0.694192],[-1.10085,0.736798]]],DiffEqBase.ODEProblem{Array{Float64,1},Float64,true,##1#2}(#1,[1.0,1.0],(0.0,10.0)),OrdinaryDiffEq.Tsit5
      order: 5
      adaptiveorder: 4,OrdinaryDiffEq.#124,true,0)




```julia
# Plot the solution using the plot recipe
using Plots; gr() # Using the GR Backend
plot(sol,title="All Plots.jl Attributes are Available")
```




<?xml version="1.0" encoding="utf-8"?>
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="600" height="400" viewBox="0 0 600 400">
<defs>
  <clipPath id="clip00">
    <rect x="0" y="0" width="600" height="400"/>
  </clipPath>
</defs>
<polygon clip-path="url(#clip00)" points="
0,400 600,400 600,0 0,0 
  " fill="#ffffff" fill-opacity="1"/>
<defs>
  <clipPath id="clip01">
    <rect x="120" y="0" width="421" height="400"/>
  </clipPath>
</defs>
<polygon clip-path="url(#clip00)" points="
30.6037,384.952 596.063,384.952 596.063,23.3815 30.6037,23.3815 
  " fill="#ffffff" fill-opacity="1"/>
<defs>
  <clipPath id="clip02">
    <rect x="30" y="23" width="566" height="362"/>
  </clipPath>
</defs>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  30.6037,379.528 30.6037,28.805 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  143.696,379.528 143.696,28.805 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  256.787,379.528 256.787,28.805 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  369.879,379.528 369.879,28.805 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  482.971,379.528 482.971,28.805 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  596.063,379.528 596.063,28.805 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  39.0856,329.504 587.581,329.504 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  39.0856,238.421 587.581,238.421 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  39.0856,147.339 587.581,147.339 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  39.0856,56.2558 587.581,56.2558 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,384.952 596.063,384.952 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,384.952 30.6037,379.528 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  143.696,384.952 143.696,379.528 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  256.787,384.952 256.787,379.528 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  369.879,384.952 369.879,379.528 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  482.971,384.952 482.971,379.528 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  596.063,384.952 596.063,379.528 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,384.952 30.6037,23.3815 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,329.504 39.0856,329.504 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,238.421 39.0856,238.421 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,147.339 39.0856,147.339 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,56.2558 39.0856,56.2558 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 30.6037, 396.952)" x="30.6037" y="396.952">0</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 143.696, 396.952)" x="143.696" y="396.952">2</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 256.787, 396.952)" x="256.787" y="396.952">4</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 369.879, 396.952)" x="369.879" y="396.952">6</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 482.971, 396.952)" x="482.971" y="396.952">8</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 596.063, 396.952)" x="596.063" y="396.952">10</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 29.4037, 334.004)" x="29.4037" y="334.004">0.5</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 29.4037, 242.921)" x="29.4037" y="242.921">1.0</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 29.4037, 151.839)" x="29.4037" y="151.839">1.5</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 29.4037, 60.7558)" x="29.4037" y="60.7558">2.0</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:21; text-anchor:middle;" transform="rotate(0, 313.333, 18)" x="313.333" y="18">All Plots.jl Attributes are Available</text>
</g>
<polyline clip-path="url(#clip02)" style="stroke:#0099ff; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  30.6037,238.421 36.3154,255.439 42.0271,269.785 47.7388,281.67 53.4505,291.357 59.1622,299.114 64.8739,305.19 70.5856,309.805 76.2974,313.145 82.0091,315.363 
  87.7208,316.583 93.4325,316.901 99.1442,316.391 104.856,315.11 110.568,313.096 116.279,310.374 121.991,306.961 127.703,302.861 133.414,298.073 139.126,292.587 
  144.838,286.388 150.55,279.458 156.261,271.778 161.973,263.325 167.685,254.079 173.396,244.015 179.108,233.109 184.82,221.349 190.532,208.739 196.243,195.297 
  201.955,181.052 207.667,166.054 213.378,150.406 219.09,134.212 224.802,117.655 230.514,101.003 236.225,84.6096 241.937,68.9143 247.649,54.4359 253.36,41.7277 
  259.072,31.7397 264.784,25.3815 270.496,23.3815 276.207,26.2869 281.919,34.4642 287.631,48.0945 293.342,66.8182 299.054,89.4892 304.766,114.812 310.477,141.416 
  316.189,167.854 321.901,192.862 327.613,215.734 333.324,235.981 339.036,253.372 344.748,267.934 350.459,279.955 356.171,289.887 361.883,297.882 367.595,304.172 
  373.306,308.98 379.018,312.492 384.73,314.859 390.441,316.216 396.153,316.656 401.865,316.257 407.577,315.079 413.288,313.164 419,310.541 424.712,307.224 
  430.423,303.22 436.135,298.527 441.847,293.136 447.559,287.035 453.27,280.207 458.982,272.632 464.694,264.298 470.405,255.204 476.117,245.293 481.829,234.527 
  487.54,222.885 493.252,210.371 498.964,197.01 504.676,182.85 510.387,167.958 516.099,152.427 521.811,136.369 527.522,119.919 533.234,103.264 538.946,86.7993 
  544.658,71.0225 550.369,56.4904 556.081,43.821 561.793,33.6926 567.504,26.8443 573.216,24.0756 578.928,26.207 584.64,33.7032 590.351,46.6392 596.063,64.6238 
  
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#e9746a; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  30.6037,238.421 36.3154,244.036 42.0271,251.326 47.7388,259.782 53.4505,268.95 59.1622,278.455 64.8739,288 70.5856,297.36 76.2974,306.373 82.0091,314.93 
  87.7208,322.961 93.4325,330.43 99.1442,337.322 104.856,343.638 110.568,349.394 116.279,354.612 121.991,359.317 127.703,363.537 133.414,367.303 139.126,370.643 
  144.838,373.584 150.55,376.15 156.261,378.363 161.973,380.241 167.685,381.796 173.396,383.041 179.108,383.983 184.82,384.62 190.532,384.948 196.243,384.952 
  201.955,384.61 207.667,383.895 213.378,382.762 219.09,381.161 224.802,379.026 230.514,376.27 236.225,372.788 241.937,368.455 247.649,363.128 253.36,356.654 
  259.072,348.844 264.784,339.593 270.496,328.913 276.207,316.926 281.919,303.872 287.631,290.106 293.342,276.291 299.054,263.351 304.766,252.105 310.477,243.233 
  316.189,237.283 321.901,234.508 327.613,234.743 333.324,237.726 339.036,243.08 344.748,250.304 350.459,258.78 356.171,267.86 361.883,277.301 367.595,286.822 
  373.306,296.184 379.018,305.218 384.73,313.815 390.441,321.899 396.153,329.431 401.865,336.392 407.577,342.777 413.288,348.595 419,353.87 424.712,358.635 
  430.423,362.914 436.135,366.736 441.847,370.13 447.559,373.122 453.27,375.736 458.982,377.993 464.694,379.909 470.405,381.492 476.117,382.761 481.829,383.73 
  487.54,384.404 493.252,384.777 498.964,384.835 504.676,384.553 510.387,383.899 516.099,382.829 521.811,381.293 527.522,379.23 533.234,376.583 538.946,373.216 
  544.658,368.973 550.369,363.716 556.081,357.323 561.793,349.69 567.504,340.731 573.216,330.375 578.928,318.595 584.64,305.642 590.351,291.963 596.063,278.191 
  
  "/>
<polygon clip-path="url(#clip00)" points="
505.547,89.6215 578.063,89.6215 578.063,44.2615 505.547,44.2615 
  " fill="#ffffff" fill-opacity="1"/>
<polyline clip-path="url(#clip00)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  505.547,89.6215 578.063,89.6215 578.063,44.2615 505.547,44.2615 505.547,89.6215 
  "/>
<polyline clip-path="url(#clip00)" style="stroke:#0099ff; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  511.547,59.3815 547.547,59.3815 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:start;" transform="rotate(0, 553.547, 63.8815)" x="553.547" y="63.8815">y1</text>
</g>
<polyline clip-path="url(#clip00)" style="stroke:#e9746a; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  511.547,74.5015 547.547,74.5015 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:start;" transform="rotate(0, 553.547, 79.0015)" x="553.547" y="79.0015">y2</text>
</g>
</svg>




## Extra Features

The solution object acts both as an array and as an interpolation of the solution


```julia
@show sol.t[3] # Time at the 3rd timestep
@show sol[3] # Value at the third timestep
@show sol(5) # Value at t=5 using the interpolation 
```

    sol.t[3] = 0.2927716363580929
    sol[3] = [0.768635,0.887673]
    sol(5) = [1.45932,0.99208]





    2-element Array{Float64,1}:
     1.45932
     0.99208



## Stochastic Differential Equations

Also included are problems for stochastic differential equations


```julia
g = function (t,u,du)
    du[1] = .5*u[1] 
    du[2] = .1*u[2]
end
prob = SDEProblem(f,g,u0,tspan)
sol = solve(prob,dt=1/2^4)
plot(sol)
```




<?xml version="1.0" encoding="utf-8"?>
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="600" height="400" viewBox="0 0 600 400">
<defs>
  <clipPath id="clip00">
    <rect x="0" y="0" width="600" height="400"/>
  </clipPath>
</defs>
<polygon clip-path="url(#clip00)" points="
0,400 600,400 600,0 0,0 
  " fill="#ffffff" fill-opacity="1"/>
<defs>
  <clipPath id="clip01">
    <rect x="120" y="0" width="421" height="400"/>
  </clipPath>
</defs>
<polygon clip-path="url(#clip00)" points="
12.8259,384.952 596.063,384.952 596.063,3.93701 12.8259,3.93701 
  " fill="#ffffff" fill-opacity="1"/>
<defs>
  <clipPath id="clip02">
    <rect x="12" y="3" width="584" height="382"/>
  </clipPath>
</defs>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  12.8259,379.237 12.8259,9.65223 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  129.473,379.237 129.473,9.65223 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  246.121,379.237 246.121,9.65223 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  362.768,379.237 362.768,9.65223 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  479.416,379.237 479.416,9.65223 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  596.063,379.237 596.063,9.65223 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  21.5745,289.031 587.314,289.031 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  21.5745,190.307 587.314,190.307 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  21.5745,91.5819 587.314,91.5819 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  12.8259,384.952 596.063,384.952 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  12.8259,384.952 12.8259,379.237 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  129.473,384.952 129.473,379.237 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  246.121,384.952 246.121,379.237 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  362.768,384.952 362.768,379.237 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  479.416,384.952 479.416,379.237 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  596.063,384.952 596.063,379.237 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  12.8259,384.952 12.8259,3.93701 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  12.8259,289.031 21.5745,289.031 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  12.8259,190.307 21.5745,190.307 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  12.8259,91.5819 21.5745,91.5819 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 12.8259, 396.952)" x="12.8259" y="396.952">0</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 129.473, 396.952)" x="129.473" y="396.952">2</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 246.121, 396.952)" x="246.121" y="396.952">4</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 362.768, 396.952)" x="362.768" y="396.952">6</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 479.416, 396.952)" x="479.416" y="396.952">8</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 596.063, 396.952)" x="596.063" y="396.952">10</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 11.6259, 293.531)" x="11.6259" y="293.531">1</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 11.6259, 194.807)" x="11.6259" y="194.807">2</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 11.6259, 96.0819)" x="11.6259" y="96.0819">3</text>
</g>
<polyline clip-path="url(#clip02)" style="stroke:#0099ff; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  12.8259,289.031 15.2547,285.555 17.9871,271.091 20.0577,260.652 21.8599,277.598 23.8873,276.197 26.1682,235.378 28.1848,249.724 30.4533,250.291 32.1303,253.122 
  34.0168,261.697 36.1392,269.51 38.044,285.834 40.1868,269.612 42.1195,282.241 44.2937,281.669 46.2451,300.574 48.4403,298.743 50.91,300.12 53.6884,295.263 
  56.4183,302.982 59.2495,294.903 61.8767,295.151 64.1527,304.205 66.7132,307.607 69.5937,288.551 72.8344,289.6 76.4801,281.999 79.5703,300.917 83.0469,315.528 
  86.4277,321.448 89.1579,327.97 92.2294,337.077 95.6849,333.13 98.5458,343.083 101.764,343.478 105.04,335.322 108.491,334.327 112.374,332.281 116.742,340.609 
  120.753,345.988 124.122,347.122 127.912,346.95 132.137,345.824 136.419,342.207 140.955,351.626 145.663,335.921 150.479,325.607 154.187,332.243 158.358,318.791 
  163.051,307.873 168.33,292.482 173.472,288.511 177.825,277.087 181.446,233.112 185.487,201.551 187.549,196.83 189.869,184.046 192.478,204.104 195.119,211.782 
  198.089,211.729 201.431,199.914 204.455,209.113 207.857,206.233 210.176,164.611 212.424,84.7984 214.076,94.2217 215.935,123.453 217.744,117.977 219.388,80.8382 
  220.816,92.4258 222.297,82.6831 223.447,79.174 224.658,55.1382 225.64,49.7975 226.706,49.3293 227.812,86.1547 228.919,68.7543 229.826,60.5119 230.647,40.3618 
  231.504,56.8479 232.43,67.7768 233.247,73.2855 234.064,69.5125 234.85,97.7165 235.735,108.025 236.618,92.9323 237.325,109.989 238.121,128.315 239.015,134.217 
  239.908,136.441 240.7,146.284 241.538,145.118 242.255,176.759 243.063,167.665 243.872,177.717 244.529,213.147 245.269,214.114 246.101,232.541 247.037,238.364 
  248.029,245.016 248.981,261.32 250.026,265.905 250.967,275.407 251.989,283.544 253.067,286.753 254.153,289.141 255.373,295.377 256.746,291.918 258.291,290.997 
  259.692,288.392 260.834,293.531 262.12,300.166 263.34,308.53 264.714,306.683 266.259,308.874 267.997,305.739 268.95,316.433 270.023,321.732 271.23,326.576 
  272.588,327.372 274.115,330.163 275.834,335.576 277.554,340.18 278.924,347.024 280.466,349.022 282.201,350.295 284.026,353.627 285.985,356.464 288.042,354.732 
  289.697,355.991 291.558,358.201 293.653,358.768 295.984,356.945 298.358,358.202 300.662,363.084 303.022,356.296 305.546,358.556 307.956,363.093 310.493,365.449 
  312.963,367.108 315.522,366.061 318.072,368.594 320.808,372.54 323.344,372.576 326.197,372.22 329.406,370.562 332.866,368.743 336.759,366.537 340.798,367.327 
  345.086,365.262 349.212,362.044 353.715,356.335 358.288,355.707 362.955,356.48 366.83,358.043 371.189,365.136 376.092,368.054 381.317,368.09 387.195,366.99 
  393.808,362.608 400.49,356.148 404.518,351.691 407.894,351.007 411.691,361.048 415.963,358.758 420.769,351.505 426.175,336.53 428.337,338.953 430.768,349.346 
  433.504,346.417 436.581,340.021 440.043,351.648 443.459,355.916 447.011,346.171 451.006,340.598 455.501,328.401 457.495,325.927 459.739,316.381 462.263,304.037 
  464.374,302.433 466.749,297.485 469.42,279.27 470.846,277.57 472.451,290.391 474.255,279.477 476.286,277.69 478.57,252.729 480.204,250.602 482.043,257.684 
  484.063,259.928 485.786,274.853 487.724,264.456 489.904,258.149 491.635,260.679 493.582,255.459 495.524,262.065 497.709,254.302 499.667,242.582 501.87,230.321 
  504.348,210.033 506.675,174.754 509.134,142.423 510.295,147.299 511.601,136.123 513.07,134.545 514.722,128.818 516.135,136.686 517.725,146.258 519.513,145.475 
  521.254,158.531 523.12,129.831 524.444,147.545 525.933,155.552 527.609,119.773 529.009,122.046 530.585,133.074 532.271,151.25 534.164,115.142 536.262,83.037 
  538.591,22.2008 539.639,20.056 540.817,43.2506 542.143,36.3693 543.635,82.7513 545.313,86.555 547.201,65.6558 549.139,50.4502 550.865,23.6953 552.549,3.93701 
  553.932,46.5469 555.488,42.2913 557.239,107.597 559.208,35.3222 560.519,23.9705 561.994,56.5233 563.654,83.0762 565.503,93.7552 567.374,106.262 569.397,58.9519 
  570.784,78.1817 572.345,94.9546 574.101,117.278 575.575,112.53 577.234,72.5824 578.282,56.5011 579.461,62.1492 580.575,69.12 581.704,57.9092 582.974,72.8398 
  584.21,73.1061 585.285,82.0893 586.494,105.983 587.8,125.667 588.951,85.4489 589.869,86.3378 590.877,81.9909 591.831,73.0068 592.685,84.1248 593.56,83.4192 
  594.395,99.3926 595.335,114.063 596.063,123.35 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#e9746a; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  12.8259,289.031 15.2547,289.306 17.9871,289.809 20.0577,289.06 21.8599,290.918 23.8873,292.236 26.1682,292.322 28.1848,292.45 30.4533,291.401 32.1303,291.967 
  34.0168,288.463 36.1392,290.045 38.044,290.429 40.1868,292.412 42.1195,294.572 44.2937,292.211 46.2451,292.652 48.4403,291.627 50.91,294.397 53.6884,298.009 
  56.4183,301.128 59.2495,301.356 61.8767,299.898 64.1527,302.378 66.7132,306.726 69.5937,306.95 72.8344,307.991 76.4801,309.305 79.5703,309.651 83.0469,312.696 
  86.4277,312.53 89.1579,314.95 92.2294,316.947 95.6849,319.737 98.5458,324.118 101.764,327.467 105.04,333.819 108.491,335.146 112.374,336.993 116.742,339.713 
  120.753,341.734 124.122,345.189 127.912,348.952 132.137,351.621 136.419,354.631 140.955,357.011 145.663,360.315 150.479,362.34 154.187,364.263 158.358,364.833 
  163.051,366.587 168.33,366.774 173.472,366.545 177.825,366.776 181.446,365.689 185.487,364.985 187.549,363.95 189.869,363.79 192.478,362.237 195.119,361.991 
  198.089,361.591 201.431,360.1 204.455,358.613 207.857,356.538 210.176,353.591 212.424,349.943 214.076,346.456 215.935,343.057 217.744,340.571 219.388,336.844 
  220.816,334.436 222.297,331.061 223.447,328.242 224.658,325.331 225.64,323.297 226.706,319.702 227.812,317.396 228.919,313.861 229.826,309.648 230.647,306.32 
  231.504,302.824 232.43,296.647 233.247,294.031 234.064,290.84 234.85,289.056 235.735,285.047 236.618,280.571 237.325,278.888 238.121,274.834 239.015,270.578 
  239.908,263.897 240.7,259.034 241.538,256.19 242.255,252.731 243.063,249.966 243.872,248.396 244.529,248.355 245.269,248.64 246.101,246.563 247.037,243.308 
  248.029,242.614 248.981,243.084 250.026,242.753 250.967,242.001 251.989,239.914 253.067,243.332 254.153,246.633 255.373,249.483 256.746,249.828 258.291,253.043 
  259.692,252.751 260.834,248.464 262.12,249.591 263.34,249.601 264.714,250.033 266.259,253.38 267.997,258.365 268.95,259.521 270.023,259.286 271.23,259.586 
  272.588,258.578 274.115,259.726 275.834,261.112 277.554,265.551 278.924,267.865 280.466,274.978 282.201,278.836 284.026,282.412 285.985,285.174 288.042,288.125 
  289.697,293.871 291.558,297.758 293.653,301.848 295.984,306.086 298.358,308.508 300.662,312.321 303.022,313.88 305.546,316.392 307.956,320.755 310.493,323.697 
  312.963,327.279 315.522,331.331 318.072,335.92 320.808,339.55 323.344,343.827 326.197,347.244 329.406,350.359 332.866,352.412 336.759,354.964 340.798,356.853 
  345.086,358.932 349.212,362.022 353.715,363.816 358.288,366.672 362.955,369.313 366.83,371.006 371.189,372.479 376.092,374.074 381.317,375.042 387.195,376.826 
  393.808,378.15 400.49,379.453 404.518,379.98 407.894,380.752 411.691,381.272 415.963,381.939 420.769,382.325 426.175,382.866 428.337,382.991 430.768,383.26 
  433.504,383.444 436.581,383.687 440.043,383.684 443.459,383.839 447.011,384.14 451.006,384.188 455.501,384.422 457.495,384.578 459.739,384.541 462.263,384.667 
  464.374,384.703 466.749,384.708 469.42,384.843 470.846,384.896 472.451,384.936 474.255,384.952 476.286,384.855 478.57,384.796 480.204,384.745 482.043,384.698 
  484.063,384.658 485.786,384.673 487.724,384.764 489.904,384.788 491.635,384.786 493.582,384.684 495.524,384.619 497.709,384.631 499.667,384.615 501.87,384.545 
  504.348,384.366 506.675,384.154 509.134,383.911 510.295,383.695 511.601,383.553 513.07,383.343 514.722,383.008 516.135,382.819 517.725,382.671 519.513,382.39 
  521.254,382.301 523.12,382.173 524.444,381.963 525.933,381.864 527.609,381.693 529.009,381.372 530.585,381.002 532.271,380.685 534.164,380.227 536.262,379.594 
  538.591,378.537 539.639,377.983 540.817,377.068 542.143,376.045 543.635,375.099 545.313,374.083 547.201,373.195 549.139,371.786 550.865,370.07 552.549,367.907 
  553.932,366.2 555.488,364.672 557.239,362.82 559.208,361.332 560.519,360.024 561.994,357.834 563.654,355.576 565.503,354.801 567.374,352.548 569.397,349.609 
  570.784,347.673 572.345,344.603 574.101,341.508 575.575,339.67 577.234,336.725 578.282,334.288 579.461,332.173 580.575,330.91 581.704,329.649 582.974,326.446 
  584.21,321.906 585.285,319.492 586.494,316.816 587.8,312.422 588.951,310.134 589.869,306.361 590.877,303.459 591.831,299.637 592.685,295.448 593.56,292.555 
  594.395,290.783 595.335,286.224 596.063,284.1 
  "/>
<polygon clip-path="url(#clip00)" points="
505.547,70.177 578.063,70.177 578.063,24.817 505.547,24.817 
  " fill="#ffffff" fill-opacity="1"/>
<polyline clip-path="url(#clip00)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  505.547,70.177 578.063,70.177 578.063,24.817 505.547,24.817 505.547,70.177 
  "/>
<polyline clip-path="url(#clip00)" style="stroke:#0099ff; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  511.547,39.937 547.547,39.937 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:start;" transform="rotate(0, 553.547, 44.437)" x="553.547" y="44.437">y1</text>
</g>
<polyline clip-path="url(#clip00)" style="stroke:#e9746a; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  511.547,55.057 547.547,55.057 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:start;" transform="rotate(0, 553.547, 59.557)" x="553.547" y="59.557">y2</text>
</g>
</svg>




## Documentation

For more information, see the documentation: https://github.com/JuliaDiffEq/DifferentialEquations.jl

## Problems 

### Problem 1

The DifferentialEquations.jl algorithms choose the number type of their calculation given their input. Use this fact to solve the [Lorenz equation](https://en.wikipedia.org/wiki/Lorenz_system) using BigFloats. You may want to [check out the example notebooks](https://github.com/JuliaDiffEq/DifferentialEquations.jl/tree/master/examples).



### Problem 2

Use the [event handling](http://juliadiffeq.github.io/DifferentialEquations.jl/latest/man/callback_functions.html) the model a bouncing ball with friction, i.e. at every bounce the velocity flips but is decreased to 80%. Does the ball eventually stop bouncing?

### Problem 3 

Install the ODE.jl and ODEInterface conditional dependencies (note: ODEInterface may give build issues on Windows!) and run some of the [benchmarks notebooks](https://github.com/JuliaDiffEq/DifferentialEquations.jl/tree/master/benchmarks) on your machine. Do you notice any trends amongst the algorithms? Use the method as shown in the Pleiades benchmarks to benchmark the algorithms against each other on nonlinear problems with no known analytical solution. Try building an example problem with a large number of independent variables to accentuate the differences between the algorithms (Example: the Linear problem in the benchmarks is a 100x100 problem).
