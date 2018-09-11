
# Tooling, Documentation, and Community

## Tooling

The two most commons tools for coding in Julia are:

1. The Julia REPL (the terminal)
2. Juno, the IDE in Atom
3. Jupyter notebooks

Other solutions exist (SublimeText, Emacs, etc.). The general mantra is:

> Juno is for code, Jupyter notebooks are for data. (Mike Innes, developer of Juno)

Jupyter notebooks do not easily show code from multiple files, do not have a debugging GUI, and it doesn't have as easy access to a console, making it less friendly for developing large projects (like packages). However, Jupyter notebooks store their outputs in a convenient form, which is good for saving and sharing results. I suggest that you learn both and use the right tool for the right job.

### Jupyter Notebooks with no Install

Go to www.juliabox.com and sign in to start using Julia on a cloud-based Jupyter notebook. (Note: you may need to use `Pkg.update()` to update your local package database ("METADATA") on first use).

To setup the workshop notebooks in JuliaBox, click on the "Sync" tab and under "Git Repositories" paste in https://github.com/UCIDataScienceInitiative/IntroToJulia for the "Git Clone URL", and click the +. Upon refreshing the homepage you should see the IntroToJulia folder appear. Click into this folder, and click into the Notebooks folder.

### Installing Julia

Unless you're a serious hacker, I recommend installing Julia by downloading one of the binaries from http://julialang.org/downloads/. There are ready-to-use binaries for most operating systems. Just download, run the installer, and use Julia.

If you want to build from the source, the repository along with the build instructions are at https://github.com/JuliaLang/julia.  

### Installing Jupyter Notebooks

To install Jupyter notebooks (IJulia), use the following commands in the REPL:


```julia
using Pkg
Pkg.add("IJulia") # This will install the package
Pkg.clone("https://github.com/UCIDataScienceInitiative/IntroToJulia") # Clone the IntroToJulia Repo
### Next commands you run each time you open the REPL
using IJulia
notebook(detached=true,dir=Pkg.dir("IntroToJulia/Notebooks"))
```

### Installing Juno

To install Juno, use the installation instructions from here: http://docs.junolab.org/latest/

## Installing Libraries

For later in the workshop you will need some libraries installed. Suggested libraries to install are:

- Plots.jl for plotting. This will require some backends:
  - PyPlot.jl
  - GR.jl
  - Plotly.jl
- MultivariateStats.jl
- GLM.jl

Optional libraries, depending on which projects you explore later, include:

- DifferentialEquations.jl
- LightGraphs.jl
- ForwardDiff.jl
- NLsolve.jl
- JuMP
- BenchmarkTools.jl
- ProfileView.jl
- PkgDev.jl

## Documentation

The Julia documentation can be found at http://docs.julialang.org/en/latest

Documentation can be found from the REPL by using `?` in front of a command.

The Juno documentation can be found at http://docs.junolab.org/latest/

### Good Pages to Read

The following documentation pages are good pages to read in full:

- [Noteworthy Differences from Other Languages](http://docs.julialang.org/en/release-0.5/manual/noteworthy-differences/)
- [Performance Tips](http://docs.julialang.org/en/release-0.5/manual/performance-tips/)
- [MATLAB, Python, Julia Syntax Comparison](http://cheatsheets.quantecon.org/)

## Community

Julia is changing fast: there are updates every few months which bring in loads of new features, packages are updating all of the time, and the documentation, while good, is not entirely complete. The best fix for these problems is to be engaged in the Julia community.

#### I would highly recommend finding a good online community while learning Julia

The main Julia community resources are:

- [The Julia Slack](https://slackinvite.julialang.org/) - A chatroom for Julia users and Julia help. Frequented by core developers.
- [The JuliaLang Gitter](https://gitter.im/JuliaLang/julia) - A chatroom for Julia users
- [The Julia Discourse](https://discourse.julialang.org/) - A forum / mailing list for Julia users. Frequented by core developers.
- [The JuliaLang Github Repository](https://github.com/JuliaLang/julia) - The issues/PRs document everything changing in Julia
- [JuliaBloggers](http://www.juliabloggers.com/) - A blog aggregator for Julia
- [r/Julia](https://www.reddit.com/r/Julia/) - A subreddit for Julia
- [StackOverflow tag:julia-lang](http://stackoverflow.com/questions/tagged/julia-lang) - Q&A site for Julia
