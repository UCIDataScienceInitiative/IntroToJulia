
# HPC Julia

## UC Irvine Cluster (SGE)

Job Script


```julia
#!/bin/bash

#$ -N jbtest
#$ -q <Queue>
#$ -pe mpich 128
#$ -cwd            		# run the job out of the current directory
#$ -m beas
#$ -ckpt blcr
#$ -o output/
#$ -e output/
module load julia/0.4.3
julia --machinefile jbtest-pe_hostfile_mpich.$JOB_ID test.jl
```

Test function


```julia
## Script which prints out the hostnames of the worker processes
# Used in conjunction with a job script to ensure multi-node parallelism

hosts = @parallel for i=1:120
       run(`hostname`) end
println(hosts)
```

## XSEDE Comet (Slurm)
