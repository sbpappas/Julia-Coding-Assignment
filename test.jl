# Declare a global variable
global_var = 10

# Use the global variable in a while loop
while global_var > 0
    println("Current value inside the loop: ", global_var)
    
    # Modify the global variable
    global_var -= 1
end

# Use the global variable in an if statement
if global_var == 0
    println("The loop has decremented the global variable to zero.")
end

# Print the final value of the global variable
println("Final value outside the loop: ", global_var)

