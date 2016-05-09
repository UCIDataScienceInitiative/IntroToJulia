##Scoping Exercises

# Scoping Example

x=5; y=7; #Defined globally
function scopeTest(z)
  x += z #Changes global value
  y = Vector{Float64}(1) #Declares a variable, local scope
  y[1] = 2
  return x + y + z
end

# Caution Example

function f1()
  @parallel for i = 1:100
    var = 10
    if var < 100
      var = var + 1
    end
  end
  var = 100 + 10
end
f1()
function f2()
  @parallel for i = 1:100
    var = 10
    if var < 100
      var = var + 1
    end
  end
end
f2()
