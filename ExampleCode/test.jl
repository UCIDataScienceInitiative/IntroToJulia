## Script which prints out the hostnames of the worker processes
# Used in conjunction with a job script to ensure multi-node parallelism

hosts = @parallel for i=1:120
       run(`hostname`) end
println(hosts)
