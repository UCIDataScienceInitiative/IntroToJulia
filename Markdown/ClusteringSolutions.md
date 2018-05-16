
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
using JLD
embeddings = load("../assets/ClusteringAndDimentionalityReduction.jld", "embeddings")
```




    Dict{String,Array{Float32,1}} with 185 entries:
      "ferret"       => Float32[0.0945707,-0.435267,0.0109875,-0.107674,0.169001,-0…
      "gymnastics"   => Float32[-0.269173,-0.343412,-0.00603042,-0.186179,0.0342606…
      "vegas"        => Float32[-0.00530534,-0.264874,0.0167432,-0.289836,-0.14033,…
      "archery"      => Float32[0.0279714,-0.485648,0.105468,-0.0696941,0.182807,-0…
      "jacksonville" => Float32[-0.418758,-0.0284594,0.00847164,-0.0989162,0.098186…
      "ankara"       => Float32[-0.139109,0.0872892,0.749557,-0.0308427,-0.0936718,…
      "pentathlon"   => Float32[-0.357405,-0.379595,-0.134314,-0.31008,-0.0245871,-…
      "seoul"        => Float32[0.0274904,-0.153844,-0.0936614,-0.0269344,-0.091449…
      "china"        => Float32[0.132423,-0.515862,-0.0381339,-0.287565,-0.285202,-…
      "korea"        => Float32[0.236904,-0.128355,-0.0816942,-0.0702621,-0.148426,…
      "argentina"    => Float32[-0.113967,-0.437523,-0.226014,-0.439572,-0.230062,-…
      "mozambique"   => Float32[0.309411,-0.13457,-0.632055,-0.309943,0.040591,0.11…
      "iraq"         => Float32[-0.260673,0.0356129,0.104878,0.103836,-0.17918,-0.3…
      "baku"         => Float32[0.182572,0.156322,0.225807,-0.0933851,-0.246997,-0.…
      "jakarta"      => Float32[0.13052,-0.408592,-0.0138496,-0.415052,0.21523,-0.0…
      "bogotá"       => Float32[-0.26368,-0.292844,-0.338501,-0.278793,-0.0690988,0…
      "sacramento"   => Float32[-0.217914,-0.116757,-0.213111,-0.13627,-0.0241341,-…
      "dhaka"        => Float32[-0.0264262,-0.256298,0.0922423,-0.711511,-0.329286,…
      "kyiv"         => Float32[-0.0527193,0.219892,-0.298013,-0.594799,-0.452732,-…
      "houston"      => Float32[-0.301442,-0.133911,-0.17504,-0.0391225,-0.0525875,…
      "italy"        => Float32[0.246153,-0.0510639,-0.143408,-0.149572,-0.229163,-…
      "francisco"    => Float32[-0.342338,-0.200734,-0.347174,-0.228947,-0.125513,-…
      "baghdad"      => Float32[-0.309163,0.00524779,0.287937,0.0294381,-0.173093,-…
      "dog"          => Float32[0.0509182,-0.479764,0.0209584,-0.0409415,0.0650602,…
      "kabul"        => Float32[-0.0282727,-0.108688,0.249284,0.119064,-0.163644,-0…
      ⋮              => ⋮




```julia
all_words = collect(keys(embeddings))
display(all_words)
embeddings_mat = hcat(getindex.([embeddings], all_words)...)
```


    185-element Array{String,1}:
     "ferret"      
     "gymnastics"  
     "vegas"       
     "archery"     
     "jacksonville"
     "ankara"      
     "pentathlon"  
     "seoul"       
     "china"       
     "korea"       
     "argentina"   
     "mozambique"  
     "iraq"        
     ⋮             
     "volleyball"  
     "luanda"      
     "ghana"       
     "warsaw"      
     "accra"       
     "indianapolis"
     "las"         
     "russia"      
     "columbus"    
     "thailand"    
     "mesa"        
     "goose"       





    100×185 Array{Float32,2}:
      0.0945707   -0.269173    …   0.0859109  -0.215521     0.118283 
     -0.435267    -0.343412       -0.185847   -0.0846722   -0.40088  
      0.0109875   -0.00603042      0.131935   -0.452262     0.0091058
     -0.107674    -0.186179       -0.221565   -0.115309     0.0121521
      0.169001     0.0342606      -0.0558827  -0.373113    -0.0509757
     -0.0564122   -0.137685    …  -0.0252548  -0.264813    -0.24657  
     -0.249841    -0.162321        0.0430546   0.0958876    0.0397347
     -0.115424    -0.253833        0.161854   -0.274667    -0.120246 
     -0.302291     0.0844513      -0.263644   -0.158253    -0.0829336
     -0.0232056    0.138056       -0.476437   -0.1159       0.0935187
     -0.0826832    0.0510365   …  -0.190116   -0.00022561  -0.338357 
     -0.11338      0.0767575      -0.0493041  -0.252975    -0.0785137
     -0.255015    -0.591677        0.0772709   0.180385    -0.134259 
      ⋮                        ⋱                                     
     -0.191331    -0.290943       -0.164481   -0.0834075    0.182234 
      0.0188895   -0.594902       -0.365009    0.0104588    0.205071 
     -0.1854       0.169166    …  -0.175704   -0.00672958  -0.047146 
     -0.0505824    0.251584       -0.468982    0.257763    -0.0606379
     -0.169504     0.189358       -0.0463411  -0.0674982   -0.222475 
      0.00213797  -0.113193        0.0145402  -0.192454    -0.087933 
     -0.0281012   -0.07121         0.158821   -0.00851574  -0.51206  
     -0.064161    -0.132502    …  -0.439959   -0.512601    -0.186174 
     -0.161479    -0.0524493       0.170235   -0.123051     0.0789853
      0.0849455   -0.178514       -0.0547684  -0.578576     0.154197 
      0.0256315   -0.154586        0.0279115  -0.28596      0.0913349
     -0.0626861    0.312328        0.338198    0.0463355   -0.14829  




```julia
using Clustering
using Distances

similarity = 1f0 - pairwise(CosineDist(), embeddings_mat)
availability = 0.01*ones(size(similarity,1)) 
# tweaking availability is how you control number of clusters
# it is the diagonal of the similarity matrix
similarity[diagind(size(similarity)...)] = availability
aprop = affinityprop(similarity)
```




    Clustering.AffinityPropResult([10,17,24,49,77,84,87,88,91,107,136,148,161,165,174,182],[3,12,2,12,16,6,12,1,1,1  …  14,11,14,16,2,8,16,4,2,3],[9,12,14,9,7,14,7,8,15,7,5,20,5,19,10,24],46,true)




```julia
for (cluster_ii, examplar_ind) in enumerate(aprop.exemplars)
    println("-"^32)
    println("Exemplar: ", all_words[examplar_ind])
    cluster_member_inds = find(assignments(aprop).==cluster_ii)
    println(join(getindex.([all_words], cluster_member_inds), ", "))
end
```

    --------------------------------
    Exemplar: korea
    seoul, china, korea, pyongyang, japan, vietnam, tokyo, hanoi, taipei
    --------------------------------
    Exemplar: sacramento
    vegas, sacramento, francisco, tucson, seattle, san, albuquerque, denver, portland, fresno, las, mesa
    --------------------------------
    Exemplar: dog
    ferret, dog, goldfish, cattle, dove, yak, duck, llama, mouse, alpaca, pigeon, guineafowl, camel, goose
    --------------------------------
    Exemplar: indonesia
    jakarta, bangkok, myanmar, indonesia, manila, malaysia, philippines, singapore, thailand
    --------------------------------
    Exemplar: iran
    iraq, kabul, uzbekistan, tehran, iran, yemen, afghanistan
    --------------------------------
    Exemplar: cairo
    ankara, baghdad, algiers, khartoum, rabat, beirut, cairo, algeria, morocco, damascus, amman, egypt, arabia, riyadh
    --------------------------------
    Exemplar: vienna
    italy, rome, berlin, vienna, stockholm, budapest, paris
    --------------------------------
    Exemplar: moscow
    baku, kyiv, bucharest, tashkent, moscow, minsk, ukraine, russia
    --------------------------------
    Exemplar: colombia
    argentina, bogotá, lima, madrid, venezuela, havana, peru, colombia, brazil, brasília, quito, mexico, santiago, spain, caracas
    --------------------------------
    Exemplar: wales
    australia, england, london, wales, britain, rugby, ireland
    --------------------------------
    Exemplar: poland
    south, france, germany, poland, warsaw
    --------------------------------
    Exemplar: weightlifting
    gymnastics, archery, pentathlon, shooting, diving, swimming, fencing, rowing, taekwondo, cycling, judo, beijing, kayak, wrestling, triathlon, sailing, weightlifting, boxing, equestrian, athens
    --------------------------------
    Exemplar: bangladesh
    dhaka, nepal, pakistan, india, bangladesh
    --------------------------------
    Exemplar: uganda
    mozambique, madagascar, congo, yaoundé, pretoria, sudan, tanzania, angola, nigeria, kenya, kinshasa, antananarivo, kampala, nairobi, ethiopia, uganda, luanda, ghana, accra
    --------------------------------
    Exemplar: volleyball
    basketball, handball, polo, tennis, football, golf, hockey, soccer, badminton, volleyball
    --------------------------------
    Exemplar: columbus
    jacksonville, houston, nashville, raleigh, phoenix, washington, detroit, milwaukee, canada, chicago, usa, austin, field, charlotte, dallas, omaha, memphis, baltimore, atlanta, louisville, philadelphia, boston, indianapolis, columbus

