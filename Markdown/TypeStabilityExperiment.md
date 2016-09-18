

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
