
# Solutions to  Dimensionality Reduction 

# Dimensionality Reduction Task

 - Use PCA from [MultivariateStats.jl](https://github.com/JuliaStats/MultivariateStats.jl), to reduce 100 dimentional word embedding down to 3,2 and 1 dimentions. 
 - Plot these using [Plots.jl](https://github.com/tbreloff/Plots.jl), coloring acording to class
 
## Tips:

 - `plotly` is a good backend for 3D Plotting.
 - The command `scatter(xs[1,:], xs[2,:], xs[3,:]; hover=all_words, zcolor=classes)` 
   - will plot a 3D scatter plot
   - coloring each point according to the numerical array `classes`
   - and putting a tooltip on each point, according to the string array `all_words`

# First we loadup some data
For the the example presented here, we will use a subhset of Word Embedding, trained using [Word2Vec.jl](https://github.com/tanmaykm/Word2Vec.jl).
These are 100 dimentional vectors, which encode syntactic and semantic information about words.

You can download the datased from [here](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ForwardDiff), and load it up with [JLD](https://github.com/JuliaIO/JLD.jl) as shown below. (or just load it directly if you have cloned the notebooks)

Example code for the loading,
together with the words sorted into their original classes is below.



```julia
using JLD
countries = ["afghanistan","algeria","angola","arabia","argentina","australia","bangladesh","brazil","britain","canada","china","colombia","congo","egypt","england","ethiopia","france","germany","ghana","india","indonesia","iran","iraq","ireland","italy","japan","kenya","korea","madagascar","malaysia","mexico","morocco","mozambique","myanmar","nepal","nigeria","pakistan","peru","philippines","poland","russia","south","spain","sudan","tanzania","thailand","uganda","ukraine","usa","uzbekistan","venezuela","vietnam","wales","yemen"]
usa_cities = ["albuquerque","atlanta","austin","baltimore","boston","charlotte","chicago","columbus","dallas","denver","detroit","francisco","fresno","houston","indianapolis","jacksonville","las","louisville","memphis","mesa","milwaukee","nashville","omaha","philadelphia","phoenix","portland","raleigh","sacramento","san","seattle","tucson","vegas","washington"]
world_capitals = ["accra","algiers","amman","ankara","antananarivo","athens","baghdad","baku","bangkok","beijing","beirut","berlin","bogotá","brasília","bucharest","budapest","cairo","caracas","damascus","dhaka","hanoi","havana","jakarta","kabul","kampala","khartoum","kinshasa","kyiv","lima","london","luanda","madrid","manila","minsk","moscow","nairobi","paris","pretoria","pyongyang","quito","rabat","riyadh","rome","santiago","seoul","singapore","stockholm","taipei","tashkent","tehran","tokyo","vienna","warsaw","yaoundé"]
animals = ["alpaca","camel","cattle","dog","dove","duck","ferret","goldfish","goose","guineafowl","llama","mouse","pigeon","yak"]
sports = ["archery","badminton","basketball","boxing","cycling","diving","equestrian","fencing","field","football","golf","gymnastics","handball","hockey","judo","kayak","pentathlon","polo","rowing","rugby","sailing","shooting","soccer","swimming","taekwondo","tennis","triathlon","volleyball","weightlifting","wrestling"]


words_by_class = [countries, usa_cities, world_capitals, animals, sports]
all_words = vcat(words_by_class...)
classes = vcat(((1:5) .* ones.(length.(words_by_class)))...);
embeddings = load("../assets/ClusteringAndDimentionalityReduction.jld", "embeddings")
```

# Extension: T-SNE

 - Use [TSne.jl](https://github.com/lejon/TSne.jl), to perform similar dimentionality reduction, and to produce plots.

T-SNE is another popluar DR method.  
However, the [TSne.jl](https://github.com/lejon/TSne.jl) package is not registered.  
It is mostly maintained though.
Be warned: it is sideways -- it is row major, so tanspose the inputs and outputs

You may have to play with the perplexity to get it to work well.


If you look at the resulting plots, you may note that countries are often paired uo with their captical city.
