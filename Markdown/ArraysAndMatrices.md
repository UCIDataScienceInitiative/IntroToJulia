
# More Details on Arrays and Matrices

## Array Operations

One key feature for doing math in Julia are the `broadcast` and `map` operations. The `map` operation is like an R or MATLAB `apply` which applies a function to each element of an array. For example, we can apply the anonymous function `(x)->x^2` to each element via:


```julia
map((x)->x^2,1:5)
```




    5-element Array{Int64,1}:
      1
      4
      9
     16
     25



The `broadcast` operation is similar except it is for "elements which have a shape" and it will "broadcast the shaped objects to a common size by expanding singleton dimensions". For example, the following broadcast's `+` onto `A` and `B`:


```julia
A = 1:5 # Acts like a column vector, Julia is "column-major" so columns come first
B = [1 2
     3 4
     5 6
     7 8
     9 10]
broadcast(+,A,B)
```




    5×2 Array{Int64,2}:
      2   3
      5   6
      8   9
     11  12
     14  15



If `A` and `B` are the same size, then broadcasting is the same as mapping.

### In-Depth Julia 1: Special Broadcasting Syntax

One major area (which is under a lot of active development) is the specialized broadcasting syntax. The short summary is, putting a `.` with a function or operator causes it to broadcast. For example, we can broadcast any function with the syntax `f.(x)`, and broadcast operators by `.+` and related. For example:


```julia
A = 1:5
B = [2;3;4;5;6]
A.*B
```




    5-element Array{Int64,1}:
      2
      6
     12
     20
     30



People coming from MATLAB might recognize this as "element-wise multiplication". If this was a basic introduction to Julia, I'd say this was element-wise multiplication and be done with it. However, this is the non-trivial introduction. [Note: Some of this is not true right now (v0.5) but is becoming true...].

While it looks the same to the user, the implementation is very different  In MATLAB and earlier versions of Julia, `.*` was an operator. In Julia's more refined world, we can explain this as `.*{T<:Number,N}(x::Array{T,N},y::Array{T,N})` being a function, and `A.*B` calling this function. However, if `.*` is just a function, then


```julia
C = [3;4;5;2;1]
A.*B.*C
```




    5-element Array{Int64,1}:
      6
     24
     60
     40
     30



the operation `A.*B.*C` actually expands into `.*(A,.*(B,C))`. Let's think of how we'd implement `.*`.

-----

#### Question 1

How would you implement `.*` as a function (not using broadcast)? Don't peak below!

------


```julia
function .*{T<:Number,N}(x::Array{T,N},y::Array{T,N})
    output = similar(x) # Makes an array of similar size and shape as x
    for i in eachindex(x) # Let the iterator choose the fast linear indexing for x
        output[i] = x[i]*y[i]
    end
    output
end
```


    LoadError: error in method definition: function Base..* must be explicitly imported to be extended
    while loading In[13], in expression starting on line 1

    


Notice that `.*` creates an array every time it is called. Therefore a naive approach where `.*` is a function creates two arrays in the call `A.*B.*C`. We saw earlier that reducing memory allocations leads to vastly improved performance, so a better implementation would be to do this all together as one loop:


```julia
function Base.:.*{T<:Number,N}(x::Array{T,N},y::Array{T,N},z::Array{T,N})
    output = similar(x) # Makes an array of similar size and shape as x
    for i in eachindex(x) # Let the iterator choose the fast linear indexing for x
        output[i] = x[i]*y[i]*z[i]
    end
    output
end
```

(but notice this doesn't really work because now `.*` isn't a binary operator and therefore the inline syntax won't work). This optimization is known as "loop fusing". Julia does this by searching for all of the broadcasts in a line and putting them together into one broadcast statement during parsing time. Therefore, in Julia `A.*B.*C` creates an anonymous function and broadcasts on it, like


```julia
broadcast((x,y,z)->x*y*z,A,B,C)
```




    5-element Array{Int64,1}:
      6
     24
     60
     40
     30



Notice that this is equivalent to our 1-loop solution. However, because all array-based math uses this broadcasting syntax with a `.`, Julia can fuse the broadcasts on all sorts of mathematical expressions on arrays:


```julia
A.*B.*sin.(C)
```




    5-element Array{Float64,1}:
       0.28224
      -4.54081
     -11.5071 
      18.1859 
      25.2441 



One last thing to note is that we can also broadcast `=`. This would be the same thing is as the loop `A[i] = ...` and thus requires the array `A` to already be define. Thus for example, if we let


```julia
D = similar(C)
```




    5-element Array{Int64,1}:
     140539342502768
     140539342502832
     140539342502896
     140539342502672
     140539342537392



then the operation


```julia
@time D.=A.*B.*C
```

      0.000008 seconds (10 allocations: 512 bytes)





    5-element Array{Int64,1}:
      6
     24
     60
     40
     30



does not allocate any arrays. Reducing temporary array allocations is one way Julia outperforms other scientific computing languages.

Summary: `.` makes operations element-wise, but in a very smart way.

## Vectors, Matrices, and Linear Algebra

Julia's linear algebra syntax follows MATLAB's to a large extent (it's just about the only thing MATLAB got right!). We already saw this a little bit by seeing Julia's array indexing syntax. For example, we can get the first three elements by `1:3`:


```julia
A = rand(4,4) # Generate a 4x4 random matrix
A[1:3,1:3] # Take the top left 3-3 matrix
```




    3×3 Array{Float64,2}:
     0.168453  0.121436  0.395455
     0.531294  0.545059  0.08028 
     0.813272  0.732868  0.336742



Note that Julia is column-major, meaning that columns come first in both indexing order and in the computer's internal representation.

### In-Depth Julia 2: Views

Notice that `A[1:3,1:3]` returned an array. Where did this array come from? Well, since there was no 3x3 array before, `A[1:3,1:3]` created an array (i.e. it had to allocate memory)


```julia
@time A[1:3,1:3]
```

      0.000005 seconds (8 allocations: 416 bytes)





    3×3 Array{Float64,2}:
     0.168453  0.121436  0.395455
     0.531294  0.545059  0.08028 
     0.813272  0.732868  0.336742



Do you always have to allocate memory when making new arrays? We saw before this wasn't the case when dealing with references. Recall the example where modifying one array modified another:


```julia
a = [1;3;5]
@time b = a
a[2] = 10
a
@time c = copy(a)
```

      0.000001 seconds (3 allocations: 144 bytes)
      0.000004 seconds (6 allocations: 320 bytes)





    3-element Array{Int64,1}:
      1
     10
      5



Notice that in the first case making `b` didn't allocate an array: it just made an object with a pointer (an Int64), and had that pointer point to the same array as `a`. To better understand this behavior and exploit to for major performance gains, we need to make a distinction. The array itself is the memory layout. For Julia arrays, this is actually a C-pointer to a contiguous 1-dimensional slot of memory. The `Array` type in Julia (and thus `Vector` and `Matrix` which are type-alises for `Array{T,1}` and `Array{T,2}` respectively) is a "view" to to that actual array. A view is a type which points to an array, and has a compatibility layer that changes how things like the indexing works. For example: if we define the matrix


```julia
A = rand(4,4)
```




    4×4 Array{Float64,2}:
     0.348922   0.716248  0.960668  0.952156
     0.795233   0.888537  0.728711  0.655722
     0.0666479  0.396674  0.462853  0.738748
     0.191717   0.941639  0.112687  0.946103



then the array that we made is actually a 16-number long sequence (of 64-bit Floats) in memory, and `A` is a view to that array which makes it index "like" it was 2-dimensional (reading down the columns). This tells us one thing already: looping through the columns is faster than looping through the rows. Indeed we can easily test this: 


```julia
function testloops()
    b = rand(1000,1000)
    c = 0 # Need this so that way the compiler doesn't optimize away the loop!
    @time for i in 1:1000, j in 1:1000
        c+=b[i,j]
    end
    @time for j in 1:1000, i in 1:1000
        c+=b[i,j]
    end
    bidx = eachindex(b)
    @time for i in bidx
        c+=b[i]
    end
end
testloops()
```

      0.037648 seconds (3.00 M allocations: 45.776 MB, 9.13% gc time)
      0.028310 seconds (3.00 M allocations: 45.776 MB, 15.80% gc time)
      0.026682 seconds (3.00 M allocations: 45.776 MB, 11.06% gc time)


    WARNING: Method definition testloops() in module Main at In[46]:2 overwritten at In[47]:2.


One should normally use the `eachindex` function since this will return the indices in the "fast" order for general iterator types.

In this terminology `A[1:3,1:3]` isn't a view to the same memory. We can check this by noticing that it doesn't mutate the original array:


```julia
println(A)
B = A[1:3,1:3]
B[1,1]=100
println(A)
```

    [0.348922 0.716248 0.960668 0.952156; 0.795233 0.888537 0.728711 0.655722; 0.0666479 0.396674 0.462853 0.738748; 0.191717 0.941639 0.112687 0.946103]
    [0.348922 0.716248 0.960668 0.952156; 0.795233 0.888537 0.728711 0.655722; 0.0666479 0.396674 0.462853 0.738748; 0.191717 0.941639 0.112687 0.946103]


If we instead want a view, then we can use the `view` function:


```julia
B = view(A,1:3,1:3) # No copy involved
B[1,1] = 100 # Will mutate A
println(A)
```

    [100.0 0.716248 0.960668 0.952156; 0.795233 0.888537 0.728711 0.655722; 0.0666479 0.396674 0.462853 0.738748; 0.191717 0.941639 0.112687 0.946103]


There are many cases where you might want to use a view. For example, if a function needs the `i`th column, you may naively think of doing `f(A[i,:])`. But, if `A` won't be changed in the loop, we can avoid the memory allocation (and thus make things faster) by sending a view to the original array which is simply the column: `f(view(A,i,:))`. Two functions can be used to give common views. `vec` gives a view of the array as a Vector and `reshape` builds a view in a different shape. For example:


```julia
C = vec(A)
println(C)
C = reshape(A,8,2) # C is an 8x2 matrix
C
```

    [100.0,0.795233,0.0666479,0.191717,0.716248,0.888537,0.396674,0.941639,0.960668,0.728711,0.462853,0.112687,0.952156,0.655722,0.738748,0.946103]





    8×2 Array{Float64,2}:
     100.0        0.960668
       0.795233   0.728711
       0.0666479  0.462853
       0.191717   0.112687
       0.716248   0.952156
       0.888537   0.655722
       0.396674   0.738748
       0.941639   0.946103



Since these operations do not copy the array, they are very cheap and can be used without worrying about performance issues.

### Back to Linear Algebra

Julia performs functions on matrices by default for dispatches on matrices. For example, `+` is the matrix addition, while `*` is matrix multiplication. Julia's `*` calls into a program known as OpenBLAS so that way `*` is an optimized multithreaded operation. For example:


```julia
A = rand(4,4); B = rand(4,4)
C = A*B # Matrix Multiplication
D = A.*B # Element-wise Multiplication
C-D # Not zero 
```




    4×4 Array{Float64,2}:
     0.906899  1.09457   1.13941   0.673966
     0.663752  0.397312  0.515964  0.442822
     1.12845   1.27351   0.972741  0.140849
     0.956337  1.03546   0.662021  0.720551



A common operation is to solve the linear system `Ax=b`. In Julia this is done by `A\b`:


```julia
b = 1:4
A\b
```




    4-element Array{Float64,1}:
      10.2694
     -45.8265
      70.7536
     -63.3756



Note that this uses a direct solver. Iterative solvers for linear equations can be found in IterativeSolvers.jl hosted by the JuliaMath organization.

## A note about "Vectorization"

In MATLAB/Python/R you're told to "vectorize" your options, i.e. use `apply` or these `.*` operations, in order to speed up computations. This is because these operations call C programs which will be faster than any interpreted MATLAB/Python/R loop. In Julia, that's not the case: as long as your functions are type-stable, you will get maximal performance. Thus vectorization does not improve performance.

In fact, vectorization can reduce performance by creating "temporary arrays". Those are the intermediate array allocations that come up with doing operations like `C[i,:] = A[i,:] .* B[i,:]`. In general, for the best performance one should avoid vectorized calls or be careful to use the broadcast/view syntax to define a statement without temporaries:


```julia
C[i,:] .= view(A,i,:) .* view(B,i,:)
```

Note the odd quirk: array indexing is a view when on the left-hand side 

#### Discussion: why is this the case?

## Sprase Matrices

Sprase Matrix capabilities are provided by SuiteSparse. Note that these are saved in a table format, where there are triplets (i,j,value) which denote the existance of a non-zero element at `(i,j)` of value `value`. A sparse matrix can be created through the `sparse` command:


```julia
A = sparse([1;2;3],[2;2;1],[3;4;5])
```




    3×2 sparse matrix with 3 Int64 nonzero entries:
    	[3, 1]  =  5
    	[1, 2]  =  3
    	[2, 2]  =  4



They can be converted into a dense matrix with the `full` command


```julia
full(A)
```




    3×2 Array{Int64,2}:
     0  3
     0  4
     5  0



The documentation shows a lot more that you can do.

## Special Matrix Types

Like the rest of Julia, types and multiple dispatch is used to "secretly enhance performance". There are many matrix types, so I will just show a few and leave the rest to the documentation.

### Matrix Forms

Many matrices follow specific forms: diagonal, tridiagonal, etc. Julia has special types for these common matrix forms. For example, we can define a `Tridiagonal` by giving it three vectors:


```julia
A = Tridiagonal(2:5,1:5,1:4)
```




    5×5 Tridiagonal{Int64}:
     1  1  ⋅  ⋅  ⋅
     2  2  2  ⋅  ⋅
     ⋅  3  3  3  ⋅
     ⋅  ⋅  4  4  4
     ⋅  ⋅  ⋅  5  5



We can inspect it to see its internal form:


```julia
fieldnames(A)
```




    4-element Array{Symbol,1}:
     :dl 
     :d  
     :du 
     :du2




```julia
A.d
```




    5-element Array{Int64,1}:
     1
     2
     3
     4
     5



Notice that what the array stores is the vectors for the diagonals themselves. It's clear to see that this gives a memory enhancement over a dense matrix, and it gives a performance advantage because a dense matrix would have an extra operation for each `0`. However, it's also faster than a sprase matrix since a sparse matrix is stored as a table `(i,j,value)` and retriving from the table has a bit of overhead, while this is stored as 3 (actually 4...) contiguous arrays. Therefore you get a performance boost by using a special matrix form like `Tridiagonal` whenever one is available. Note that these special matrix forms are outfitted with dispatches so that operations on them work seamlessly like with normal matrices. For example, we can multiply a Tridiagonal by a dense matrix:


```julia
A*rand(5,5)
```




    5×5 Array{Float64,2}:
     0.780741  0.74277  0.193545  0.675908  1.248  
     3.30878   3.08334  1.79876   2.54081   3.93285
     5.81165   5.22405  4.35947   3.73634   6.53809
     7.1226    4.86664  5.38682   6.70923   7.78302
     4.535     2.08879  3.20436   5.41406   6.13665



### The UniformScaling Operator

One interesting type is the `UniformScaling` operator `I`. Essentially, I uses dispatches to cleverly act like the identity matrix without ever forming a matrix. For example, to mathematically subtract a scalar `λ` from a matrix `A` we use the notation $$ A - \lambda I$$

We can do this naturally with the `I` operator:


```julia
λ = 2
A - λ*I
```




    5×5 Tridiagonal{Int64}:
     -1  1  ⋅  ⋅  ⋅
      2  0  2  ⋅  ⋅
      ⋅  3  1  3  ⋅
      ⋅  ⋅  4  2  4
      ⋅  ⋅  ⋅  5  3



The MATLAB or NumPy way would be to create the identity matrix via a command like `eye(5)`, but notice this prevents the allocation of a 5x5 array. For large matrices, this operation is huge and thus this could lead to some good performance improvements.

### Factorization Forms

One last type of interest are the factorization forms. In many cases, you factorize a matrix using some factorization command in order to speed up subsequence `A\b` calls. Normally you have to remember how this is done. For example, we can use a QR factorization to solve a linear system like:


```julia
b = 1:5
A = rand(5,5)
Q,R = qr(A)
println(A\b)
println(inv(R)*Q'*b)
```

    [76.7207,-41.2925,10.9053,24.3147,-27.5507]
    [76.7207,-41.2925,10.9053,24.3147,-27.5507]


Thus we can save the variables `Q` and `R` and use `inv(R)*Q'*b` instead of `A\b` and get better performance. This is the NumPy/MATLAB way. However, that requires remembering the details of the factorization. Instead, we can have Julia return a factorization type:


```julia
q = qrfact(A)
```




    Base.LinAlg.QRCompactWY{Float64,Array{Float64,2}}([-0.59303 -0.936694 -1.45618 -1.1015 -1.56616; 0.175783 -0.424785 0.173332 -0.556283 0.156938; 0.144953 0.12557 0.387682 0.385917 0.496761; 0.245034 -0.697802 -0.470008 -0.372761 -0.333139; 0.354059 -0.029529 -0.000566456 -0.459193 -0.127657],[1.61641 -0.0269726 -0.0582957 -0.295851 0.0; 6.91248e-310 1.33017 -0.988298 0.736517 0.0; 6.91248e-310 0.0 1.63813 1.27101 0.0; 6.91248e-310 0.0 6.91249e-310 1.65172 0.0; 6.91248e-310 0.0 6.91249e-310 6.91249e-310 0.0])



What this does is it internally stores `Qt` (`Qt = Q'`) and `Rinv` (`Rinv = inv(R)`). There is a dispatch defined for this type on \ which makes the `QRCompactWY` type perform the fast algorithm `Rinv*Qt*b`, giving you the performance without having to remember anything:


```julia
q\b
```




    5-element Array{Float64,1}:
      76.7207
     -41.2925
      10.9053
      24.3147
     -27.5507



The result is fast algorithms with clean code.

## Random Numbers

One last little detail is for random numbers. Uniform random numbers are generated by the `rand` function, while normal random numbers are generated by the `randn` function.


```julia
rand(5)
```




    5-element Array{Float64,1}:
     0.308529
     0.427921
     0.196477
     0.297359
     0.128141




```julia
randn(5,5)
```




    5×5 Array{Float64,2}:
     -0.239053  -1.08253   -0.648596   0.167503   2.22728 
      0.557901  -0.312473   1.29566    0.264857  -0.232809
      0.172738  -1.58695   -0.180161  -2.93838    0.787948
     -0.258095  -0.775395   1.67288   -0.641336   1.0621  
      0.805768   1.29153   -0.50146    0.276417  -0.601687



The argument is the size of the array. You can make random numbers which match another array with the `size` function:


```julia
a = [1 2
     3 4]
randn(size(a))
```




    2×2 Array{Float64,2}:
     -0.291548   0.193372
      1.53665   -0.830749


