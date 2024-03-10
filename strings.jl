#coding assignment for 3/19/24

using Pkg 
Pkg.add("XLSX") 
import XLSX 
xf = XLSX.readxlsx("infoTable.xlsx")
sh = xf["Sheet1"] 
sh[:]

information = String[]
people = 0
addEntries = true

while addEntries == true
    print("Welcome to Trinity University. Please enter your first and last name.\n")
    name = readline()
    name = split(name, " ") #shadows
    first = name[1] 
    surname = name[2]
    push!(information, first)
    push!(information, surname)

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
            else 
                keepAsking == false
                #print(phone)
                #didn't work having this here: push!(information, phone)
            end
        end
    end
    push!(information, phone)
    global people += 1
    println("\n\nDo you want to add another person? \nPress 'y' to do so or any other character to stop here.")
    response = readline()
    if response != "y"
        global addEntries = false
    end
    #println(addEntries)
end

XLSX.openxlsx("infoTable.xlsx", mode="rw") do xf 
    sheet = xf[1] 
    sheet["A1"] = "First Name"  
    sheet["B1"] = "Last Name"  
    sheet["C1"] = "Phone Number" 
    #letter = "F"
    for i in 1:length(information)
        if i%3 == 0
            letter = "C"
        elseif (i-1)%3 == 0
            letter = "A"
        else 
            letter = "B"
        end
        #map index to letter
        #convert i to string
        j = string(i)
        spot = letter*(string(people+1))
        sheet[spot] = information[i]
        if i %3 == 0
            global people -=1
        end
    end
end

