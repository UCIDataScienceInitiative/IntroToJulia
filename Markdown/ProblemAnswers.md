
## Problem 1


```julia
N = 10
A = zeros(N,N)
for i in 1:N, j in 1:N
    abs(i-j)<=1 ? A[i,j]+=1 : nothing
    i==j ? A[i,j]-=3 : nothing
end
A
```




    10×10 Array{Float64,2}:
     -2.0   1.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0
      1.0  -2.0   1.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0
      0.0   1.0  -2.0   1.0   0.0   0.0   0.0   0.0   0.0   0.0
      0.0   0.0   1.0  -2.0   1.0   0.0   0.0   0.0   0.0   0.0
      0.0   0.0   0.0   1.0  -2.0   1.0   0.0   0.0   0.0   0.0
      0.0   0.0   0.0   0.0   1.0  -2.0   1.0   0.0   0.0   0.0
      0.0   0.0   0.0   0.0   0.0   1.0  -2.0   1.0   0.0   0.0
      0.0   0.0   0.0   0.0   0.0   0.0   1.0  -2.0   1.0   0.0
      0.0   0.0   0.0   0.0   0.0   0.0   0.0   1.0  -2.0   1.0
      0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   1.0  -2.0




```julia
#### Prepare Data

X = rand(1000, 3)               # feature matrix
a0 = rand(3)                    # ground truths
y = X * a0 + 0.1 * randn(1000);  # generate response
```




    1000-element Array{Float64,1}:
     1.0737  
     0.617939
     0.941093
     0.142068
     0.6174  
     0.361449
     0.657612
     0.571313
     0.310871
     0.407938
     0.330809
     0.263355
     0.949922
     ⋮       
     0.223555
     0.41471 
     0.29676 
     0.991029
     0.395745
     0.947528
     0.835744
     0.669867
     0.836518
     0.393077
     0.543453
     0.5212  



## Problem 2


```julia
X2 = hcat(X,ones(1000))
println(X2\y)
```

    [0.120512,0.0732871,0.954649,0.00897003]


## Problem 3


```julia
using MultivariateStats
llsq(X,y)
```




    4-element Array{Float64,1}:
     0.120512  
     0.0732871 
     0.954649  
     0.00897003



## Problem 4


```julia
using DataFrames, GLM
data = DataFrame(X1=X[:,1], X2=X[:,2], X3=X[:,3],Y=y)
OLS = lm(Y ~ X1 + X2 + X3, data)
```




    DataFrames.DataFrameRegressionModel{GLM.LinearModel{GLM.LmResp{Array{Float64,1}},GLM.DensePredQR{Float64}},Array{Float64,2}}
    
    Formula: Y ~ 1 + X1 + X2 + X3
    
    Coefficients:
                   Estimate  Std.Error  t value Pr(>|t|)
    (Intercept)  0.00897003 0.00960328 0.934059   0.3505
    X1             0.120512  0.0106063  11.3623   <1e-27
    X2            0.0732871   0.010627   6.8963   <1e-11
    X3             0.954649  0.0106649  89.5128   <1e-99



