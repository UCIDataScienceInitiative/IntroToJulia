
# Solutions to the Clustering Task

## Problem 1


```julia
Pkg.add("RDatasets")
using RDatasets
iris = dataset("datasets", "iris")
```

    [1m[36mINFO: [39m[22m[36mPackage RDatasets is already installed
    [39m[1m[36mINFO: [39m[22m[36mMETADATA is out-of-date — you may not have the latest version of RDatasets
    [39m[1m[36mINFO: [39m[22m[36mUse `Pkg.update()` to get the latest versions of your packages
    [39m




<table class="data-frame"><thead><tr><th></th><th>SepalLength</th><th>SepalWidth</th><th>PetalLength</th><th>PetalWidth</th><th>Species</th></tr></thead><tbody><tr><th>1</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>2</th><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>3</th><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr><tr><th>4</th><td>4.6</td><td>3.1</td><td>1.5</td><td>0.2</td><td>setosa</td></tr><tr><th>5</th><td>5.0</td><td>3.6</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>6</th><td>5.4</td><td>3.9</td><td>1.7</td><td>0.4</td><td>setosa</td></tr><tr><th>7</th><td>4.6</td><td>3.4</td><td>1.4</td><td>0.3</td><td>setosa</td></tr><tr><th>8</th><td>5.0</td><td>3.4</td><td>1.5</td><td>0.2</td><td>setosa</td></tr><tr><th>9</th><td>4.4</td><td>2.9</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>10</th><td>4.9</td><td>3.1</td><td>1.5</td><td>0.1</td><td>setosa</td></tr><tr><th>11</th><td>5.4</td><td>3.7</td><td>1.5</td><td>0.2</td><td>setosa</td></tr><tr><th>12</th><td>4.8</td><td>3.4</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>13</th><td>4.8</td><td>3.0</td><td>1.4</td><td>0.1</td><td>setosa</td></tr><tr><th>14</th><td>4.3</td><td>3.0</td><td>1.1</td><td>0.1</td><td>setosa</td></tr><tr><th>15</th><td>5.8</td><td>4.0</td><td>1.2</td><td>0.2</td><td>setosa</td></tr><tr><th>16</th><td>5.7</td><td>4.4</td><td>1.5</td><td>0.4</td><td>setosa</td></tr><tr><th>17</th><td>5.4</td><td>3.9</td><td>1.3</td><td>0.4</td><td>setosa</td></tr><tr><th>18</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.3</td><td>setosa</td></tr><tr><th>19</th><td>5.7</td><td>3.8</td><td>1.7</td><td>0.3</td><td>setosa</td></tr><tr><th>20</th><td>5.1</td><td>3.8</td><td>1.5</td><td>0.3</td><td>setosa</td></tr><tr><th>21</th><td>5.4</td><td>3.4</td><td>1.7</td><td>0.2</td><td>setosa</td></tr><tr><th>22</th><td>5.1</td><td>3.7</td><td>1.5</td><td>0.4</td><td>setosa</td></tr><tr><th>23</th><td>4.6</td><td>3.6</td><td>1.0</td><td>0.2</td><td>setosa</td></tr><tr><th>24</th><td>5.1</td><td>3.3</td><td>1.7</td><td>0.5</td><td>setosa</td></tr><tr><th>25</th><td>4.8</td><td>3.4</td><td>1.9</td><td>0.2</td><td>setosa</td></tr><tr><th>26</th><td>5.0</td><td>3.0</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>27</th><td>5.0</td><td>3.4</td><td>1.6</td><td>0.4</td><td>setosa</td></tr><tr><th>28</th><td>5.2</td><td>3.5</td><td>1.5</td><td>0.2</td><td>setosa</td></tr><tr><th>29</th><td>5.2</td><td>3.4</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>30</th><td>4.7</td><td>3.2</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>&vellip;</th><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td></tr></tbody></table>




```julia
using Clustering
features = Array(iris[:,[1,3,4]])'
result = kmeans( features, 3 ) 
```




    Clustering.KmeansResult{Float64}([6.81 5.006 5.89667; 5.7075 1.462 4.37167; 2.075 0.246 1.41], [2, 2, 2, 2, 2, 2, 2, 2, 2, 2  …  1, 1, 3, 1, 1, 1, 1, 1, 1, 3], [0.014796, 0.017196, 0.121996, 0.168396, 0.005996, 0.235596, 0.171596, 0.003596, 0.373196, 0.033996  …  0.129281, 0.427781, 0.779914, 0.0877813, 0.192781, 0.320281, 0.791281, 0.359281, 0.517281, 0.682581], [40, 50, 60], [40.0, 50.0, 60.0], 63.484116666666814, 10, true)




```julia
features'
```




    150×3 Array{Float64,2}:
     5.1  1.4  0.2
     4.9  1.4  0.2
     4.7  1.3  0.2
     4.6  1.5  0.2
     5.0  1.4  0.2
     5.4  1.7  0.4
     4.6  1.4  0.3
     5.0  1.5  0.2
     4.4  1.4  0.2
     4.9  1.5  0.1
     5.4  1.5  0.2
     4.8  1.6  0.2
     4.8  1.4  0.1
     ⋮            
     6.0  4.8  1.8
     6.9  5.4  2.1
     6.7  5.6  2.4
     6.9  5.1  2.3
     5.8  5.1  1.9
     6.8  5.9  2.3
     6.7  5.7  2.5
     6.7  5.2  2.3
     6.3  5.0  1.9
     6.5  5.2  2.0
     6.2  5.4  2.3
     5.9  5.1  1.8




```julia
using Plots; gr()
scatter(features[1,:], features[2,:], features[3,:], color = result.assignments)
```




![svg](ClusteringSolutions_files/ClusteringSolutions_4_0.svg)



## Problem 2 (Advanced)

The main clustering package for julia, is unexpectedly, named [Clustering.jl](https://github.com/JuliaStats/Clustering.jl)
 - It supports K-means, K-medoids, Affinity Propagation, DBSCAN
 - It also supports hierarchical clustering, but that is not currently in the docs.
 
You'll also want  [Distances.jl](https://github.com/JuliaStats/Distances.jl) for all your distance metric needs.
It is traditional with word2vec to use cosine distance.

### Affinity Propagraion
If you set the availability right, it can get a breakdown where the ball-sports and clustered seperately from the other sports. Though you may have problems with some of the cities being classes as sports, as this word2vec repressentation was trained on a dump of wikipedia taken in 2014, and there are a lot of sports pages talking about the Athens and Beijing olypics.


# First we loadup some data
For the the example presented here, we will use a subhset of Word Embedding, trained using [Word2Vec.jl](https://github.com/tanmaykm/Word2Vec.jl).
These are 100 dimentional vectors, which encode syntactic and semantic information about words.


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
display(all_words)
embeddings
```


    185-element Array{String,1}:
     "China"       
     "field"       
     "Iraq"        
     "Washington"  
     "India"       
     "South"       
     "football"    
     "Canada"      
     "London"      
     "England"     
     "Australia"   
     "Japan"       
     "Pakistan"    
     ⋮             
     "taekwondo"   
     "goldfish"    
     "Las"         
     "llama"       
     "pentathlon"  
     "alpaca"      
     "Bogotá"      
     "yak"         
     "Antananarivo"
     "Brasília"    
     "Usa"         
     "Yaoundé"     





    300×185 Array{Float32,2}:
     -0.0269732   -0.129657    0.0646846    …  -0.0523314    0.0111792  
      0.0499904    0.0643991   0.042243         0.0302394    0.0545651  
      0.0401002    0.0540952  -0.0221116        0.132239     0.0819807  
      0.0305697   -0.128798    0.0202965       -0.0261657    0.099548   
     -0.0471133    0.0152411  -0.0963669        0.00556217   0.0638811  
     -0.0837969   -0.143395   -0.0346525    …  -0.011281    -0.0351346  
      0.0557447    0.0097672   0.0396028       -0.0651793   -0.0915629  
     -0.0168133   -0.129657   -0.118808        -0.0783405   -0.0460476  
     -0.0240961    0.0119675  -0.0321773       -0.0463776   -0.0883688  
      0.0126774    0.0403568   0.0676548        0.0152764    0.0282141  
     -0.0517886    0.115918    0.0103132    …  -0.0523314   -0.0294119  
     -0.00867639  -0.0755616  -0.00198014       0.100903     0.077722   
      0.0906301    0.0807135  -0.000959131     -0.0927551    0.00367649 
      ⋮                                     ⋱                           
      0.00429324   0.0414301   0.105608        -0.0357232   -0.0670751  
      0.0697708   -0.0157778   0.0295371        0.0457508   -0.0417889  
      0.0517886    0.0328435  -0.0339924    …   0.0305528   -0.0117781  
      0.0321881    0.104327   -0.0260719        0.0288293    0.000827626
      0.0561044   -0.139961   -0.041583        -0.0927551   -0.0123104  
      0.0293109    0.0202857   0.0653447       -0.0460642   -0.0129758  
      0.00233768   0.0880121  -0.0518137       -0.0399536   -0.0243547  
     -0.0139362    0.0244717   0.0301972    …  -0.055465     0.0377963  
     -0.0676129    0.0547392  -0.0587442       -0.0311795   -0.097951   
      0.0507097   -0.0328435  -0.0184813       -0.0463776   -0.0351346  
      0.0345258   -0.0139531   0.102307         0.0429306   -0.0473785  
     -0.0293109    0.0377808   0.0358076        0.0374467    0.0686722  




```julia
using Clustering
using Distances
using LinearAlgebra

similarity = 1f0 .- pairwise(CosineDist(), embeddings)
availability = 0.01*ones(size(similarity,1)) 
# tweaking availability is how you control number of clusters
# it is the diagonal of the similarity matrix
similarity[diagind(size(similarity)...)] = availability
aprop = affinityprop(similarity)
```




    AffinityPropResult([10, 28, 29, 34, 40, 52, 56, 62, 63, 77  …  114, 123, 124, 139, 143, 145, 146, 165, 167, 177], [7, 5, 3, 4, 10, 8, 5, 8, 1, 1  …  14, 22, 19, 22, 14, 22, 20, 20, 7, 20], [5, 13, 8, 8, 12, 7, 11, 12, 4, 6  …  7, 11, 10, 7, 3, 10, 10, 11, 6, 6], 47, true)




```julia
for (cluster_ii, examplar_ind) in enumerate(aprop.exemplars)
    println("-"^32)
    println("Exemplar: ", all_words[examplar_ind])
    cluster_member_inds = findall(assignments(aprop).==cluster_ii)
    println(join(getindex.([all_words], cluster_member_inds), ", "))
end
```

    --------------------------------
    Exemplar: England
    London, England, Britain, Ireland, Wales
    --------------------------------
    Exemplar: Atlanta
    Detroit, Houston, Atlanta, Philadelphia, Dallas, Charlotte, Indianapolis, Memphis, Columbus, Nashville, Louisville, Jacksonville, Raleigh
    --------------------------------
    Exemplar: Baghdad
    Iraq, Afghanistan, Baghdad, Kabul, Cairo, Beirut, Riyadh, Amman
    --------------------------------
    Exemplar: Seattle
    Washington, Chicago, Boston, Seattle, Baltimore, Portland, Milwaukee, Sacramento
    --------------------------------
    Exemplar: soccer
    field, football, basketball, golf, soccer, hockey, tennis, rugby, wrestling, volleyball, handball, polo
    --------------------------------
    Exemplar: Moscow
    Russia, Moscow, Ukraine, Baku, Minsk, Kyiv, Tashkent
    --------------------------------
    Exemplar: Thailand
    China, Japan, Singapore, Vietnam, Indonesia, Thailand, Malaysia, Philippines, Myanmar, Bangkok, Usa
    --------------------------------
    Exemplar: Argentina
    South, Canada, Australia, Germany, Spain, Italy, Brazil, Argentina, Venezuela, Colombia, Peru, Angola
    --------------------------------
    Exemplar: Tehran
    Iran, Tehran, Damascus, Ankara
    --------------------------------
    Exemplar: Bangladesh
    India, Pakistan, Bangladesh, Nepal, Uzbekistan, Dhaka
    --------------------------------
    Exemplar: Seoul
    Beijing, Tokyo, Korea, Seoul, Pyongyang, Jakarta, Taipei, Hanoi
    --------------------------------
    Exemplar: Uganda
    Nigeria, Sudan, Kenya, Ghana, Uganda, Ethiopia, Tanzania, Nairobi, Mozambique, Kampala
    --------------------------------
    Exemplar: Morocco
    France, Egypt, Yemen, Algeria, Morocco, Arabia, Rabat
    --------------------------------
    Exemplar: Santiago
    Madrid, Manila, Santiago, Havana, Lima, Francisco, San, Caracas, Quito, Las, Bogotá
    --------------------------------
    Exemplar: Albuquerque
    Mexico, Denver, Phoenix, Austin, Fresno, Tucson, Omaha, Mesa, Vegas, Albuquerque
    --------------------------------
    Exemplar: rat
    mouse, duck, rat, goose, pigeon, ferret, goldfish
    --------------------------------
    Exemplar: dove
    shooting, diving, dove
    --------------------------------
    Exemplar: Budapest
    Paris, Poland, Rome, Berlin, Athens, Vienna, Stockholm, Warsaw, Budapest, Bucharest
    --------------------------------
    Exemplar: rowing
    swimming, cycling, sailing, fencing, gymnastics, rowing, equestrian, triathlon, kayak, pentathlon
    --------------------------------
    Exemplar: Kinshasa
    Congo, Khartoum, Pretoria, Accra, Madagascar, Algiers, Luanda, Kinshasa, Antananarivo, Brasília, Yaoundé
    --------------------------------
    Exemplar: judo
    boxing, archery, badminton, weightlifting, judo, taekwondo
    --------------------------------
    Exemplar: llama
    dog, cattle, camel, llama, alpaca, yak

