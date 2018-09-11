
# Solutions to  Dimensionality Reduction 

# Dimensionality Reduction Task

 - Use PCA from [MultivariateStats.jl](https://github.com/JuliaStats/MultivariateStats.jl), to reduce 300 dimensional word embedding down to 3, 2 and 1 dimensions. 
 - Plot these using [Plots.jl](https://github.com/tbreloff/Plots.jl), coloring acording to class
 
## Tips:

 - `plotly` is a good backend for 3D Plotting.
 - The command `scatter(xs[1,:], xs[2,:], xs[3,:]; hover=all_words, zcolor=classes)` 
   - will plot a 3D scatter plot
   - coloring each point according to the numerical array `classes`
   - and putting a tooltip on each point, according to the string array `all_words`

# First we loadup some data
For the the example presented here, we will use a subset of some pretrained word2vec word embedding, using the [Embeddings.jl](https://github.com/JuliaText/Embeddings.jl/) package.
These are 300 dimentional vectors, which encode syntactic and semantic information about words.


Example code for the loading,
together with the words sorted into their original classes is below.



```julia
using Embeddings
countries = ["Afghanistan", "Algeria", "Angola", "Arabia", "Argentina", "Australia", "Bangladesh", "Brazil", "Britain", "Canada", "China", "Colombia", "Congo", "Egypt", "England", "Ethiopia", "France", "Germany", "Ghana", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Italy", "Japan", "Kenya", "Korea", "Madagascar", "Malaysia", "Mexico", "Morocco", "Mozambique", "Myanmar", "Nepal", "Nigeria", "Pakistan", "Peru", "Philippines", "Poland", "Russia", "South", "Spain", "Sudan", "Tanzania", "Thailand", "Uganda", "Ukraine", "Usa", "Uzbekistan", "Venezuela", "Vietnam", "Wales", "Yemen"]
usa_cities = ["Albuquerque", "Atlanta", "Austin", "Baltimore", "Boston", "Charlotte", "Chicago", "Columbus", "Dallas", "Denver", "Detroit", "Francisco", "Fresno", "Houston", "Indianapolis", "Jacksonville", "Las", "Louisville", "Memphis", "Mesa", "Milwaukee", "Nashville", "Omaha", "Philadelphia", "Phoenix", "Portland", "Raleigh", "Sacramento", "San", "Seattle", "Tucson", "Vegas", "Washington"]
world_capitals = ["Accra", "Algiers", "Amman", "Ankara", "Antananarivo", "Athens", "Baghdad", "Baku", "Bangkok", "Beijing", "Beirut", "Berlin", "Bogotá", "Brasília", "Bucharest", "Budapest", "Cairo", "Caracas", "Damascus", "Dhaka", "Hanoi", "Havana", "Jakarta", "Kabul", "Kampala", "Khartoum", "Kinshasa", "Kyiv", "Lima", "London", "Luanda", "Madrid", "Manila", "Minsk", "Moscow", "Nairobi", "Paris", "Pretoria", "Pyongyang", "Quito", "Rabat", "Riyadh", "Rome", "Santiago", "Seoul", "Singapore", "Stockholm", "Taipei", "Tashkent", "Tehran", "Tokyo", "Vienna", "Warsaw", "Yaoundé"]
animals = ["alpaca","camel","cattle","dog","dove","duck","ferret","goldfish","goose","rat","llama","mouse","pigeon","yak"]
sports = ["archery","badminton","basketball","boxing","cycling","diving","equestrian","fencing","field","football","golf","gymnastics","handball","hockey","judo","kayak","pentathlon","polo","rowing","rugby","sailing","shooting","soccer","swimming","taekwondo","tennis","triathlon","volleyball","weightlifting","wrestling"]

words_by_class = [countries, usa_cities, world_capitals, animals, sports]
all_words = reduce(vcat, words_by_class)
embedding_table = load_embeddings(Word2Vec; keep_words = all_words) 
@assert Set(all_words) == Set(embedding_table.vocab)

embeddings = embedding_table.embeddings
all_words = embedding_table.vocab
classes = map(all_words) do word
    findfirst(col -> word ∈ col, [countries, usa_cities, world_capitals, animals, sports])
end;
```


```julia
using MultivariateStats
using Plots
plotly()
```

    ┌ Info: Precompiling MultivariateStats [6f286f6a-111f-5878-ab1e-185364afe411]
    └ @ Base loading.jl:1187
    WARNING: Base.LinAlg is deprecated, run `using LinearAlgebra` instead
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/MultivariateStats.jl:8
    ┌ Warning: Deprecated syntax `parametric method syntax fullmean{T}(d::Int, mv::Vector{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/common.jl:23.
    │ Use `fullmean(d::Int, mv::Vector{T}) where T` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/common.jl:23
    ┌ Warning: Deprecated syntax `parametric method syntax preprocess_mean{T <: AbstractFloat}(X::Matrix{T}, m)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/common.jl:25.
    │ Use `preprocess_mean(X::Matrix{T}, m) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/common.jl:25
    ┌ Warning: Deprecated syntax `parametric method syntax extract_kv{T}(fac::Factorization{T}, ord::AbstractVector{Int}, k::Int)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/common.jl:34.
    │ Use `extract_kv(fac::Factorization{T}, ord::AbstractVector{Int}, k::Int) where T` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/common.jl:34
    WARNING: importing deprecated binding Base.Factorization into MultivariateStats.
    WARNING: Base.Factorization is deprecated: it has been moved to the standard library package `LinearAlgebra`.
    Add `using LinearAlgebra` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/common.jl:33
    ┌ Warning: Deprecated syntax `parametric method syntax regularize_symmat!{T <: AbstractFloat}(A::Matrix{T}, lambda::Real)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/common.jl:102.
    │ Use `regularize_symmat!(A::Matrix{T}, lambda::Real) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/common.jl:102
    ┌ Warning: Deprecated syntax `parametric method syntax lrsoltype{T}(::DenseVector{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:13.
    │ Use `lrsoltype(#unused#::DenseVector{T}) where T` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:13
    ┌ Warning: Deprecated syntax `parametric method syntax lrsoltype{T}(::DenseMatrix{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:14.
    │ Use `lrsoltype(#unused#::DenseMatrix{T}) where T` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:14
    ┌ Warning: Deprecated syntax `parametric method syntax _vaug{T}(X::DenseMatrix{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:16.
    │ Use `_vaug(X::DenseMatrix{T}) where T` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:16
    ┌ Warning: Deprecated syntax `parametric method syntax _haug{T}(X::DenseMatrix{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:17.
    │ Use `_haug(X::DenseMatrix{T}) where T` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:17
    ┌ Warning: Deprecated syntax `parametric method syntax llsq{T <: AbstractFloat}(X::DenseMatrix{T}, Y::DenseVecOrMat{T}; trans::Bool = false, bias::Bool = true)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:24.
    │ Use `llsq(X::DenseMatrix{T}, Y::DenseVecOrMat{T}; trans::Bool = false, bias::Bool = true) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:24
    ┌ Warning: Deprecated syntax `parametric method syntax ridge{T <: AbstractFloat}(X::DenseMatrix{T}, Y::DenseVecOrMat{T}, r::Real; trans::Bool = false, bias::Bool = true)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:40.
    │ Use `ridge(X::DenseMatrix{T}, Y::DenseVecOrMat{T}, r::Real; trans::Bool = false, bias::Bool = true) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:40
    ┌ Warning: Deprecated syntax `parametric method syntax ridge{T <: AbstractFloat}(X::DenseMatrix{T}, Y::DenseVecOrMat{T}, r::DenseVector{T}; trans::Bool = false, bias::Bool = true)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:47.
    │ Use `ridge(X::DenseMatrix{T}, Y::DenseVecOrMat{T}, r::DenseVector{T}; trans::Bool = false, bias::Bool = true) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:47
    ┌ Warning: Deprecated syntax `parametric method syntax ridge{T <: AbstractFloat}(X::DenseMatrix{T}, Y::DenseVecOrMat{T}, r::DenseMatrix{T}; trans::Bool = false, bias::Bool = true)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:54.
    │ Use `ridge(X::DenseMatrix{T}, Y::DenseVecOrMat{T}, r::DenseMatrix{T}; trans::Bool = false, bias::Bool = true) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:54
    ┌ Warning: Deprecated syntax `parametric method syntax _ridge{T <: AbstractFloat}(X::DenseMatrix{T}, Y::DenseVecOrMat{T}, r::Union{Real, DenseVecOrMat}, trans::Bool, bias::Bool)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:63.
    │ Use `_ridge(X::DenseMatrix{T}, Y::DenseVecOrMat{T}, r::Union{Real, DenseVecOrMat}, trans::Bool, bias::Bool) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/lreg.jl:63
    ┌ Warning: Deprecated syntax `immutable` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:24.
    │ Use `struct` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:24
    ┌ Warning: Deprecated syntax `parametric method syntax cov_whitening{T <: AbstractFloat}(C::Cholesky{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:8.
    │ Use `cov_whitening(C::Cholesky{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:8
    ┌ Warning: Deprecated syntax `parametric method syntax cov_whitening!{T <: AbstractFloat}(C::DenseMatrix{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:12.
    │ Use `cov_whitening!(C::DenseMatrix{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:12
    ┌ Warning: Deprecated syntax `parametric method syntax cov_whitening{T <: AbstractFloat}(C::DenseMatrix{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:13.
    │ Use `cov_whitening(C::DenseMatrix{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:13
    ┌ Warning: Deprecated syntax `parametric method syntax cov_whitening!{T <: AbstractFloat}(C::DenseMatrix{T}, regcoef::Real)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:15.
    │ Use `cov_whitening!(C::DenseMatrix{T}, regcoef::Real) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:15
    ┌ Warning: Deprecated syntax `parametric method syntax cov_whitening{T <: AbstractFloat}(C::DenseMatrix{T}, regcoef::Real)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:18.
    │ Use `cov_whitening(C::DenseMatrix{T}, regcoef::Real) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:18
    ┌ Warning: Deprecated syntax `parametric method syntax (::Type{Whitening{T}}){T}(mean::Vector{T}, W::Matrix{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:28.
    │ Use `(::Type{Whitening{T}})(mean::Vector{T}, W::Matrix{T}) where T` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:28
    ┌ Warning: Deprecated syntax `parametric method syntax (::Type{Whitening}){T <: AbstractFloat}(mean::Vector{T}, W::Matrix{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:35.
    │ Use `(::Type{Whitening})(mean::Vector{T}, W::Matrix{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:35
    WARNING: Base.mean is deprecated: it has been moved to the standard library package `Statistics`.
    Add `using Statistics` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:39
    ┌ Warning: Deprecated syntax `parametric method syntax fit{T <: AbstractFloat}(::Type{Whitening}, X::DenseMatrix{T}; mean = nothing, regcoef::Real = zero(T))` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:47.
    │ Use `fit(#s20::Type{Whitening}, X::DenseMatrix{T}; mean = nothing, regcoef::Real = zero(T)) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:47
    ┌ Warning: Deprecated syntax `parametric method syntax _invsqrtm!{T <: AbstractFloat}(C::Matrix{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:58.
    │ Use `_invsqrtm!(C::Matrix{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:58
    ┌ Warning: Deprecated syntax `parametric method syntax invsqrtm{T <: AbstractFloat}(C::DenseMatrix{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:70.
    │ Use `invsqrtm(C::DenseMatrix{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/whiten.jl:70
    ┌ Warning: Deprecated syntax `type` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:5.
    │ Use `mutable struct` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:5
    ┌ Warning: Deprecated syntax `parametric method syntax PCA{T <: AbstractFloat}(mean::Vector{T}, proj::Matrix{T}, pvars::Vector{T}, tvar::T)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:16.
    │ Use `PCA(mean::Vector{T}, proj::Matrix{T}, pvars::Vector{T}, tvar::T) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:16
    WARNING: Base.mean is deprecated: it has been moved to the standard library package `Statistics`.
    Add `using Statistics` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:31
    ┌ Warning: Deprecated syntax `parametric method syntax transform{T <: AbstractFloat}(M::PCA{T}, x::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:46.
    │ Use `transform(M::PCA{T}, x::AbstractVecOrMat{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:46
    ┌ Warning: Deprecated syntax `parametric method syntax reconstruct{T <: AbstractFloat}(M::PCA{T}, y::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:47.
    │ Use `reconstruct(M::PCA{T}, y::AbstractVecOrMat{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:47
    WARNING: importing deprecated binding Base.@sprintf into MultivariateStats.
    WARNING: Base.@sprintf is deprecated: it has been moved to the standard library package `Printf`.
    Add `using Printf` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:51
    ┌ Warning: Deprecated syntax `parametric method syntax check_pcaparams{T <: AbstractFloat}(d::Int, mean::Vector{T}, md::Int, pr::AbstractFloat)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:78.
    │ Use `check_pcaparams(d::Int, mean::Vector{T}, md::Int, pr::AbstractFloat) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:78
    ┌ Warning: Deprecated syntax `parametric method syntax choose_pcadim{T <: AbstractFloat}(v::AbstractVector{T}, ord::Vector{Int}, vsum::T, md::Int, pr::AbstractFloat)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:86.
    │ Use `choose_pcadim(v::AbstractVector{T}, ord::Vector{Int}, vsum::T, md::Int, pr::AbstractFloat) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:86
    ┌ Warning: Deprecated syntax `parametric method syntax pcacov{T <: AbstractFloat}(C::DenseMatrix{T}, mean::Vector{T}; maxoutdim::Int = size(C, 1), pratio::AbstractFloat = default_pca_pratio)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:103.
    │ Use `pcacov(C::DenseMatrix{T}, mean::Vector{T}; maxoutdim::Int = size(C, 1), pratio::AbstractFloat = default_pca_pratio) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:103
    ┌ Warning: Deprecated syntax `parametric method syntax pcasvd{T <: AbstractFloat}(Z::DenseMatrix{T}, mean::Vector{T}, tw::Real; maxoutdim::Int = min(size(Z)...), pratio::AbstractFloat = default_pca_pratio)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:117.
    │ Use `pcasvd(Z::DenseMatrix{T}, mean::Vector{T}, tw::Real; maxoutdim::Int = min(size(Z)...), pratio::AbstractFloat = default_pca_pratio) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:117
    ┌ Warning: Deprecated syntax `parametric method syntax fit{T <: AbstractFloat}(::Type{PCA}, X::DenseMatrix{T}; method::Symbol = :auto, maxoutdim::Int = size(X, 1), pratio::AbstractFloat = default_pca_pratio, mean = nothing)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:139.
    │ Use `fit(#s20::Type{PCA}, X::DenseMatrix{T}; method::Symbol = :auto, maxoutdim::Int = size(X, 1), pratio::AbstractFloat = default_pca_pratio, mean = nothing) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/pca.jl:139
    ┌ Warning: Deprecated syntax `immutable` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:4.
    │ Use `struct` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:4
    WARNING: Base.mean is deprecated: it has been moved to the standard library package `Statistics`.
    Add `using Statistics` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:15
    WARNING: Base.var is deprecated: it has been moved to the standard library package `Statistics`.
    Add `using Statistics` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:17
    ┌ Warning: Deprecated syntax `parametric method syntax transform{T <: AbstractFloat}(m::PPCA{T}, x::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:23.
    │ Use `transform(m::PPCA{T}, x::AbstractVecOrMat{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:23
    ┌ Warning: Deprecated syntax `parametric method syntax reconstruct{T <: AbstractFloat}(m::PPCA{T}, z::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:30.
    │ Use `reconstruct(m::PPCA{T}, z::AbstractVecOrMat{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:30
    ┌ Warning: Deprecated syntax `parametric method syntax ppcaml{T <: AbstractFloat}(Z::DenseMatrix{T}, mean::Vector{T}; maxoutdim::Int = (size(Z, 1) - 1), tol::Real = 1e-06)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:48.
    │ Use `ppcaml(Z::DenseMatrix{T}, mean::Vector{T}; maxoutdim::Int = (size(Z, 1) - 1), tol::Real = 1e-06) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:48
    ┌ Warning: Deprecated syntax `parametric method syntax ppcaem{T <: AbstractFloat}(S::DenseMatrix{T}, mean::Vector{T}, n::Int; maxoutdim::Int = (size(S, 1) - 1), tol::Real = 1e-06, tot::Integer = 1000)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:81.
    │ Use `ppcaem(S::DenseMatrix{T}, mean::Vector{T}, n::Int; maxoutdim::Int = (size(S, 1) - 1), tol::Real = 1e-06, tot::Integer = 1000) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:81
    ┌ Warning: Deprecated syntax `parametric method syntax bayespca{T <: AbstractFloat}(S::DenseMatrix{T}, mean::Vector{T}, n::Int; maxoutdim::Int = (size(S, 1) - 1), tol::Real = 1e-06, tot::Integer = 1000)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:125.
    │ Use `bayespca(S::DenseMatrix{T}, mean::Vector{T}, n::Int; maxoutdim::Int = (size(S, 1) - 1), tol::Real = 1e-06, tot::Integer = 1000) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:125
    ┌ Warning: Deprecated syntax `parametric method syntax fit{T <: AbstractFloat}(::Type{PPCA}, X::DenseMatrix{T}; method::Symbol = :ml, maxoutdim::Int = (size(X, 1) - 1), mean = nothing, tol::Real = 1e-06, tot::Integer = 1000)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:181.
    │ Use `fit(#s40::Type{PPCA}, X::DenseMatrix{T}; method::Symbol = :ml, maxoutdim::Int = (size(X, 1) - 1), mean = nothing, tol::Real = 1e-06, tot::Integer = 1000) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/ppca.jl:181
    ┌ Warning: Deprecated syntax `immutable` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:4.
    │ Use `struct` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:4
    ┌ Warning: Deprecated syntax `immutable` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:30.
    │ Use `struct` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:30
    ┌ Warning: Deprecated syntax `parametric method syntax fit{T <: AbstractFloat}(::Type{KernelCenter}, K::AbstractMatrix{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:11.
    │ Use `fit(#unused#::Type{KernelCenter}, K::AbstractMatrix{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:11
    ┌ Warning: Deprecated syntax `parametric method syntax transform!{T <: AbstractFloat}(C::KernelCenter{T}, K::AbstractMatrix{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:18.
    │ Use `transform!(C::KernelCenter{T}, K::AbstractMatrix{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:18
    ┌ Warning: Deprecated syntax `parametric method syntax transform{T <: AbstractFloat}(M::KernelPCA{T}, x::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:51.
    │ Use `transform(M::KernelPCA{T}, x::AbstractVecOrMat{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:51
    ┌ Warning: Deprecated syntax `parametric method syntax transform{T <: AbstractFloat}(M::KernelPCA{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:57.
    │ Use `transform(M::KernelPCA{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:57
    ┌ Warning: Deprecated syntax `parametric method syntax reconstruct{T <: AbstractFloat}(M::KernelPCA{T}, y::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:62.
    │ Use `reconstruct(M::KernelPCA{T}, y::AbstractVecOrMat{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:62
    ┌ Warning: Deprecated syntax `parametric method syntax pairwise!{T <: AbstractFloat}(K::AbstractVecOrMat{T}, kernel::Function, X::AbstractVecOrMat{T}, Y::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:80.
    │ Use `pairwise!(K::AbstractVecOrMat{T}, kernel::Function, X::AbstractVecOrMat{T}, Y::AbstractVecOrMat{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:80
    ┌ Warning: Deprecated syntax `parametric method syntax pairwise!{T <: AbstractFloat}(K::AbstractVecOrMat{T}, kernel::Function, X::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:94.
    │ Use `pairwise!(K::AbstractVecOrMat{T}, kernel::Function, X::AbstractVecOrMat{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:94
    ┌ Warning: Deprecated syntax `parametric method syntax pairwise{T <: AbstractFloat}(kernel::Function, X::AbstractVecOrMat{T}, Y::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:98.
    │ Use `pairwise(kernel::Function, X::AbstractVecOrMat{T}, Y::AbstractVecOrMat{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:98
    ┌ Warning: Deprecated syntax `parametric method syntax pairwise{T <: AbstractFloat}(kernel::Function, X::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:104.
    │ Use `pairwise(kernel::Function, X::AbstractVecOrMat{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:104
    ┌ Warning: Deprecated syntax `parametric method syntax fit{T <: AbstractFloat}(::Type{KernelPCA}, X::AbstractMatrix{T}; kernel = (x, y) -> begin
    │     # /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl, line 110
    │     (x' * y)
    │ end, maxoutdim::Int = min(size(X)...), remove_zero_eig::Bool = false, atol::Real = 1e-10, solver::Symbol = :eig, inverse::Bool = false, β::Real = 1, tol::Real = 0, maxiter::Real = 300)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:116.
    │ Use `fit(#s44::Type{KernelPCA}, X::AbstractMatrix{T}; kernel = (x, y) -> begin
    │     # /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl, line 110
    │     (x' * y)
    │ end, maxoutdim::Int = min(size(X)...), remove_zero_eig::Bool = false, atol::Real = 1e-10, solver::Symbol = :eig, inverse::Bool = false, β::Real = 1, tol::Real = 0, maxiter::Real = 300) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/kpca.jl:116
    ┌ Warning: Deprecated syntax `type` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/cca.jl:5.
    │ Use `mutable struct` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/cca.jl:5
    ┌ Warning: Deprecated syntax `parametric method syntax xtransform{T <: Real}(M::CCA, X::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/cca.jl:53.
    │ Use `xtransform(M::CCA, X::AbstractVecOrMat{T}) where T <: Real` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/cca.jl:53
    ┌ Warning: Deprecated syntax `parametric method syntax ytransform{T <: Real}(M::CCA, Y::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/cca.jl:54.
    │ Use `ytransform(M::CCA, Y::AbstractVecOrMat{T}) where T <: Real` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/cca.jl:54
    ┌ Warning: Deprecated syntax `parametric method syntax gram2dmat!{DT}(D::AbstractMatrix{DT}, G::AbstractMatrix)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/cmds.jl:7.
    │ Use `gram2dmat!(D::AbstractMatrix{DT}, G::AbstractMatrix) where DT` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/cmds.jl:7
    ┌ Warning: Deprecated syntax `parametric method syntax gram2dmat{T <: Real}(G::AbstractMatrix{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/cmds.jl:26.
    │ Use `gram2dmat(G::AbstractMatrix{T}) where T <: Real` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/cmds.jl:26
    ┌ Warning: Deprecated syntax `parametric method syntax dmat2gram!{GT}(G::AbstractMatrix{GT}, D::AbstractMatrix)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/cmds.jl:32.
    │ Use `dmat2gram!(G::AbstractMatrix{GT}, D::AbstractMatrix) where GT` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/cmds.jl:32
    ┌ Warning: Deprecated syntax `parametric method syntax dmat2gram{T <: Real}(D::AbstractMatrix{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/cmds.jl:55.
    │ Use `dmat2gram(D::AbstractMatrix{T}) where T <: Real` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/cmds.jl:55
    ┌ Warning: Deprecated syntax `parametric method syntax classical_mds{T <: Real}(D::AbstractMatrix{T}, p::Int; dowarn::Bool = true)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/cmds.jl:62.
    │ Use `classical_mds(D::AbstractMatrix{T}, p::Int; dowarn::Bool = true) where T <: Real` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/cmds.jl:62
    ┌ Warning: Deprecated syntax `1./` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/lda.jl:262.
    │ Use `1 ./` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/lda.jl:262
    WARNING: Base.mean is deprecated: it has been moved to the standard library package `Statistics`.
    Add `using Statistics` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/lda.jl:73
    WARNING: Base.mean is deprecated: it has been moved to the standard library package `Statistics`.
    Add `using Statistics` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/lda.jl:128
    WARNING: Base.mean is deprecated: it has been moved to the standard library package `Statistics`.
    Add `using Statistics` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/lda.jl:215
    WARNING: Base.mean is deprecated: it has been moved to the standard library package `Statistics`.
    Add `using Statistics` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/ica.jl:12
    WARNING: importing deprecated binding Base.@printf into MultivariateStats.
    WARNING: Base.@printf is deprecated: it has been moved to the standard library package `Printf`.
    Add `using Printf` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/ica.jl:58
    WARNING: Base.@printf is deprecated: it has been moved to the standard library package `Printf`.
    Add `using Printf` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/ica.jl:58
    ┌ Warning: Deprecated syntax `immutable` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:4.
    │ Use `struct` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:4
    ┌ Warning: Deprecated syntax `1./` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:24.
    │ Use `1 ./` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:24
    ┌ Warning: Deprecated syntax `1./` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:59.
    │ Use `1 ./` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:59
    ┌ Warning: Deprecated syntax `1./` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:68.
    │ Use `1 ./` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:68
    ┌ Warning: Deprecated syntax `1./` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:105.
    │ Use `1 ./` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:105
    ┌ Warning: Deprecated syntax `1./` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:128.
    │ Use `1 ./` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:128
    ┌ Warning: Deprecated syntax `1./` at /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:139.
    │ Use `1 ./` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:139
    WARNING: Base.mean is deprecated: it has been moved to the standard library package `Statistics`.
    Add `using Statistics` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:13
    WARNING: Base.cov is deprecated: it has been moved to the standard library package `Statistics`.
    Add `using Statistics` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:15
    WARNING: Base.var is deprecated: it has been moved to the standard library package `Statistics`.
    Add `using Statistics` to your imports.
      likely near /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:16
    ┌ Warning: Deprecated syntax `parametric method syntax transform{T <: AbstractFloat}(m::FactorAnalysis{T}, x::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:22.
    │ Use `transform(m::FactorAnalysis{T}, x::AbstractVecOrMat{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:22
    ┌ Warning: Deprecated syntax `parametric method syntax reconstruct{T <: AbstractFloat}(m::FactorAnalysis{T}, z::AbstractVecOrMat{T})` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:29.
    │ Use `reconstruct(m::FactorAnalysis{T}, z::AbstractVecOrMat{T}) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:29
    ┌ Warning: Deprecated syntax `parametric method syntax faem{T <: AbstractFloat}(S::DenseMatrix{T}, mv::Vector{T}, n::Int; maxoutdim::Int = (size(X, 1) - 1), tol::Real = 1e-06, tot::Integer = 1000)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:51.
    │ Use `faem(S::DenseMatrix{T}, mv::Vector{T}, n::Int; maxoutdim::Int = (size(X, 1) - 1), tol::Real = 1e-06, tot::Integer = 1000) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:51
    ┌ Warning: Deprecated syntax `parametric method syntax facm{T <: AbstractFloat}(S::DenseMatrix{T}, mv::Vector{T}, n::Int; maxoutdim::Int = (size(X, 1) - 1), tol::Real = 1e-06, tot::Integer = 1000, η = tol)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:92.
    │ Use `facm(S::DenseMatrix{T}, mv::Vector{T}, n::Int; maxoutdim::Int = (size(X, 1) - 1), tol::Real = 1e-06, tot::Integer = 1000, η = tol) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:92
    ┌ Warning: Deprecated syntax `parametric method syntax fit{T <: AbstractFloat}(::Type{FactorAnalysis}, X::DenseMatrix{T}; method::Symbol = :cm, maxoutdim::Int = (size(X, 1) - 1), mean = nothing, tol::Real = 1e-06, tot::Integer = 1000, η = tol)` around /home/wheel/oxinabox/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:164.
    │ Use `fit(#s111::Type{FactorAnalysis}, X::DenseMatrix{T}; method::Symbol = :cm, maxoutdim::Int = (size(X, 1) - 1), mean = nothing, tol::Real = 1e-06, tot::Integer = 1000, η = tol) where T <: AbstractFloat` instead.
    └ @ ~/.julia/packages/MultivariateStats/wGpiN/src/fa.jl:164
    ┌ Info: Precompiling Plots [91a5bcdd-55d7-5caf-9e0b-520d859cae80]
    └ @ Base loading.jl:1187



```julia
#Direct projection -- no DR -- just throw away the information in the other axies
xs=embeddings
scatter(xs[1,:], xs[2,:], xs[3,:]; hover=all_words, zcolor=classes)
```

### PCA


```julia
M = fit(PCA, embeddings; maxoutdim=3)
xs = transform(M, embeddings)
scatter(xs[1,:], xs[2,:], xs[3,:]; hover=all_words, zcolor=classes)
```


```julia
M = fit(PCA, embeddings; maxoutdim=2)
xs = transform(M, embeddings_mat)
scatter(xs[1,:], xs[2,:]; hover=all_words, zcolor=classes)
```


```julia
M = fit(PCA, embeddings; maxoutdim=1)
xs = transform(M, embeddings)
scatter(xs[1,:], ones(length(xs)); hover=all_words, zcolor=classes)
```

# ICA


```julia
M = fit(ICA, embeddings, 3)
xs = transform(M, embeddings)
scatter(xs[1,:], xs[2,:], xs[3,:]; hover=all_words, zcolor=classes)
```

# Extension: T-SNE

 - Use [TSne.jl](https://github.com/lejon/TSne.jl), to perform similar dimentionality reduction, and to produce plots.

T-SNE is another popluar DR method.  
Be warned: it is sideways -- it is row major, so tanspose the inputs and outputs

You may have to play with the perplexity to get it to work well.


If you look at the resulting plots, you may note that countries are often paired uo with their captical city.


```julia
using TSne
```


```julia
xs = tsne(embeddings', 3, 500, 1000, 20.0)'
```


```julia
scatter(xs[1,:], xs[2,:], xs[3,:]; hover=all_words, zcolor=classes)
```
