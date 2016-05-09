matrix = [1 2 3 4
          3 4 5 6
          4 4 4 6
          3 3 3 3] #Define the matrix
f(x,y) = 2x+y #Create an inline function
@time for i=1:4,j=1:4
  matrix[i,j] += f(i,j) #update matrix[i,j] = matrix[i,j] + f(i,j)
end #end statement is required for control statements like for
Pkg.add("ASCIIPlots") #Only use the first time!
using ASCIIPlots #Load the package
scatterplot(1:4,matrix[end,:],sym='*') #Plot the last row
scatterplot(1:4,matrix[2,:],sym='^') #Plot the second row
package = "ASCIIPlots" #Define a string
println("$package is a super cool package") #Print a string

ran = 1:5 #Define a range
vec = collect(ran) #Turn the range into a vector
vec2=Vector{Float64}(2) #Define a size 2 vector of 64-bit floats
vec2[1]=2; vec2[2]=3   # vec2 = [2,3], ; allows multiple commands
push!(vec2,5) # vec2 = [2,5]
mat = Array{Int64,2}(5,5) # Create an empty 5x5 matrix
mat2 = ones(5,5) #Create a 5x5 matrix of ones
Q,R = qr(mat2) #QR decompose mat2 (returns a tuple) into Q and R
tup = ran,vec,vec2 #Define a tuple of many different objects
tup[2] #This returns vec
dict = Dict("a" => 1, "b" => 2, "c" => 3) #Define a dictionary
dict["a"] #Returns 1

function testFunction(x,y;z=0) #z is an optional argument
  if z==0
    return x+y,x*y #Return a tuple
  else
  return x*y*z,x+y+z #Return a different tuple
  #whitespace is optional
  end #End if statement
end #End function definition
a,b = testFunction(2,2) #Returns 4,4
a2,b2 = testFunction(2,3,z=3) #Returns 18,8
