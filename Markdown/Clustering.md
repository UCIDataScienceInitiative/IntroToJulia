
# Clustering


## Basic Clustering Task

Use the following dataset:


```julia
# Pkg.add("RDatasets")
using RDatasets
iris = dataset("datasets", "iris")
```

    [1m[36mINFO: [39m[22m[36mPackage RDatasets is already installed
    [39m[1m[36mINFO: [39m[22m[36mMETADATA is out-of-date — you may not have the latest version of RDatasets
    [39m[1m[36mINFO: [39m[22m[36mUse `Pkg.update()` to get the latest versions of your packages
    [39m




<table class="data-frame"><thead><tr><th></th><th>SepalLength</th><th>SepalWidth</th><th>PetalLength</th><th>PetalWidth</th><th>Species</th></tr></thead><tbody><tr><th>1</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>2</th><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>3</th><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr><tr><th>4</th><td>4.6</td><td>3.1</td><td>1.5</td><td>0.2</td><td>setosa</td></tr><tr><th>5</th><td>5.0</td><td>3.6</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>6</th><td>5.4</td><td>3.9</td><td>1.7</td><td>0.4</td><td>setosa</td></tr><tr><th>7</th><td>4.6</td><td>3.4</td><td>1.4</td><td>0.3</td><td>setosa</td></tr><tr><th>8</th><td>5.0</td><td>3.4</td><td>1.5</td><td>0.2</td><td>setosa</td></tr><tr><th>9</th><td>4.4</td><td>2.9</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>10</th><td>4.9</td><td>3.1</td><td>1.5</td><td>0.1</td><td>setosa</td></tr><tr><th>11</th><td>5.4</td><td>3.7</td><td>1.5</td><td>0.2</td><td>setosa</td></tr><tr><th>12</th><td>4.8</td><td>3.4</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>13</th><td>4.8</td><td>3.0</td><td>1.4</td><td>0.1</td><td>setosa</td></tr><tr><th>14</th><td>4.3</td><td>3.0</td><td>1.1</td><td>0.1</td><td>setosa</td></tr><tr><th>15</th><td>5.8</td><td>4.0</td><td>1.2</td><td>0.2</td><td>setosa</td></tr><tr><th>16</th><td>5.7</td><td>4.4</td><td>1.5</td><td>0.4</td><td>setosa</td></tr><tr><th>17</th><td>5.4</td><td>3.9</td><td>1.3</td><td>0.4</td><td>setosa</td></tr><tr><th>18</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.3</td><td>setosa</td></tr><tr><th>19</th><td>5.7</td><td>3.8</td><td>1.7</td><td>0.3</td><td>setosa</td></tr><tr><th>20</th><td>5.1</td><td>3.8</td><td>1.5</td><td>0.3</td><td>setosa</td></tr><tr><th>21</th><td>5.4</td><td>3.4</td><td>1.7</td><td>0.2</td><td>setosa</td></tr><tr><th>22</th><td>5.1</td><td>3.7</td><td>1.5</td><td>0.4</td><td>setosa</td></tr><tr><th>23</th><td>4.6</td><td>3.6</td><td>1.0</td><td>0.2</td><td>setosa</td></tr><tr><th>24</th><td>5.1</td><td>3.3</td><td>1.7</td><td>0.5</td><td>setosa</td></tr><tr><th>25</th><td>4.8</td><td>3.4</td><td>1.9</td><td>0.2</td><td>setosa</td></tr><tr><th>26</th><td>5.0</td><td>3.0</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>27</th><td>5.0</td><td>3.4</td><td>1.6</td><td>0.4</td><td>setosa</td></tr><tr><th>28</th><td>5.2</td><td>3.5</td><td>1.5</td><td>0.2</td><td>setosa</td></tr><tr><th>29</th><td>5.2</td><td>3.4</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>30</th><td>4.7</td><td>3.2</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>&vellip;</th><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td></tr></tbody></table>



Use Clustering.jl to cluster using the `SepalLength`, `PetalLength`, and `PetalWidth`features via K-means clustering. Make a scatter plot of the resulting clusters.

**Hint: You will need to index the dataframe, convert it to an array, and transpose it. In addition, you will need to use the `assignments` field of the return to get the cluster assignments**.

## Advanced Clustering Task

For the the example presented here, we will use a subhset of Word Embedding, trained using [Word2Vec.jl](https://github.com/tanmaykm/Word2Vec.jl).
These are 100 dimentional vectors, which encode syntactic and semantic information about words.


```julia
using JLD
embeddings = load("../assets/ClusteringAndDimentionalityReduction.jld", "embeddings")
```

You can download the datased from [here](http://ucidatascienceinitiative.github.io/IntroToJulia/Html/ForwardDiff), and load it up with [JLD](https://github.com/JuliaIO/JLD.jl) as shown below. (or just load it directly if you have cloned the notebooks)

 - Use Affinity Propagraion from [Clustering.jl](https://github.com/JuliaStats/Clustering.jl), to cluster word2vec word embeddings, according to meaning.
 - Done right this will seperate locations from sports
 - Done finely and it will seperate ball-sports from other sports, and will seperate locations according to regions, etc 
 
 - Affinity propagraion requires a similarity matrix, which you can set as a negated distance matrix. 
 - For this you'll also want  [Distances.jl](https://github.com/JuliaStats/Distances.jl) for all your distance metric needs. 
 - It is traditional with word2vec to use cosine distance.
 - You will as also need to set each item's availability. This is the diagonal of the similarity matrix. Decreasing it roughly corresponds to decreasing the amount each node wants to be in a cluster on its own.

