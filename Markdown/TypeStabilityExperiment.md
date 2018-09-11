

```julia
const N = 100000
function typeunstable(x::Number)
  for i=1:N
    x += rand()
  end
  x
end
x = 1
@time typeunstable(x)
x = 1.0
@time typeunstable(x)

function typeunstable2(x::Number)
  float(x)
  function wrapped()
    for i=1:N
      x += rand()
    end
    x
  end
  wrapped()
end
x=1
@time typeunstable2(x)
x = 1.0
@time typeunstable2(x)


function typestable(x::Number)
  function wrapped(x::Float64)
    for i=1:N
      x += rand()
    end
    x
  end
  wrapped(x::Int) = wrapped(float(x))
  wrapped(x)
end
x=1
@time typestable(x)
x = 1.0
@time typestable(x)

function wrapped2(x::Float64)
  for i=1:N
    x += rand()
  end
  x
end
wrapped2(x::Int) = wrapped2(float(x))
function typestable2(x::Number)
  wrapped2(x)
end

x=1
@time typestable2(x)
x = 1.0
@time typestable2(x)
```

      0.010574 seconds (15.99 k allocations: 843.985 KiB)
      0.007988 seconds (13.76 k allocations: 726.462 KiB)
      0.020086 seconds (217.46 k allocations: 3.943 MiB)
      0.013769 seconds (203.31 k allocations: 3.225 MiB)
      0.016915 seconds (17.05 k allocations: 896.674 KiB)
      0.003922 seconds (1.71 k allocations: 88.008 KiB)
      0.009934 seconds (15.54 k allocations: 829.981 KiB)
      0.002742 seconds (524 allocations: 32.446 KiB)





    50006.16136107734


