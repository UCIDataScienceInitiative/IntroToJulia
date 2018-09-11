
## A Basic Introduction to  Julia

This quick introduction assumes that you have basic knowledge of some scripting language and provides an example of the Julia syntax. So before we explain anything, let's just treat it like a scripting language, take a head-first dive into Julia, and see what happens.

You'll notice that, given the right syntax, almost everything will "just work". There will be some peculiarities, and these we will be the facts which we will study in much more depth. Usually, these oddies/differences from other scripting languages are "the source of Julia's power".

### Problems

Time to start using your noggin. Scattered in this document are problems for you to solve using Julia. Many of the details for solving these problems have been covered, some have not. You may need to use some external resources:

https://docs.julialang.org/en/stable/

https://gitter.im/JuliaLang/julia

Solve as many or as few problems as you can during these times. Please work at your own pace, or with others if that's how you're comfortable!

## Documentation and "Hunting"

The main source of information is the [Julia Documentation](http://docs.julialang.org/en/latest/manual/). Julia also provides lots of built-in documentation and ways to find out what's going on. The number of tools for "hunting down what's going on / available" is too numerous to explain in full detail here, so instead this will just touch on what's important. For example, the ? gets you to the documentation for a type, function, etc.


```julia
?copy
```

    search: [0m[1mc[22m[0m[1mo[22m[0m[1mp[22m[0m[1my[22m [0m[1mc[22m[0m[1mo[22m[0m[1mp[22m[0m[1my[22m! [0m[1mc[22m[0m[1mo[22m[0m[1mp[22m[0m[1my[22mto! [0m[1mc[22m[0m[1mo[22m[0m[1mp[22m[0m[1my[22msign deep[0m[1mc[22m[0m[1mo[22m[0m[1mp[22m[0m[1my[22m unsafe_[0m[1mc[22m[0m[1mo[22m[0m[1mp[22m[0m[1my[22mto! [0m[1mc[22mircc[0m[1mo[22m[0m[1mp[22m[0m[1my[22m! [0m[1mc[22m[0m[1mo[22ms[0m[1mp[22mi
    





```
copy(x)
```

Create a shallow copy of `x`: the outer structure is copied, but not all internal values. For example, copying an array produces a new array with identically-same elements as the original.

---

```
copy(A::Transpose)
copy(A::Adjoint)
```

Eagerly evaluate the lazy matrix transpose/adjoint. Note that the transposition is applied recursively to elements.

This operation is intended for linear algebra usage - for general data manipulation see [`permutedims`](@ref Base.permutedims), which is non-recursive.

# Examples

```jldoctest
julia> A = [1 2im; -3im 4]
2×2 Array{Complex{Int64},2}:
 1+0im  0+2im
 0-3im  4+0im

julia> T = transpose(A)
2×2 Transpose{Complex{Int64},Array{Complex{Int64},2}}:
 1+0im  0-3im
 0+2im  4+0im

julia> copy(T)
2×2 Array{Complex{Int64},2}:
 1+0im  0-3im
 0+2im  4+0im
```




To find out what methods are available, we can use the `methods` function. For example, let's see how `+` is defined:


```julia
methods(+)
```




163 methods for generic function <b>+</b>:<ul><li> +(x::<b>Bool</b>, z::<b>Complex{Bool}</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/complex.jl#L277" target="_blank">complex.jl:277</a></li> <li> +(x::<b>Bool</b>, y::<b>Bool</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/bool.jl#L104" target="_blank">bool.jl:104</a></li> <li> +(x::<b>Bool</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/bool.jl#L101" target="_blank">bool.jl:101</a></li> <li> +<i>{T<:AbstractFloat}</i>(x::<b>Bool</b>, y::<b>T</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/bool.jl#L112" target="_blank">bool.jl:112</a></li> <li> +(x::<b>Bool</b>, z::<b>Complex</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/complex.jl#L284" target="_blank">complex.jl:284</a></li> <li> +(a::<b>Float16</b>, b::<b>Float16</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/float.jl#L392" target="_blank">float.jl:392</a></li> <li> +(x::<b>Float32</b>, y::<b>Float32</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/float.jl#L394" target="_blank">float.jl:394</a></li> <li> +(x::<b>Float64</b>, y::<b>Float64</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/float.jl#L395" target="_blank">float.jl:395</a></li> <li> +(z::<b>Complex{Bool}</b>, x::<b>Bool</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/complex.jl#L278" target="_blank">complex.jl:278</a></li> <li> +(z::<b>Complex{Bool}</b>, x::<b>Real</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/complex.jl#L292" target="_blank">complex.jl:292</a></li> <li> +(::<b>Missing</b>, ::<b>Missing</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/missing.jl#L92" target="_blank">missing.jl:92</a></li> <li> +(::<b>Missing</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/missing.jl#L79" target="_blank">missing.jl:79</a></li> <li> +(::<b>Missing</b>, ::<b>Number</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/missing.jl#L93" target="_blank">missing.jl:93</a></li> <li> +(level::<b>Base.CoreLogging.LogLevel</b>, inc::<b>Integer</b>) in Base.CoreLogging at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/logging.jl#L106" target="_blank">logging.jl:106</a></li> <li> +(c::<b>BigInt</b>, x::<b>BigFloat</b>) in Base.MPFR at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/mpfr.jl#L353" target="_blank">mpfr.jl:353</a></li> <li> +(a::<b>BigInt</b>, b::<b>BigInt</b>, c::<b>BigInt</b>, d::<b>BigInt</b>, e::<b>BigInt</b>) in Base.GMP at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/gmp.jl#L443" target="_blank">gmp.jl:443</a></li> <li> +(a::<b>BigInt</b>, b::<b>BigInt</b>, c::<b>BigInt</b>, d::<b>BigInt</b>) in Base.GMP at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/gmp.jl#L442" target="_blank">gmp.jl:442</a></li> <li> +(a::<b>BigInt</b>, b::<b>BigInt</b>, c::<b>BigInt</b>) in Base.GMP at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/gmp.jl#L441" target="_blank">gmp.jl:441</a></li> <li> +(x::<b>BigInt</b>, y::<b>BigInt</b>) in Base.GMP at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/gmp.jl#L412" target="_blank">gmp.jl:412</a></li> <li> +(x::<b>BigInt</b>, c::<b>Union{UInt16, UInt32, UInt64, UInt8}</b>) in Base.GMP at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/gmp.jl#L449" target="_blank">gmp.jl:449</a></li> <li> +(x::<b>BigInt</b>, c::<b>Union{Int16, Int32, Int64, Int8}</b>) in Base.GMP at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/gmp.jl#L455" target="_blank">gmp.jl:455</a></li> <li> +(a::<b>BigFloat</b>, b::<b>BigFloat</b>, c::<b>BigFloat</b>, d::<b>BigFloat</b>, e::<b>BigFloat</b>) in Base.MPFR at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/mpfr.jl#L503" target="_blank">mpfr.jl:503</a></li> <li> +(a::<b>BigFloat</b>, b::<b>BigFloat</b>, c::<b>BigFloat</b>, d::<b>BigFloat</b>) in Base.MPFR at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/mpfr.jl#L496" target="_blank">mpfr.jl:496</a></li> <li> +(a::<b>BigFloat</b>, b::<b>BigFloat</b>, c::<b>BigFloat</b>) in Base.MPFR at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/mpfr.jl#L490" target="_blank">mpfr.jl:490</a></li> <li> +(x::<b>BigFloat</b>, c::<b>BigInt</b>) in Base.MPFR at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/mpfr.jl#L349" target="_blank">mpfr.jl:349</a></li> <li> +(x::<b>BigFloat</b>, y::<b>BigFloat</b>) in Base.MPFR at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/mpfr.jl#L318" target="_blank">mpfr.jl:318</a></li> <li> +(x::<b>BigFloat</b>, c::<b>Union{UInt16, UInt32, UInt64, UInt8}</b>) in Base.MPFR at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/mpfr.jl#L325" target="_blank">mpfr.jl:325</a></li> <li> +(x::<b>BigFloat</b>, c::<b>Union{Int16, Int32, Int64, Int8}</b>) in Base.MPFR at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/mpfr.jl#L333" target="_blank">mpfr.jl:333</a></li> <li> +(x::<b>BigFloat</b>, c::<b>Union{Float16, Float32, Float64}</b>) in Base.MPFR at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/mpfr.jl#L341" target="_blank">mpfr.jl:341</a></li> <li> +(x::<b>Dates.CompoundPeriod</b>, y::<b>Dates.CompoundPeriod</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl:349</a></li> <li> +(x::<b>Dates.CompoundPeriod</b>, y::<b>Dates.Period</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl:347</a></li> <li> +(x::<b>Dates.CompoundPeriod</b>, y::<b>Dates.TimeType</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl:385</a></li> <li> +(x::<b>Dates.Date</b>, y::<b>Dates.Day</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:78</a></li> <li> +(x::<b>Dates.Date</b>, y::<b>Dates.Week</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:76</a></li> <li> +(dt::<b>Dates.Date</b>, z::<b>Dates.Month</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:59</a></li> <li> +(dt::<b>Dates.Date</b>, y::<b>Dates.Year</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:32</a></li> <li> +(dt::<b>Dates.Date</b>, t::<b>Dates.Time</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:20</a></li> <li> +(t::<b>Dates.Time</b>, dt::<b>Dates.Date</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:24</a></li> <li> +(x::<b>Dates.Time</b>, y::<b>Dates.TimePeriod</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:82</a></li> <li> +(dt::<b>Dates.DateTime</b>, z::<b>Dates.Month</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:52</a></li> <li> +(dt::<b>Dates.DateTime</b>, y::<b>Dates.Year</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:28</a></li> <li> +(x::<b>Dates.DateTime</b>, y::<b>Dates.Period</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:80</a></li> <li> +(B::<b>BitArray{2}</b>, J::<b>LinearAlgebra.UniformScaling</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl:88</a></li> <li> +(a::<b>Pkg.Resolve.VersionWeights.VersionWeight</b>, b::<b>Pkg.Resolve.VersionWeights.VersionWeight</b>) in Pkg.Resolve.VersionWeights at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Pkg/src/resolve/VersionWeights.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Pkg/src/resolve/VersionWeights.jl:26</a></li> <li> +(a::<b>Pkg.Resolve.MaxSum.FieldValues.FieldValue</b>, b::<b>Pkg.Resolve.MaxSum.FieldValues.FieldValue</b>) in Pkg.Resolve.MaxSum.FieldValues at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Pkg/src/resolve/FieldValues.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Pkg/src/resolve/FieldValues.jl:49</a></li> <li> +(y::<b>AbstractFloat</b>, x::<b>Bool</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/bool.jl#L114" target="_blank">bool.jl:114</a></li> <li> +<i>{T<:Union{Int128, Int16, Int32, Int64, Int8, UInt128, UInt16, UInt32, UInt64, UInt8}}</i>(x::<b>T</b>, y::<b>T</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/int.jl#L53" target="_blank">int.jl:53</a></li> <li> +(c::<b>Union{UInt16, UInt32, UInt64, UInt8}</b>, x::<b>BigInt</b>) in Base.GMP at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/gmp.jl#L450" target="_blank">gmp.jl:450</a></li> <li> +(c::<b>Union{Int16, Int32, Int64, Int8}</b>, x::<b>BigInt</b>) in Base.GMP at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/gmp.jl#L456" target="_blank">gmp.jl:456</a></li> <li> +(a::<b>Integer</b>, b::<b>Integer</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/int.jl#L791" target="_blank">int.jl:791</a></li> <li> +(x::<b>Integer</b>, y::<b>Ptr</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/pointer.jl#L157" target="_blank">pointer.jl:157</a></li> <li> +(z::<b>Complex</b>, w::<b>Complex</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/complex.jl#L266" target="_blank">complex.jl:266</a></li> <li> +(z::<b>Complex</b>, x::<b>Bool</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/complex.jl#L285" target="_blank">complex.jl:285</a></li> <li> +(x::<b>Real</b>, z::<b>Complex{Bool}</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/complex.jl#L291" target="_blank">complex.jl:291</a></li> <li> +(x::<b>Real</b>, z::<b>Complex</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/complex.jl#L303" target="_blank">complex.jl:303</a></li> <li> +(z::<b>Complex</b>, x::<b>Real</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/complex.jl#L304" target="_blank">complex.jl:304</a></li> <li> +(x::<b>Rational</b>, y::<b>Rational</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/rational.jl#L248" target="_blank">rational.jl:248</a></li> <li> +(x::<b>Integer</b>, y::<b>AbstractChar</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/char.jl#L208" target="_blank">char.jl:208</a></li> <li> +(c::<b>Union{UInt16, UInt32, UInt64, UInt8}</b>, x::<b>BigFloat</b>) in Base.MPFR at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/mpfr.jl#L329" target="_blank">mpfr.jl:329</a></li> <li> +(c::<b>Union{Int16, Int32, Int64, Int8}</b>, x::<b>BigFloat</b>) in Base.MPFR at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/mpfr.jl#L337" target="_blank">mpfr.jl:337</a></li> <li> +(c::<b>Union{Float16, Float32, Float64}</b>, x::<b>BigFloat</b>) in Base.MPFR at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/mpfr.jl#L345" target="_blank">mpfr.jl:345</a></li> <li> +(x::<b>AbstractIrrational</b>, y::<b>AbstractIrrational</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/irrationals.jl#L133" target="_blank">irrationals.jl:133</a></li> <li> +(x::<b>Number</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/operators.jl#L477" target="_blank">operators.jl:477</a></li> <li> +<i>{T<:Number}</i>(x::<b>T</b>, y::<b>T</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/promotion.jl#L411" target="_blank">promotion.jl:411</a></li> <li> +(x::<b>Number</b>, y::<b>Number</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/promotion.jl#L313" target="_blank">promotion.jl:313</a></li> <li> +(r1::<b>OrdinalRange</b>, r2::<b>OrdinalRange</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/range.jl#L978" target="_blank">range.jl:978</a></li> <li> +<i>{T}</i>(r1::<b>LinRange{T}</b>, r2::<b>LinRange{T}</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/range.jl#L985" target="_blank">range.jl:985</a></li> <li> +<i>{R<:TwicePrecision, T}</i>(r1::<b>StepRangeLen{T,R,S} where S</b>, r2::<b>StepRangeLen{T,R,S} where S</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/twiceprecision.jl#L554" target="_blank">twiceprecision.jl:554</a></li> <li> +<i>{T, S}</i>(r1::<b>StepRangeLen{T,S,S1} where S1</b>, r2::<b>StepRangeLen{T,S,S1} where S1</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/range.jl#L1001" target="_blank">range.jl:1001</a></li> <li> +(r1::<b>Union{LinRange, OrdinalRange, StepRangeLen}</b>, r2::<b>Union{LinRange, OrdinalRange, StepRangeLen}</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/range.jl#L993" target="_blank">range.jl:993</a></li> <li> +(x::<b>Ptr</b>, y::<b>Integer</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/pointer.jl#L155" target="_blank">pointer.jl:155</a></li> <li> +(x::<b>Base.TwicePrecision</b>, y::<b>Number</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/twiceprecision.jl#L265" target="_blank">twiceprecision.jl:265</a></li> <li> +(x::<b>Number</b>, y::<b>Base.TwicePrecision</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/twiceprecision.jl#L268" target="_blank">twiceprecision.jl:268</a></li> <li> +<i>{T}</i>(x::<b>Base.TwicePrecision{T}</b>, y::<b>Base.TwicePrecision{T}</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/twiceprecision.jl#L271" target="_blank">twiceprecision.jl:271</a></li> <li> +(x::<b>Base.TwicePrecision</b>, y::<b>Base.TwicePrecision</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/twiceprecision.jl#L275" target="_blank">twiceprecision.jl:275</a></li> <li> +(A::<b>Array</b>, Bs::<b>Array...</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/arraymath.jl#L44" target="_blank">arraymath.jl:44</a></li> <li> +(A::<b>BitArray</b>, B::<b>BitArray</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/bitarray.jl#L1074" target="_blank">bitarray.jl:1074</a></li> <li> +(A::<b>Array{T,2} where T</b>, B::<b>LinearAlgebra.Diagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:88</a></li> <li> +(A::<b>Array{T,2} where T</b>, B::<b>LinearAlgebra.Bidiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:88</a></li> <li> +(A::<b>Array{T,2} where T</b>, B::<b>LinearAlgebra.Tridiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:88</a></li> <li> +(A::<b>Array{T,2} where T</b>, B::<b>LinearAlgebra.SymTridiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:97</a></li> <li> +(A::<b>Array{T,2} where T</b>, B::<b>LinearAlgebra.AbstractTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:125</a></li> <li> +(A::<b>Array</b>, B::<b>SparseArrays.SparseMatrixCSC</b>) in SparseArrays at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/SparseArrays/src/sparsematrix.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/SparseArrays/src/sparsematrix.jl:1563</a></li> <li> +(x::<b>Union{DenseArray{#s549,N}, ReinterpretArray{#s549,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray}, ReshapedArray{#s549,N,A,MI} where MI<:Tuple{Vararg{SignedMultiplicativeInverse{Int64},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray}, SubArray{#s549,N,A,I,L} where L where I<:Tuple{Vararg{Union{Int64, AbstractRange{Int64}, AbstractCartesianIndex},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, ReshapedArray{T,N,A,MI} where MI<:Tuple{Vararg{SignedMultiplicativeInverse{Int64},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, DenseArray}} where N where #s549<:Union{CompoundPeriod, Period}</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl:358</a></li> <li> +(X::<b>Union{DenseArray{#s549,N}, ReinterpretArray{#s549,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray}, ReshapedArray{#s549,N,A,MI} where MI<:Tuple{Vararg{SignedMultiplicativeInverse{Int64},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray}, SubArray{#s549,N,A,I,L} where L where I<:Tuple{Vararg{Union{Int64, AbstractRange{Int64}, AbstractCartesianIndex},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, ReshapedArray{T,N,A,MI} where MI<:Tuple{Vararg{SignedMultiplicativeInverse{Int64},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, DenseArray}} where N where #s549<:Union{CompoundPeriod, Period}</b>, Y::<b>Union{DenseArray{#s548,N}, ReinterpretArray{#s548,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray}, ReshapedArray{#s548,N,A,MI} where MI<:Tuple{Vararg{SignedMultiplicativeInverse{Int64},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray}, SubArray{#s548,N,A,I,L} where L where I<:Tuple{Vararg{Union{Int64, AbstractRange{Int64}, AbstractCartesianIndex},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, ReshapedArray{T,N,A,MI} where MI<:Tuple{Vararg{SignedMultiplicativeInverse{Int64},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, DenseArray}} where N where #s548<:Union{CompoundPeriod, Period}</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl:362</a></li> <li> +(x::<b>Union{DenseArray{#s549,N}, ReinterpretArray{#s549,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray}, ReshapedArray{#s549,N,A,MI} where MI<:Tuple{Vararg{SignedMultiplicativeInverse{Int64},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray}, SubArray{#s549,N,A,I,L} where L where I<:Tuple{Vararg{Union{Int64, AbstractRange{Int64}, AbstractCartesianIndex},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, ReshapedArray{T,N,A,MI} where MI<:Tuple{Vararg{SignedMultiplicativeInverse{Int64},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, DenseArray}} where N where #s549<:Union{CompoundPeriod, Period}</b>, y::<b>Dates.TimeType</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:87</a></li> <li> +(r::<b>AbstractRange{#s549} where #s549<:Dates.TimeType</b>, x::<b>Dates.Period</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/ranges.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/ranges.jl:58</a></li> <li> +(A::<b>LinearAlgebra.SymTridiagonal</b>, B::<b>LinearAlgebra.SymTridiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/tridiag.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/tridiag.jl:158</a></li> <li> +(A::<b>LinearAlgebra.Tridiagonal</b>, B::<b>LinearAlgebra.Tridiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/tridiag.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/tridiag.jl:644</a></li> <li> +(A::<b>LinearAlgebra.UpperTriangular</b>, B::<b>LinearAlgebra.UpperTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl:487</a></li> <li> +(A::<b>LinearAlgebra.LowerTriangular</b>, B::<b>LinearAlgebra.LowerTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl:488</a></li> <li> +(A::<b>LinearAlgebra.UpperTriangular</b>, B::<b>LinearAlgebra.UnitUpperTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl:489</a></li> <li> +(A::<b>LinearAlgebra.LowerTriangular</b>, B::<b>LinearAlgebra.UnitLowerTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl:490</a></li> <li> +(A::<b>LinearAlgebra.UnitUpperTriangular</b>, B::<b>LinearAlgebra.UpperTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl:491</a></li> <li> +(A::<b>LinearAlgebra.UnitLowerTriangular</b>, B::<b>LinearAlgebra.LowerTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl:492</a></li> <li> +(A::<b>LinearAlgebra.UnitUpperTriangular</b>, B::<b>LinearAlgebra.UnitUpperTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl:493</a></li> <li> +(A::<b>LinearAlgebra.UnitLowerTriangular</b>, B::<b>LinearAlgebra.UnitLowerTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl:494</a></li> <li> +(A::<b>LinearAlgebra.AbstractTriangular</b>, B::<b>LinearAlgebra.AbstractTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/triangular.jl:495</a></li> <li> +(Da::<b>LinearAlgebra.Diagonal</b>, Db::<b>LinearAlgebra.Diagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/diagonal.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/diagonal.jl:152</a></li> <li> +(A::<b>LinearAlgebra.Bidiagonal</b>, B::<b>LinearAlgebra.Bidiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/bidiag.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/bidiag.jl:304</a></li> <li> +(UL::<b>LinearAlgebra.UnitUpperTriangular</b>, J::<b>LinearAlgebra.UniformScaling</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl:104</a></li> <li> +(UL::<b>LinearAlgebra.UnitLowerTriangular</b>, J::<b>LinearAlgebra.UniformScaling</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl:104</a></li> <li> +(A::<b>SparseArrays.SparseMatrixCSC</b>, J::<b>LinearAlgebra.UniformScaling</b>) in SparseArrays at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/SparseArrays/src/sparsematrix.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/SparseArrays/src/sparsematrix.jl:3465</a></li> <li> +(A::<b>AbstractArray{T,2} where T</b>, J::<b>LinearAlgebra.UniformScaling</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl:114</a></li> <li> +(A::<b>LinearAlgebra.Diagonal</b>, B::<b>LinearAlgebra.Bidiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:87</a></li> <li> +(A::<b>LinearAlgebra.Bidiagonal</b>, B::<b>LinearAlgebra.Diagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:88</a></li> <li> +(A::<b>LinearAlgebra.Diagonal</b>, B::<b>LinearAlgebra.Tridiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:87</a></li> <li> +(A::<b>LinearAlgebra.Tridiagonal</b>, B::<b>LinearAlgebra.Diagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:88</a></li> <li> +(A::<b>LinearAlgebra.Diagonal</b>, B::<b>Array{T,2} where T</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:87</a></li> <li> +(A::<b>LinearAlgebra.Bidiagonal</b>, B::<b>LinearAlgebra.Tridiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:87</a></li> <li> +(A::<b>LinearAlgebra.Tridiagonal</b>, B::<b>LinearAlgebra.Bidiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:88</a></li> <li> +(A::<b>LinearAlgebra.Bidiagonal</b>, B::<b>Array{T,2} where T</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:87</a></li> <li> +(A::<b>LinearAlgebra.Tridiagonal</b>, B::<b>Array{T,2} where T</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:87</a></li> <li> +(A::<b>LinearAlgebra.SymTridiagonal</b>, B::<b>LinearAlgebra.Tridiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:96</a></li> <li> +(A::<b>LinearAlgebra.Tridiagonal</b>, B::<b>LinearAlgebra.SymTridiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:97</a></li> <li> +(A::<b>LinearAlgebra.SymTridiagonal</b>, B::<b>Array{T,2} where T</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:96</a></li> <li> +(A::<b>LinearAlgebra.Diagonal</b>, B::<b>LinearAlgebra.SymTridiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:105</a></li> <li> +(A::<b>LinearAlgebra.SymTridiagonal</b>, B::<b>LinearAlgebra.Diagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:106</a></li> <li> +(A::<b>LinearAlgebra.Bidiagonal</b>, B::<b>LinearAlgebra.SymTridiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:105</a></li> <li> +(A::<b>LinearAlgebra.SymTridiagonal</b>, B::<b>LinearAlgebra.Bidiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:106</a></li> <li> +(A::<b>LinearAlgebra.Diagonal</b>, B::<b>LinearAlgebra.UpperTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:117</a></li> <li> +(A::<b>LinearAlgebra.UpperTriangular</b>, B::<b>LinearAlgebra.Diagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:118</a></li> <li> +(A::<b>LinearAlgebra.Diagonal</b>, B::<b>LinearAlgebra.UnitUpperTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:117</a></li> <li> +(A::<b>LinearAlgebra.UnitUpperTriangular</b>, B::<b>LinearAlgebra.Diagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:118</a></li> <li> +(A::<b>LinearAlgebra.Diagonal</b>, B::<b>LinearAlgebra.LowerTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:117</a></li> <li> +(A::<b>LinearAlgebra.LowerTriangular</b>, B::<b>LinearAlgebra.Diagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:118</a></li> <li> +(A::<b>LinearAlgebra.Diagonal</b>, B::<b>LinearAlgebra.UnitLowerTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:117</a></li> <li> +(A::<b>LinearAlgebra.UnitLowerTriangular</b>, B::<b>LinearAlgebra.Diagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:118</a></li> <li> +(A::<b>LinearAlgebra.AbstractTriangular</b>, B::<b>LinearAlgebra.SymTridiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:124</a></li> <li> +(A::<b>LinearAlgebra.SymTridiagonal</b>, B::<b>LinearAlgebra.AbstractTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:125</a></li> <li> +(A::<b>LinearAlgebra.AbstractTriangular</b>, B::<b>LinearAlgebra.Tridiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:124</a></li> <li> +(A::<b>LinearAlgebra.Tridiagonal</b>, B::<b>LinearAlgebra.AbstractTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:125</a></li> <li> +(A::<b>LinearAlgebra.AbstractTriangular</b>, B::<b>LinearAlgebra.Bidiagonal</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:124</a></li> <li> +(A::<b>LinearAlgebra.Bidiagonal</b>, B::<b>LinearAlgebra.AbstractTriangular</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:125</a></li> <li> +(A::<b>LinearAlgebra.AbstractTriangular</b>, B::<b>Array{T,2} where T</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/special.jl:124</a></li> <li> +(A::<b>SparseArrays.SparseMatrixCSC</b>, B::<b>SparseArrays.SparseMatrixCSC</b>) in SparseArrays at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/SparseArrays/src/sparsematrix.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/SparseArrays/src/sparsematrix.jl:1559</a></li> <li> +(A::<b>SparseArrays.SparseMatrixCSC</b>, B::<b>Array</b>) in SparseArrays at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/SparseArrays/src/sparsematrix.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/SparseArrays/src/sparsematrix.jl:1562</a></li> <li> +(x::<b>SparseArrays.AbstractSparseArray{Tv,Ti,1} where Ti where Tv</b>, y::<b>SparseArrays.AbstractSparseArray{Tv,Ti,1} where Ti where Tv</b>) in SparseArrays at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/SparseArrays/src/sparsevector.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/SparseArrays/src/sparsevector.jl:1290</a></li> <li> +(x::<b>AbstractArray{#s57,N} where N where #s57<:Number</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/abstractarraymath.jl#L98" target="_blank">abstractarraymath.jl:98</a></li> <li> +(A::<b>AbstractArray</b>, B::<b>AbstractArray</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/arraymath.jl#L38" target="_blank">arraymath.jl:38</a></li> <li> +<i>{T<:AbstractChar}</i>(x::<b>T</b>, y::<b>Integer</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/char.jl#L207" target="_blank">char.jl:207</a></li> <li> +<i>{N}</i>(index1::<b>CartesianIndex{N}</b>, index2::<b>CartesianIndex{N}</b>) in Base.IteratorsMD at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/multidimensional.jl#L106" target="_blank">multidimensional.jl:106</a></li> <li> +(::<b>Number</b>, ::<b>Missing</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/missing.jl#L94" target="_blank">missing.jl:94</a></li> <li> +<i>{P<:Period}</i>(x::<b>P</b>, y::<b>P</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl:69</a></li> <li> +(x::<b>Dates.Period</b>, y::<b>Dates.Period</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl:346</a></li> <li> +(y::<b>Dates.Period</b>, x::<b>Dates.CompoundPeriod</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl:348</a></li> <li> +(x::<b>Union{CompoundPeriod, Period}</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl:357</a></li> <li> +(x::<b>Dates.TimeType</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:8</a></li> <li> +(a::<b>Dates.TimeType</b>, b::<b>Dates.Period</b>, c::<b>Dates.Period</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl:376</a></li> <li> +(a::<b>Dates.TimeType</b>, b::<b>Dates.Period</b>, c::<b>Dates.Period</b>, d::<b>Dates.Period...</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl:377</a></li> <li> +(x::<b>Dates.TimeType</b>, y::<b>Dates.CompoundPeriod</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/periods.jl:380</a></li> <li> +(x::<b>Dates.Instant</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:4</a></li> <li> +(y::<b>Dates.Period</b>, x::<b>Dates.TimeType</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:84</a></li> <li> +(x::<b>AbstractArray{#s549,N} where N where #s549<:Dates.TimeType</b>, y::<b>Union{CompoundPeriod, Period}</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:86</a></li> <li> +(x::<b>Dates.Period</b>, r::<b>AbstractRange{#s549} where #s549<:Dates.TimeType</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/ranges.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/ranges.jl:57</a></li> <li> +(y::<b>Union{CompoundPeriod, Period}</b>, x::<b>AbstractArray{#s549,N} where N where #s549<:Dates.TimeType</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:88</a></li> <li> +(y::<b>Dates.TimeType</b>, x::<b>Union{DenseArray{#s549,N}, ReinterpretArray{#s549,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray}, ReshapedArray{#s549,N,A,MI} where MI<:Tuple{Vararg{SignedMultiplicativeInverse{Int64},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray}, SubArray{#s549,N,A,I,L} where L where I<:Tuple{Vararg{Union{Int64, AbstractRange{Int64}, AbstractCartesianIndex},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, ReshapedArray{T,N,A,MI} where MI<:Tuple{Vararg{SignedMultiplicativeInverse{Int64},N} where N} where A<:Union{ReinterpretArray{T,N,S,A} where S where A<:Union{SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, SubArray{T,N,A,I,true} where I<:Tuple{AbstractUnitRange,Vararg{Any,N} where N} where A<:DenseArray where N where T, DenseArray} where N where T, DenseArray}} where N where #s549<:Union{CompoundPeriod, Period}</b>) in Dates at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/Dates/src/arithmetic.jl:89</a></li> <li> +(J::<b>LinearAlgebra.UniformScaling</b>, x::<b>Number</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl:82</a></li> <li> +(x::<b>Number</b>, J::<b>LinearAlgebra.UniformScaling</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl:83</a></li> <li> +(J1::<b>LinearAlgebra.UniformScaling</b>, J2::<b>LinearAlgebra.UniformScaling</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl:87</a></li> <li> +(J::<b>LinearAlgebra.UniformScaling</b>, B::<b>BitArray{2}</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl:89</a></li> <li> +(J::<b>LinearAlgebra.UniformScaling</b>, A::<b>AbstractArray{T,2} where T</b>) in LinearAlgebra at <a href="file:///buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl" target="_blank">/buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.0/LinearAlgebra/src/uniformscaling.jl:90</a></li> <li> +(a, b, c, xs...) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/operators.jl#L502" target="_blank">operators.jl:502</a></li> </ul>



We can inspect a type by finding its fields with `fieldnames`


```julia
fieldnames(UnitRange)
```




    (:start, :stop)



and find out which method was used with the `@which` macro:


```julia
@which copy([1,2,3])
```




copy<i>{T<:Array}</i>(a::<b>T</b>) in Base at <a href="https://github.com/JuliaLang/julia/tree/5d4eaca0c9fa3d555c79dbacdccb9169fdf64b65/base/array.jl#L299" target="_blank">array.jl:299</a>



Notice that this gives you a link to the source code where the function is defined.

Lastly, we can find out what type a variable is with the `typeof` function:


```julia
a = [1;2;3]
typeof(a)
```




    Array{Int64,1}



### Array Syntax

The array syntax is similar to MATLAB's conventions. 


```julia
a = Vector{Float64}(undef,5) # Create a length 5 Vector (dimension 1 array) of Float64's with undefined values

a = [1;2;3;4;5] # Create the column vector [1 2 3 4 5]

a = [1 2 3 4] # Create the row vector [1 2 3 4]

a[3] = 2 # Change the third element of a (using linear indexing) to 2

b = Matrix{Float64}(undef,4,2) # Define a Matrix of Float64's of size (4,2) with undefined values

c = Array{Float64}(undef, 4,5,6,7) # Define a (4,5,6,7) array of Float64's with undefined values

mat    = [1 2 3 4
          3 4 5 6
          4 4 4 6
          3 3 3 3] #Define the matrix inline 

mat[1,2] = 4 # Set element (1,2) (row 1, column 2) to 4

mat
```




    4×4 Array{Int64,2}:
     1  4  3  4
     3  4  5  6
     4  4  4  6
     3  3  3  3



Note that, in the console (called the REPL), you can use `;` to surpress the output. In a script this is done automatically. Note that the "value" of an array is its pointer to the memory location. This means that arrays which are set equal affect the same values:


```julia
a = [1;3;4]
b = a
b[1] = 10
a
```




    3-element Array{Int64,1}:
     10
      3
      4



To set an array equal to the values to another array, use copy


```julia
a = [1;4;5]
b = copy(a)
b[1] = 10
a
```




    3-element Array{Int64,1}:
     1
     4
     5



We can also make an array of a similar size and shape via the function `similar`, or make an array of zeros/ones with `zeros` or `ones` respectively:


```julia
c = similar(a)
d = zero(a)
e = ones(a)
println(c); println(d); println(e)
```


    MethodError: no method matching ones(::Array{Int64,1})
    Closest candidates are:
      ones(!Matched::Union{Integer, AbstractUnitRange}...) at array.jl:463
      ones(!Matched::Type{T}, !Matched::Union{Integer, AbstractUnitRange}...) where T at array.jl:464
      ones(!Matched::Tuple{Vararg{Union{Integer, AbstractUnitRange},N} where N}) at array.jl:465
      ...

    

    Stacktrace:

     [1] top-level scope at In[9]:3


Note that arrays can be index'd by arrays:


```julia
a[1:2]
```




    2-element Array{Int64,1}:
     1
     4



Arrays can be of any type, specified by the type parameter. One interesting thing is that this means that arrays can be of arrays:


```julia
a = Vector{Vector{Float64}}(undef,3)
a[1] = [1;2;3]
a[2] = [1;2]
a[3] = [3;4;5]
a
```




    3-element Array{Array{Float64,1},1}:
     [1.0, 2.0, 3.0]
     [1.0, 2.0]     
     [3.0, 4.0, 5.0]



---------------------

#### Question 1

Can you explain the following behavior? Julia's community values consistancy of the rules, so all of the behavior is deducible from simple rules. (Hint: I have noted all of the rules involved here).


```julia
b = a
b[1] = [1;4;5]
a
```




    3-element Array{Array{Float64,1},1}:
     [1.0, 4.0, 5.0]
     [1.0, 2.0]     
     [3.0, 4.0, 5.0]




----------------------------------------

To fix this, there is a recursive copy function: `deepcopy`


```julia
b = deepcopy(a)
b[1] = [1;2;3]
a
```




    3-element Array{Array{Float64,1},1}:
     [1.0, 4.0, 5.0]
     [1.0, 2.0]     
     [3.0, 4.0, 5.0]



For high performance, Julia provides mutating functions. These functions change the input values that are passed in, instead of returning a new value. By convention, mutating functions tend to be defined with a `!` at the end and tend to mutate their first argument. An example of a mutating function in `copyto!` which copies the values of over to the first array.


```julia
a = [1;6;8]
b = similar(a) # make an array just like a but with undefined values
copyto!(b,a) # b changes
```




    3-element Array{Int64,1}:
     1
     6
     8



The purpose of mutating functions is that they allow one to reduce the number of memory allocations which is crucial for achiving high performance.

## Control Flow

Control flow in Julia is pretty standard. You have your basic for and while loops, and your if statements. There's more in the documentation.


```julia
for i=1:5 #for i goes from 1 to 5
    println(i)
end

t = 0
while t<5
    println(t)
    t+=1 # t = t + 1
end

school = :UCI

if school==:UCI
    println("ZotZotZot")
else
    println("Not even worth discussing.")
end
```

    1
    2
    3
    4
    5
    0
    1
    2
    3
    4
    ZotZotZot


One interesting feature about Julia control flow is that we can write multiple loops in one line:


```julia
for i=1:2,j=2:4
    println(i*j)
end
```

    2
    3
    4
    4
    6
    8


## Problems

Try the Starter Problems. If you need help, start looking through the next parts of this tutorial!

## Function Syntax


```julia
f(x,y) = 2x+y # Create an inline function
```




    f (generic function with 1 method)




```julia
f(1,2) # Call the function
```




    4




```julia
function f(x)
  x+2  
end # Long form definition
```




    f (generic function with 2 methods)



By default, Julia functions return the last value computed within them.


```julia
f(2)
```




    4



A key feature of Julia is multiple dispatch. Notice here that there is "one function", `f`, with two methods. Methods are the actionable parts of a function. Here, there is one method defined as `(::Any,::Any)` and `(::Any)`, meaning that if you give `f` two values then it will call the first method, and if you give it one value then it will call the second method.

Multiple dispatch works on types. To define a dispatch on a type, use the `::Type` signifier:


```julia
f(x::Int,y::Int) = 3x+2y
```




    f (generic function with 3 methods)



Julia will dispatch onto the strictest acceptible type signature.


```julia
f(2,3) # 3x+2y
```




    12




```julia
f(2.0,3) # 2x+y since 2.0 is not an Int
```




    7.0



Types in signatures can be parametric. For example, we can define a method for "two values are passed in, both Numbers and having the same type". Note that `<:` means "a subtype of".


```julia
f{T<:Number}(x::T,y::T) = 4x+10y
```


    UndefVarError: T not defined

    

    Stacktrace:

     [1] top-level scope at In[24]:1



```julia
f(2,3) # 3x+2y since (::Int,::Int) is stricter
```




    12




```julia
f(2.0,3.0) # 4x+10y
```




    7.0



Note that type parameterizations can have as many types as possible, and do not need to declare a supertype. For example, we can say that there is an `x` which must be a Number, while `y` and `z` must match types:


```julia
f(x::T,y::T2,z::T2) where {T<:Number,T2} = 5x + 5y + 5z
```




    f (generic function with 4 methods)



We will go into more depth on multiple dispatch later since this is the core design feature of Julia. The key feature is that Julia functions specialize on the types of their arguments. This means that `f` is a separately compiled function for each method (and for parametric types, each possible method). The first time it is called it will compile.

-------------------------

#### Question 2

Can you explain these timings?


```julia
f(x,y,z,w) = x+y+z+w
@time f(1,1,1,1)
@time f(1,1,1,1)
@time f(1,1,1,1)
@time f(1,1,1,1.0)
@time f(1,1,1,1.0)
```

      0.002646 seconds (1.08 k allocations: 59.268 KiB)
      0.000005 seconds (4 allocations: 160 bytes)
      0.000002 seconds (4 allocations: 160 bytes)
      0.004057 seconds (5.03 k allocations: 275.235 KiB)
      0.000015 seconds (5 allocations: 176 bytes)





    4.0



Note that functions can also feature optional arguments:


```julia
function test_function(x,y;z=0) #z is an optional argument
  if z==0
    return x+y,x*y #Return a tuple
  else
  return x*y*z,x+y+z #Return a different tuple
  #whitespace is optional
  end #End if statement
end #End function definition
```




    test_function (generic function with 1 method)



Here, if z is not specified, then it's 0.


```julia
x,y = test_function(1,2)
```




    (3, 2)




```julia
x,y = test_function(1,2;z=3)
```




    (6, 6)



Notice that we also featured multiple return values. 


```julia
println(x); println(y)
```

    6
    6


The return type for multiple return values is a Tuple. The syntax for a tuple is `(x,y,z,...)` or inside of functions you can use the shorthand `x,y,z,...` as shown.

Note that functions in Julia are "first-class". This means that functions are just a type themselves. Therefore functions can make functions, you can store functions as variables, pass them as variables, etc. For example:


```julia
function function_playtime(x) #z is an optional argument
    y = 2+x
    function test()
        2y # y is defined in the previous scope, so it's available here
    end
    z = test() * test()
    return z,test
end #End function definition
z,test = function_playtime(2)
```




    (64, test)




```julia
test()
```




    8



Notice that `test()` does not get passed in `y` but knows what `y` is. This is due to the function scoping rules: an inner function can know the variables defined in the same scope as the function. This rule is recursive, leading us to the conclusion that the top level scope is global. Yes, that means


```julia
a = 2
```




    2



defines a global variable. We will go into more detail on this.

Lastly we show the anonymous function syntax. This allows you to define a function inline. 


```julia
g = (x,y) -> 2x+y
```




    #5 (generic function with 1 method)



Unlike named functions, `g` is simply a function in a variable and can be overwritten at any time:


```julia
g = (x) -> 2x
```




    #7 (generic function with 1 method)



An anonymous function cannot have more than 1 dispatch. However, as of v0.5, they are compiled and thus do not have any performance disadvantages from named functions.

## Type Declaration Syntax

A type is what in many other languages is an "object". If that is a foreign concept, thing of a type as a thing which has named components. A type is the idea for what the thing is, while an instantiation of the type is a specific one. For example, you can think of a car as having an make and a model. So that means a Toyota RAV4 is an instantiation of the car type.

In Julia, we would define the car type as follows:


```julia
mutable struct Car
    make
    model
end
```

We could then make the instance of a car as follows:


```julia
mycar = Car("Toyota","Rav4")
```




    Car("Toyota", "Rav4")



Here I introduced the string syntax for Julia which uses "..." (like most other languages, I'm glaring at you MATLAB). I can grab the "fields" of my type using the `.` syntax:


```julia
mycar.make
```




    "Toyota"



To "enhance Julia's performance", one usually likes to make the typing stricter. For example, we can define a WorkshopParticipant (notice the convention for types is capital letters, CamelCase) as having a name and a field. The name will be a string and the field will be a Symbol type, (defined by :Symbol, which we will go into plenty more detail later).


```julia
mutable struct WorkshopParticipant
    name::String
    field::Symbol
end
tony = WorkshopParticipant("Tony",:physics)
```




    WorkshopParticipant("Tony", :physics)



As with functions, types can be set "parametrically". For example, we can have an StaffMember have a name and a field, but also an age. We can allow this age to be any Number type as follows:


```julia
mutable struct StaffMember{T<:Number}
    name::String
    field::Symbol
    age::T
end
ter = StaffMember("Terry",:football,17)
```




    StaffMember{Int64}("Terry", :football, 17)



The rules for parametric typing is the same as for functions. Note that most of Julia's types, like Float64 and Int, are natively defined in Julia in this manner. This means that there's no limit for user defined types, only your imagination. Indeed, many of Julia's features first start out as a prototyping package before it's ever moved into Base (the Julia library that ships as the Base module in every installation).

Lastly, there exist abstract types. These types cannot be instantiated but are used to build the type hierarchy. You've already seen one abstract type, Number. We can define one for Person using the Abstract keyword


```julia
abstract type Person
end
```

Then we can set types as a subtype of person


```julia
mutable struct Student <: Person
    name
    grade
end
```

You can define type heirarchies on abstract types. See the beautiful explanation at: http://docs.julialang.org/en/release-0.5/manual/types/#abstract-types


```julia
abstract type AbstractStudent <: Person
end
```

Another "version" of type is `immutable`. When one uses `immutable`, the fields of the type cannot be changed. However, Julia will automatically stack allocate immutable types, whereas standard types are heap allocated. If this is unfamiliar terminology, then think of this as meaning that immutable types are able to be stored closer to the CPU and have less cost for memory access (this is a detail not present in many scripting languages). Many things like Julia's built-in Number types are defined as `immutable` in order to give good performance.


```julia
struct Field
    name
    school
end
ds = Field(:DataScience,[:PhysicalScience;:ComputerScience])
```




    Field(:DataScience, Symbol[:PhysicalScience, :ComputerScience])



----
#### Question 3

Can you explain this interesting quirk? Thus Field is immutable, meaning that `ds.name` and `ds.school` cannot be changed:


```julia
ds.name = :ComputationalStatistics
```


    type Field is immutable

    

    Stacktrace:

     [1] setproperty!(::Field, ::Symbol, ::Symbol) at ./sysimg.jl:19

     [2] top-level scope at In[47]:1


However, the following is allowed:


```julia
push!(ds.school,:BiologicalScience)
ds.school
```




    3-element Array{Symbol,1}:
     :PhysicalScience  
     :ComputerScience  
     :BiologicalScience



(Hint: recall that an array is not the values itself, but a pointer to the memory of the values)

-----------------------

One important detail in Julia is that everything is a type (and every piece of code is an Expression type, more on this later). Thus functions are also types, which we can access the fields of. Not only is everything compiled down to native, but all of the "native parts" are always accessible. For example, we can, if we so choose, get a function pointer:


```julia
foo(x) = 2x
cfunction(foo, Int, Tuple{Int})
```


    UndefVarError: cfunction not defined

    

    Stacktrace:

     [1] top-level scope at In[49]:2


## Some Basic Types

Julia provides many basic types. Indeed, you will come to know Julia as a system of multiple dispatch on types, meaning that the interaction of types with functions is core to the design.

### Lazy Iterator Types

While MATLAB or Python has easy functions for building arrays, Julia tends to side-step the actual "array" part with specially made types. One such example are ranges. To define a range, use the `start:stepsize:end` syntax. For example:


```julia
a = 1:5
println(a)
b = 1:2:10
println(b)
```

    1:5
    1:2:9


We can use them like any array. For example:


```julia
println(a[2]); println(b[3])
```

    2
    5


But what is `b`?


```julia
println(typeof(b))
```

    StepRange{Int64,Int64}


`b` isn't an array, it's a StepRange. A StepRange has the ability to act like an array using its fields:


```julia
fieldnames(StepRange)
```




    (:start, :step, :stop)



Note that at any time we can get the array from these kinds of type via the `collect` function:


```julia
c = collect(a)
```




    5-element Array{Int64,1}:
     1
     2
     3
     4
     5



The reason why lazy iterator types are preferred is that they do not do the computations until it's absolutely necessary, and they take up much less space. We can check this with `@time`:


```julia
@time a = 1:100000
@time a = 1:100
@time b = collect(1:100000);
```

      0.000004 seconds (5 allocations: 192 bytes)
      0.000003 seconds (5 allocations: 192 bytes)
      0.001093 seconds (7 allocations: 781.516 KiB)


Notice that the amount of time the range takes is much shorter. This is mostly because there is a lot less memory allocation needed: only a `StepRange` is built, and all that holds is the three numbers. However, `b` has to hold `100000` numbers, leading to the huge difference.

### Dictionaries 

Another common type is the Dictionary. It allows you to access (key,value) pairs in a named manner. For example:


```julia
d = Dict(:test=>2,"silly"=>:suit)
println(d[:test])
println(d["silly"])
```

    2
    suit


### Tuples

Tuples are immutable arrays. That means they can't be changed. However, they are super fast. They are made with the `(x,y,z,...)` syntax and are the standard return type of functions which return more than one object.


```julia
tup = (2.,3) # Don't have to match types
x,y = (3.0,"hi") # Can separate a tuple to multiple variables
```




    (3.0, "hi")



## Problems

Try problems 8-11 in the Basic Problems

## Metaprogramming

Metaprogramming is a huge feature of Julia. The key idea is that every statement in Julia is of the type `Expression`. Julia operators by building an Abstract Syntax Tree (AST) from the Expressions. You've already been exposed to this a little bit: a `Symbol` (like `:PhysicalSciences` is not a string because it is part of the AST, and thus is part of the parsing/expression structure. One interesting thing is that symbol comparisons are O(1) while string comparisons, like always, are O(n)) is part of this, and macros (the weird functions with an `@`) are functions on expressions.

Thus you can think of metaprogramming as "code which takes in code and outputs code". One basic example is the `@time` macro:


```julia
macro my_time(ex)
  return quote
    local t0 = time()
    local val = $ex
    local t1 = time()
    println("elapsed time: ", t1-t0, " seconds")
    val
  end
end
```




    @my_time (macro with 1 method)



This takes in an expression `ex`, gets the time before and after evaluation, and prints the elapsed time between (the real time macro also calculates the allocations as seen earlier). Note that `$ex` "interpolates" the expression into the macro. Going into detail on metaprogramming is a large step from standard scripting and will be a later session. 

Why macros? One reason is because it lets you define any syntax you want. Since it operates on the expressions themselves, as long as you know how to parse the expression into working code, you can "choose any syntax" to be your syntax. A case study will be shown later. Another reason is because these are done at "parse time" and those are only called once (before the function compilation).

## Steps for Julia Parsing and Execution

1. The AST after parsing <- Macros
2. The AST after lowering (@code_typed)
3. The AST after type inference and optimization <- Generated Functions (@code_lowered) 
4. The LLVM IR <- Functions (@code_llvm)
5. The assembly code (@code_native)
