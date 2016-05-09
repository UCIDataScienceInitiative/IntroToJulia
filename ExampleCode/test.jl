hosts = @parallel for i=1:120
       run(`hostname`) end
println(hosts)
