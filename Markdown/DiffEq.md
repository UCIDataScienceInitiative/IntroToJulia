
## A Quick Tour of DifferentialEquations.jl

DifferentialEquations.jl is a metapackage for solving differential equations in Julia. The basic workflow is:

- Define a problem
- Solve a problem
- Plot the solution

The API between different types of differential equations is unified through multiple dispatch.

See the [DifferentialEquations.jl Documentation](http://docs.juliadiffeq.org/latest/index.html).

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
prob = ODEProblem(f,u0,tspan);
```


```julia
# Solve the problem
sol = solve(prob);
```


```julia
# Plot the solution using the plot recipe
using Plots; gr() # Using the Plotly Backend
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
30.6037,369.674 596.063,369.674 596.063,23.3815 30.6037,23.3815 
  " fill="#ffffff" fill-opacity="1"/>
<defs>
  <clipPath id="clip02">
    <rect x="30" y="23" width="566" height="347"/>
  </clipPath>
</defs>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  30.6037,364.48 30.6037,28.5758 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  143.696,364.48 143.696,28.5758 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  256.787,364.48 256.787,28.5758 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  369.879,364.48 369.879,28.5758 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  482.971,364.48 482.971,28.5758 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  596.063,364.48 596.063,28.5758 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  39.0856,316.546 587.581,316.546 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  39.0856,229.322 587.581,229.322 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  39.0856,142.099 587.581,142.099 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  39.0856,54.8758 587.581,54.8758 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,369.674 596.063,369.674 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,369.674 30.6037,364.48 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  143.696,369.674 143.696,364.48 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  256.787,369.674 256.787,364.48 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  369.879,369.674 369.879,364.48 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  482.971,369.674 482.971,364.48 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  596.063,369.674 596.063,364.48 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,369.674 30.6037,23.3815 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,316.546 39.0856,316.546 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,229.322 39.0856,229.322 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,142.099 39.0856,142.099 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,54.8758 39.0856,54.8758 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 30.6037, 381.674)" x="30.6037" y="381.674">0</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 143.696, 381.674)" x="143.696" y="381.674">2</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 256.787, 381.674)" x="256.787" y="381.674">4</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 369.879, 381.674)" x="369.879" y="381.674">6</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 482.971, 381.674)" x="482.971" y="381.674">8</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 596.063, 381.674)" x="596.063" y="381.674">10</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 29.4037, 321.046)" x="29.4037" y="321.046">0.5</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 29.4037, 233.822)" x="29.4037" y="233.822">1.0</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 29.4037, 146.599)" x="29.4037" y="146.599">1.5</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 29.4037, 59.3758)" x="29.4037" y="59.3758">2.0</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:21; text-anchor:middle;" transform="rotate(0, 313.333, 18)" x="313.333" y="18">All Plots.jl Attributes are Available</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:16; text-anchor:middle;" transform="rotate(0, 313.333, 397.6)" x="313.333" y="397.6">t</text>
</g>
<polyline clip-path="url(#clip02)" style="stroke:#0099ff; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  30.6037,229.322 33.5955,238.187 36.5874,246.33 39.5792,253.771 42.5711,260.539 45.5629,266.665 48.5548,272.187 51.5466,277.141 54.5385,281.565 57.5303,285.496 
  60.5222,288.967 63.514,292.011 66.5059,294.659 69.4977,296.939 72.4895,298.875 75.4814,300.492 78.4732,301.809 81.4651,302.845 84.4569,303.616 87.4488,304.137 
  90.4406,304.42 93.4325,304.476 96.4243,304.316 99.4162,303.946 102.408,303.375 105.4,302.607 108.392,301.648 111.384,300.502 114.375,299.17 117.367,297.655 
  120.359,295.959 123.351,294.083 126.343,292.026 129.335,289.789 132.327,287.371 135.318,284.77 138.31,281.985 141.302,279.013 144.294,275.852 147.286,272.499 
  150.278,268.953 153.269,265.209 156.261,261.266 159.253,257.119 162.245,252.766 165.237,248.206 168.229,243.434 171.221,238.445 174.212,233.237 177.204,227.807 
  180.196,222.153 183.188,216.275 186.18,210.172 189.172,203.847 192.163,197.301 195.155,190.538 198.147,183.562 201.139,176.378 204.131,168.993 207.123,161.418 
  210.115,153.671 213.106,145.763 216.098,137.708 219.09,129.529 222.082,121.253 225.074,112.914 228.066,104.553 231.058,96.2153 234.049,87.9546 237.041,79.8293 
  240.033,71.9044 243.025,64.2512 246.017,56.9472 249.009,50.052 252,43.6609 254.992,37.9234 257.984,32.9767 260.976,28.9448 263.968,25.9385 266.96,24.0558 
  269.952,23.3815 272.943,23.9873 275.935,25.932 278.927,29.2612 281.919,34.0076 284.911,40.1906 287.903,47.811 290.894,56.7737 293.886,66.9145 296.878,78.0621 
  299.87,90.0397 302.862,102.665 305.854,115.751 308.846,129.103 311.837,142.524 314.829,155.808 317.821,168.759 320.813,181.271 323.805,193.25 326.797,204.613 
  329.788,215.297 332.78,225.256 335.772,234.462 338.764,242.909 341.756,250.607 344.748,257.584 347.74,263.89 350.731,269.591 353.723,274.766 356.715,279.413 
  359.707,283.552 362.699,287.219 365.691,290.447 368.683,293.268 371.674,295.71 374.666,297.799 377.658,299.558 380.65,301.008 383.642,302.168 386.634,303.057 
  389.625,303.691 392.617,304.08 395.609,304.238 398.601,304.174 401.593,303.896 404.585,303.413 407.577,302.732 410.568,301.857 413.56,300.794 416.552,299.545 
  419.544,298.113 422.536,296.498 425.528,294.702 428.519,292.727 431.511,290.571 434.503,288.234 437.495,285.714 440.487,283.01 443.479,280.12 446.471,277.042 
  449.462,273.775 452.454,270.315 455.446,266.66 458.438,262.806 461.43,258.75 464.422,254.499 467.414,250.05 470.405,245.394 473.397,240.523 476.389,235.431 
  479.381,230.114 482.373,224.567 485.365,218.791 488.356,212.783 491.348,206.547 494.34,200.085 497.332,193.402 500.324,186.505 503.316,179.401 506.308,172.099 
  509.299,164.612 512.291,156.951 515.283,149.131 518.275,141.167 521.267,133.078 524.259,124.881 527.25,116.598 530.242,108.252 533.234,99.8919 536.226,91.5816 
  539.218,83.3868 542.21,75.3783 545.202,67.6312 548.193,60.225 551.185,53.2436 554.177,46.775 557.169,40.912 560.161,35.7515 563.153,31.3947 566.145,27.9473 
  569.136,25.5195 572.128,24.2255 575.12,24.1843 578.112,25.5005 581.104,28.2165 584.096,32.3688 587.087,37.9613 590.079,44.9625 593.071,53.3058 596.063,62.8893 
  
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#e9746a; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  30.6037,229.322 33.5955,231.908 36.5874,235 39.5792,238.525 42.5711,242.411 45.5629,246.591 48.5548,250.999 51.5466,255.579 54.5385,260.276 57.5303,265.045 
  60.5222,269.842 63.514,274.633 66.5059,279.387 69.4977,284.078 72.4895,288.684 75.4814,293.187 78.4732,297.573 81.4651,301.83 84.4569,305.949 87.4488,309.926 
  90.4406,313.755 93.4325,317.433 96.4243,320.959 99.4162,324.333 102.408,327.555 105.4,330.629 108.392,333.555 111.384,336.338 114.375,338.98 117.367,341.485 
  120.359,343.856 123.351,346.098 126.343,348.215 129.335,350.211 132.327,352.089 135.318,353.853 138.31,355.509 141.302,357.058 144.294,358.506 147.286,359.854 
  150.278,361.106 153.269,362.266 156.261,363.335 159.253,364.316 162.245,365.211 165.237,366.021 168.229,366.749 171.221,367.395 174.212,367.961 177.204,368.448 
  180.196,368.855 183.188,369.182 186.18,369.429 189.172,369.593 192.163,369.674 195.155,369.668 198.147,369.573 201.139,369.385 204.131,369.1 207.123,368.714 
  210.115,368.218 213.106,367.608 216.098,366.876 219.09,366.014 222.082,365.012 225.074,363.858 228.066,362.54 231.058,361.045 234.049,359.355 237.041,357.456 
  240.033,355.328 243.025,352.953 246.017,350.308 249.009,347.376 252,344.132 254.992,340.546 257.984,336.596 260.976,332.268 263.968,327.558 266.96,322.469 
  269.952,317.01 272.943,311.203 275.935,305.073 278.927,298.658 281.919,292 284.911,285.153 287.903,278.181 290.894,271.205 293.886,264.358 296.878,257.765 
  299.87,251.542 302.862,245.793 305.854,240.615 308.846,236.093 311.837,232.303 314.829,229.312 317.821,227.169 320.813,225.854 323.805,225.34 326.797,225.599 
  329.788,226.595 332.78,228.281 335.772,230.602 338.764,233.495 341.756,236.888 344.748,240.702 347.74,244.846 350.731,249.223 353.723,253.734 356.715,258.364 
  359.707,263.087 362.699,267.858 365.691,272.64 368.683,277.397 371.674,282.102 374.666,286.731 377.658,291.264 380.65,295.687 383.642,299.99 386.634,304.159 
  389.625,308.189 392.617,312.074 395.609,315.812 398.601,319.4 401.593,322.837 404.585,326.122 407.577,329.256 410.568,332.242 413.56,335.08 416.552,337.776 
  419.544,340.334 422.536,342.76 425.528,345.055 428.519,347.224 431.511,349.27 434.503,351.197 437.495,353.01 440.487,354.712 443.479,356.307 446.471,357.798 
  449.462,359.189 452.454,360.482 455.446,361.681 458.438,362.788 461.43,363.806 464.422,364.735 467.414,365.575 470.405,366.33 473.397,367.004 476.389,367.597 
  479.381,368.111 482.373,368.548 485.365,368.907 488.356,369.189 491.348,369.39 494.34,369.511 497.332,369.548 500.324,369.498 503.316,369.357 506.308,369.121 
  509.299,368.784 512.291,368.341 515.283,367.784 518.275,367.107 521.267,366.301 524.259,365.359 527.25,364.271 530.242,363.034 533.234,361.63 536.226,360.037 
  539.218,358.232 542.21,356.196 545.202,353.907 548.193,351.348 551.185,348.503 554.177,345.354 557.169,341.888 560.161,338.091 563.153,333.952 566.145,329.459 
  569.136,324.602 572.128,319.374 575.12,313.767 578.112,307.787 581.104,301.486 584.096,294.914 587.087,288.135 590.079,281.227 593.071,274.282 596.063,267.407 
  
  "/>
<polygon clip-path="url(#clip00)" points="
493.696,89.6215 578.063,89.6215 578.063,44.2615 493.696,44.2615 
  " fill="#ffffff" fill-opacity="1"/>
<polyline clip-path="url(#clip00)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  493.696,89.6215 578.063,89.6215 578.063,44.2615 493.696,44.2615 493.696,89.6215 
  "/>
<polyline clip-path="url(#clip00)" style="stroke:#0099ff; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  499.696,59.3815 535.696,59.3815 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:start;" transform="rotate(0, 541.696, 63.8815)" x="541.696" y="63.8815">u1(t)</text>
</g>
<polyline clip-path="url(#clip00)" style="stroke:#e9746a; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  499.696,74.5015 535.696,74.5015 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:start;" transform="rotate(0, 541.696, 79.0015)" x="541.696" y="79.0015">u2(t)</text>
</g>
</svg>




The plot recipe [contains special fields](http://docs.juliadiffeq.org/latest/basics/plot.html) for plotting phase diagrams and other transformations:


```julia
plot(sol,title="Phase Diagram",vars=(1,2))
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
  181.786,379.528 181.786,28.805 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  357.247,379.528 357.247,28.805 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  532.708,379.528 532.708,28.805 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  39.0856,251.86 587.581,251.86 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  39.0856,33.358 587.581,33.358 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,384.952 596.063,384.952 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  181.786,384.952 181.786,379.528 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  357.247,384.952 357.247,379.528 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  532.708,384.952 532.708,379.528 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,384.952 30.6037,23.3815 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,251.86 39.0856,251.86 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  30.6037,33.358 39.0856,33.358 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 181.786, 396.952)" x="181.786" y="396.952">1.0</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 357.247, 396.952)" x="357.247" y="396.952">1.5</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 532.708, 396.952)" x="532.708" y="396.952">2.0</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 29.4037, 256.36)" x="29.4037" y="256.36">0.5</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 29.4037, 37.858)" x="29.4037" y="37.858">1.0</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:21; text-anchor:middle;" transform="rotate(0, 313.333, 18)" x="313.333" y="18">Phase Diagram</text>
</g>
<polyline clip-path="url(#clip02)" style="stroke:#0099ff; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  181.786,33.358 163.953,39.8345 147.573,47.58 132.604,56.4108 118.99,66.1464 106.666,76.6165 95.5584,87.6609 85.5927,99.1331 76.693,110.901 68.7863,122.846 
  61.8036,134.864 55.6794,146.866 50.3525,158.775 45.7668,170.525 41.8713,182.064 38.6197,193.344 35.9704,204.331 33.8865,214.995 32.3349,225.316 31.2869,235.277 
  30.7172,244.869 30.6037,254.083 30.9268,262.916 31.6699,271.367 32.8193,279.44 34.3634,287.139 36.2926,294.47 38.5997,301.441 41.2791,308.06 44.3261,314.335 
  47.7377,320.276 51.5121,325.893 55.6489,331.195 60.1489,336.194 65.0133,340.899 70.2452,345.319 75.8484,349.466 81.8272,353.348 88.186,356.974 94.9298,360.352 
  102.064,363.489 109.594,366.394 117.527,369.072 125.869,371.529 134.625,373.771 143.8,375.801 153.399,377.623 163.434,379.242 173.911,380.66 184.834,381.879 
  196.208,382.899 208.033,383.72 220.309,384.338 233.034,384.75 246.202,384.952 259.806,384.937 273.839,384.699 288.29,384.228 303.146,383.515 318.384,382.546 
  333.968,381.305 349.877,379.776 366.08,377.943 382.534,375.783 399.182,373.272 415.957,370.382 432.777,367.081 449.548,363.334 466.166,359.103 482.511,354.345 
  498.453,349.015 513.848,343.063 528.541,336.438 542.412,329.093 555.268,320.966 566.81,311.982 576.761,302.087 584.872,291.247 590.919,279.448 594.707,266.698 
  596.063,253.024 594.844,238.475 590.932,223.121 584.235,207.049 574.687,190.372 562.249,173.218 546.92,155.754 528.89,138.277 508.491,121.125 486.066,104.609 
  461.971,89.0189 436.573,74.6179 410.25,61.6458 383.39,50.3178 356.393,40.8247 329.669,33.3329 303.617,27.9647 278.448,24.6685 254.35,23.3815 231.491,24.0317 
  210,26.5256 189.967,30.7482 171.446,36.5625 154.454,43.8103 138.97,52.3114 124.933,61.8644 112.248,72.2459 100.78,83.2111 90.3701,94.5101 81.0217,106.111 
  72.6961,117.942 65.3203,129.894 58.8264,141.872 53.1517,153.79 48.2391,165.576 44.0366,177.171 40.4975,188.527 37.5805,199.607 35.2478,210.386 33.4588,220.831 
  32.1846,230.926 31.4004,240.659 31.0832,250.023 31.2129,259.011 31.7713,267.62 32.7426,275.85 34.1135,283.702 35.8729,291.18 38.0119,298.291 40.5241,305.045 
  43.4054,311.453 46.6538,317.529 50.2655,323.28 54.2393,328.712 58.5763,333.838 63.2784,338.666 68.3477,343.207 73.7873,347.471 79.6005,351.466 85.7912,355.202 
  92.3641,358.685 99.3243,361.925 106.677,364.928 114.429,367.702 122.587,370.253 131.141,372.579 140.091,374.684 149.457,376.576 159.255,378.262 169.497,379.748 
  180.194,381.037 191.351,382.131 202.972,383.031 215.056,383.736 227.601,384.241 240.6,384.544 254.044,384.636 267.919,384.511 282.21,384.158 296.898,383.567 
  311.96,382.722 327.371,381.611 343.102,380.217 359.122,378.521 375.395,376.503 391.883,374.142 408.545,371.416 425.336,368.317 442.152,364.801 458.87,360.81 
  475.354,356.29 491.465,351.187 507.049,345.454 521.947,339.044 535.991,331.915 549.004,324.028 560.798,315.345 571.179,305.834 579.943,295.465 586.878,284.209 
  591.762,272.043 594.365,258.946 594.448,244.9 591.8,229.92 586.337,214.134 577.984,197.671 566.734,180.689 552.65,163.383 535.866,145.986 516.588,128.764 
  
  "/>
<polygon clip-path="url(#clip00)" points="
480.516,74.5015 578.063,74.5015 578.063,44.2615 480.516,44.2615 
  " fill="#ffffff" fill-opacity="1"/>
<polyline clip-path="url(#clip00)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  480.516,74.5015 578.063,74.5015 578.063,44.2615 480.516,44.2615 480.516,74.5015 
  "/>
<polyline clip-path="url(#clip00)" style="stroke:#0099ff; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  486.516,59.3815 522.516,59.3815 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:start;" transform="rotate(0, 528.516, 63.8815)" x="528.516" y="63.8815">(u1,u2)</text>
</g>
</svg>




## Extra Features

The solution object acts both as an array and as an interpolation of the solution


```julia
@show sol.t[3] # Time at the 3rd timestep
@show sol[3] # Value at the third timestep
@show sol(5) # Value at t=5 using the interpolation 
```

    sol.t[3] = 0.29277163636804704
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
12.8259,369.674 596.063,369.674 596.063,3.93701 12.8259,3.93701 
  " fill="#ffffff" fill-opacity="1"/>
<defs>
  <clipPath id="clip02">
    <rect x="12" y="3" width="584" height="366"/>
  </clipPath>
</defs>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  12.8259,364.188 12.8259,9.42306 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  129.473,364.188 129.473,9.42306 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  246.121,364.188 246.121,9.42306 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  362.768,364.188 362.768,9.42306 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  479.416,364.188 479.416,9.42306 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  596.063,364.188 596.063,9.42306 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  21.5745,246.846 587.314,246.846 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:0.5; fill:none" stroke-dasharray="1, 2" points="
  21.5745,105.782 587.314,105.782 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  12.8259,369.674 596.063,369.674 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  12.8259,369.674 12.8259,364.188 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  129.473,369.674 129.473,364.188 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  246.121,369.674 246.121,364.188 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  362.768,369.674 362.768,364.188 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  479.416,369.674 479.416,364.188 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  596.063,369.674 596.063,364.188 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  12.8259,369.674 12.8259,3.93701 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  12.8259,246.846 21.5745,246.846 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  12.8259,105.782 21.5745,105.782 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 12.8259, 381.674)" x="12.8259" y="381.674">0</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 129.473, 381.674)" x="129.473" y="381.674">2</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 246.121, 381.674)" x="246.121" y="381.674">4</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 362.768, 381.674)" x="362.768" y="381.674">6</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 479.416, 381.674)" x="479.416" y="381.674">8</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:middle;" transform="rotate(0, 596.063, 381.674)" x="596.063" y="381.674">10</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 11.6259, 251.346)" x="11.6259" y="251.346">1</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:end;" transform="rotate(0, 11.6259, 110.282)" x="11.6259" y="110.282">2</text>
</g>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:16; text-anchor:middle;" transform="rotate(0, 304.444, 397.6)" x="304.444" y="397.6">t</text>
</g>
<polyline clip-path="url(#clip02)" style="stroke:#0099ff; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  12.8259,246.846 16.4711,258.786 17.2002,253.567 18.0204,246.55 18.9431,249.104 19.9811,244.619 21.1489,241.547 22.4626,250.543 23.9406,257.447 25.6034,278.791 
  27.4019,273.369 29.4252,271.638 31.6377,275.134 34.1036,281.282 36.5645,285.245 39.2473,302.381 42.008,308.59 44.8653,324.533 47.7611,331.094 50.7985,331.732 
  53.7547,324.655 57.0774,341.55 60.413,336.949 63.8164,341.208 67.4308,337.96 71.0676,341.424 74.7199,346.258 78.6086,341.246 82.5146,331.559 86.6761,328.398 
  90.9859,334.861 95.4301,325.94 100.138,318.528 105.256,298.098 110.561,303.202 115.444,291.594 120.811,297.345 125.665,300.554 130.555,279.698 136.056,273.172 
  141.121,282.791 145.279,271.611 149.957,251.795 154.934,242.617 158.988,243.59 163.137,226.762 167.251,206.361 171.617,217.752 175.173,214.894 178.986,211.224 
  182.746,172.584 186.976,159.418 190.611,108.864 194.7,108.208 197.993,104.273 201.33,128.241 204.432,138.434 207.652,134.043 211.142,121.633 214.613,98.5248 
  218.256,136.919 221.394,133.543 224.924,140.967 228.348,163.99 231.746,170.773 235.569,231.209 239.87,246.741 243.673,245.564 247.951,246.505 252.317,275.976 
  256.184,286.554 260.35,275.764 265.036,278.281 269.539,248.458 274.604,204.599 280.027,149.998 284.961,158.442 288.659,155.118 292.82,212.897 296.595,191.813 
  300.841,212.722 304.179,211.482 307.935,213.678 311.434,213.899 315.342,211.703 318.963,214.479 323.001,218.162 326.85,213.482 330.98,193.957 335.627,194.165 
  339.712,189.787 344.097,177.539 348.179,172.996 352.33,158.591 356.647,95.412 361.414,142.065 365.052,147.584 369.145,162.348 373.092,151.076 377.532,65.3799 
  382.073,47.1937 385.883,39.5695 389.59,84.7187 393.277,94.0403 397.198,80.7431 401.303,113.431 405.02,122.477 409.201,108.588 413.043,87.6686 416.858,23.376 
  419.8,37.2532 422.399,21.9516 424.901,37.6544 427.118,3.93701 429.227,46.4014 431.1,29.7888 433.016,74.0666 434.717,97.6057 436.507,138.86 438.181,138.131 
  439.978,153.044 441.668,165.15 443.414,160.687 445.158,183.883 446.783,170.007 448.526,196.015 450.066,192.865 451.8,173.355 453.678,180.952 455.28,204.952 
  456.942,204.213 458.75,211.228 460.479,217.984 462.214,213.389 464.075,205.79 465.978,198.074 467.806,229.651 469.5,242.397 471.405,257.498 473.203,250.478 
  475.224,224.586 477.499,269.8 479.13,285.192 480.966,297.719 482.869,299.901 484.912,305.763 486.9,326.2 488.928,334.907 491.09,338.819 493.28,338.625 
  495.51,331.971 497.891,324.351 500.475,325.986 503.09,333.334 505.774,337.583 508.379,338.122 511.278,344.472 514.06,356.324 516.896,357.474 519.825,357.468 
  522.717,354.38 525.884,349.417 529.119,347.922 532.629,352.353 536.163,351.861 539.76,354.157 543.656,357.729 547.548,354.885 551.482,356.591 555.892,350.191 
  560.407,350.303 565.027,351.356 569.88,342.234 575.275,333.307 580.739,327.049 586.639,315.765 592.981,324.152 596.063,321.697 
  "/>
<polyline clip-path="url(#clip02)" style="stroke:#e9746a; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  12.8259,246.846 16.4711,251.963 17.2002,254.371 18.0204,254.588 18.9431,253.943 19.9811,254.065 21.1489,256.417 22.4626,259.39 23.9406,262.405 25.6034,263.142 
  27.4019,265.974 29.4252,270.605 31.6377,267.603 34.1036,266.953 36.5645,271.541 39.2473,272.61 42.008,279.733 44.8653,286.838 47.7611,288.411 50.7985,299.454 
  53.7547,303.852 57.0774,306.766 60.413,310.811 63.8164,311.682 67.4308,314.728 71.0676,320.569 74.7199,324.715 78.6086,329.969 82.5146,334.123 86.6761,338.036 
  90.9859,341.816 95.4301,346.595 100.138,348.666 105.256,353.422 110.561,356.385 115.444,359.13 120.811,360.482 125.665,362.57 130.555,364.291 136.056,365.635 
  141.121,366.095 145.279,367.466 149.957,367.308 154.934,368.206 158.988,368.8 163.137,369.674 167.251,369.325 171.617,369.478 175.173,369.53 178.986,369.179 
  182.746,368.366 186.976,367.763 190.611,366.756 194.7,365.772 197.993,364.764 201.33,362.437 204.432,360.893 207.652,360.129 211.142,359.357 214.613,357.144 
  218.256,355.787 221.394,353.356 224.924,351.135 228.348,350.672 231.746,349.413 235.569,348.204 239.87,350.655 243.673,352.852 247.951,354.653 252.317,355.347 
  256.184,356.443 260.35,358.237 265.036,358.573 269.539,359.539 274.604,358.863 280.027,359.489 284.961,358.401 288.659,358.029 292.82,357.896 296.595,358.767 
  300.841,358.11 304.179,358.556 307.935,358.146 311.434,358.532 315.342,358.443 318.963,357.299 323.001,358.103 326.85,359.126 330.98,359.184 335.627,357.698 
  339.712,358.191 344.097,356.793 348.179,357.019 352.33,355.533 356.647,353.331 361.414,350.851 365.052,349.437 369.145,347.443 373.092,345.257 377.532,341.656 
  382.073,336.09 385.883,331.323 389.59,327.612 393.277,324.374 397.198,315.425 401.303,310.656 405.02,304.507 409.201,303.092 413.043,297.287 416.858,288.471 
  419.8,281.134 422.399,271.356 424.901,262.734 427.118,258.132 429.227,253.705 431.1,247.265 433.016,244.914 434.717,239.349 436.507,232.113 438.181,230.01 
  439.978,226.97 441.668,219.359 443.414,213.618 445.158,209.735 446.783,211.714 448.526,212.216 450.066,214.209 451.8,210.629 453.678,208.126 455.28,206.344 
  456.942,208.724 458.75,211.548 460.479,213.813 462.214,212.807 464.075,213.168 465.978,210.58 467.806,213.859 469.5,219.926 471.405,223.028 473.203,224.542 
  475.224,225.357 477.499,231.025 479.13,237.389 480.966,238.071 482.869,235 484.912,238.193 486.9,243.704 488.928,245.382 491.09,247.784 493.28,255.867 
  495.51,263.456 497.891,267.281 500.475,270.113 503.09,269.925 505.774,282.426 508.379,285.129 511.278,292.066 514.06,298.156 516.896,304.086 519.825,314.363 
  522.717,318.306 525.884,322.699 529.119,324.591 532.629,327.946 536.163,332.635 539.76,334.873 543.656,337.77 547.548,343.675 551.482,345.05 555.892,348.573 
  560.407,352.746 565.027,354.553 569.88,357.123 575.275,359.15 580.739,360.961 586.639,362.952 592.981,366.294 596.063,368.402 
  "/>
<polygon clip-path="url(#clip00)" points="
493.696,70.177 578.063,70.177 578.063,24.817 493.696,24.817 
  " fill="#ffffff" fill-opacity="1"/>
<polyline clip-path="url(#clip00)" style="stroke:#00002d; stroke-width:0.8; stroke-opacity:1; fill:none" points="
  493.696,70.177 578.063,70.177 578.063,24.817 493.696,24.817 493.696,70.177 
  "/>
<polyline clip-path="url(#clip00)" style="stroke:#0099ff; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  499.696,39.937 535.696,39.937 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:start;" transform="rotate(0, 541.696, 44.437)" x="541.696" y="44.437">u1(t)</text>
</g>
<polyline clip-path="url(#clip00)" style="stroke:#e9746a; stroke-width:2.4; stroke-opacity:1; fill:none" points="
  499.696,55.057 535.696,55.057 
  "/>
<g clip-path="url(#clip00)">
<text style="fill:#00002d; fill-opacity:1; font-family:Arial,Helvetica Neue,Helvetica,sans-serif; font-size:12; text-anchor:start;" transform="rotate(0, 541.696, 59.557)" x="541.696" y="59.557">u2(t)</text>
</g>
</svg>




## Documentation

For more information, see the documentation: https://github.com/JuliaDiffEq/DifferentialEquations.jl

## Problems 

### Problem 1

The DifferentialEquations.jl algorithms choose the number type of their calculation given their input. Use this fact to solve the [Lorenz equation](https://en.wikipedia.org/wiki/Lorenz_system) using BigFloats. You may want to [check out the example notebooks](https://github.com/JuliaDiffEq/DiffEqTutorials.jl). Make a 3D plot of the Lorenz attractor using the plot recipe.



### Problem 2

Use the [event handling](http://docs.juliadiffeq.org/latest/features/callback_functions.html) the model a bouncing ball with friction, i.e. at every bounce the velocity flips but is decreased to 80%. Does the ball eventually stop bouncing?

### Problem 3 

Install the LSODA and ODEInterfaceDiffEq (note: ODEInterface may give build issues on Windows! See the repo README for details on setting up the compiler) and run some of the [benchmarks notebooks](https://github.com/JuliaDiffEq/DiffEqBenchmarks.jl) on your machine. Do you notice any trends amongst the algorithms? Use the method as shown in the Pleiades benchmarks to benchmark the algorithms against each other on nonlinear problems with no known analytical solution. Try building an example problem with a large number of independent variables to accentuate the differences between the algorithms (Example: the Linear problem in the benchmarks is a 100x100 problem).
