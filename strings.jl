#coding assignment for 3/19/24

using Pkg 
Pkg.add("XLSX") 
import XLSX 
xf = XLSX.readxlsx("infoTable.xlsx")

print("Welcome to Trinity University. Please enter your first and last name.\n")
name = readline()
name = split(name, " ") #shadows
first = name[1] 
surname = name[2]

print("What is your phone number? \nPlease enter it in this format: ###-###-#### \n")
phone = readline()
phoneRegex = r"^\d{3}-\d{3}-\d{4}$"
function isValidPhoneNumber(input::AbstractString)
    #println(occursin(phoneRegex, input))
    return occursin(phoneRegex, input)
end

keepAsking = true
if isValidPhoneNumber(phone) == false
    while keepAsking == true   
        if isValidPhoneNumber(phone) == false
            print("OOPS! \nPlease enter your number it in THIS format: ###-###-#### \n")
            phone = readline()
        else keepAsking == false
        end
    end
end

newRow = Dict("First Name" => first, "Last Name" => surname, "Phone Number" => phone)
#=sheet_name = keys(xf.sheets)[1]

# Append the new row to the existing data
existing_data = DataFrame(XLSX.readtable("infoTable.xlsx", sheet_name)..., copycols=true)
new_data = vcat(existing_data, DataFrame([newRow]))

# Write the updated data back to the Excel file
XLSX.writetable("infoTable.xlsx", Dict(sheet_name => new_data), anchor="A1")

println("Your information has been added to the Excel sheet.")
=#