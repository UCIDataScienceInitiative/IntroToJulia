
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

# Extension: T-SNE

 - Use [TSne.jl](https://github.com/lejon/TSne.jl), to perform similar dimentionality reduction, and to produce plots.

T-SNE is another popluar DR method.  
Be warned: it is sideways -- it is row major, so tanspose the inputs and outputs

You may have to play with the perplexity to get it to work well.


If you look at the resulting plots, you may note that countries are often paired uo with their captical city.
