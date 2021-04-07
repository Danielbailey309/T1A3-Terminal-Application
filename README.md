# Terminal Application

### R4 Link to source control repository
https://github.com/Danielbailey309/T1A3-Terminal-Application

## Software Development Plan

### Statement of purpose and scope
This application will let users identify rocks and minerals in their collection. 

(Note that rocks and minerals are used interchangably throughout the documentation of this assignment. There are distinct scientific differences between the two but they are unimportant for the purpose of this document.)

Rock collection is a common hobby and many people want to start their collection but struggle to identify and keep track of the rocks and minerals they find. I am developing this app to streamline the process of discovering what rock or mineral a user is in posession of and storing it in memory so users can refer back to a list of their collection.

This application is aimed at people of all levels of expertise in rock identification: Those who can't tell quartz from calcite can have their rocks identified for them, and those who are experts in geology can have information on their collection stored in a centralised place.

On running the application, users will be asked a series of questions about the piece of earth that they want to identify. Once this process is done, the program will provide a list of the rocks or minerals that fit the criteria that they just inserted. The user will then be asked whether they want to add any of these rocks to their collection. The user also has the option of adding the rock they just found to the rock database, if their rock isn't on the list. Selecting this option will allow the user to name the rock and update the database with the new rock.

### Features included in application
This application will include three features that allow the user to:
1. Identify rocks/minerals
1. Update the database with new rocks/minerals
1. Save any rock/mineral to their collection.

Upon starting the program, these features will be displayed as options to the user. The user then has the chance to type "identify", "update" or "save", which leads to each of these features respectively

#### Identifying rocks/minerals
If the user types "identify" as their option, they will be asked a series of questions regarding the rock or mineral that they want identified. These are questions about the colour, type, grain size, streak, hardness and lustre. Each of these criteria is checked against the properties of each rock in the database: The program loops through the properties of each rock and If a rock has the specified criteria, it is added to the list.

In pseudocode:

    potentialarray[] = rockarray[]
    for each rock in rockarray[]
        if getslustre == databaserocklustre
            push to potentialarray[]
        end
    end

once this process is done, the system lists all the rocks in the potentialarray[]

If at any point the user inputs a value that corresponds to none of the rocks in the array, there will be an error that tells the user so. They will then be asked whether they want to input the value again or add a new rock to the database

Likewise, if the user inputs an invalid answer to any of the criteria (e.g. inputs "420" when asked for the colour), they will be asked to input the value again.

#### Updating the database
If the user types "update", a new rock is created. The program then goes through the same process as above, allowing the user to type in all the details of the new rock.

In pseudocode:

    name = gets
    colour = gets
    type = gets
    formation = gets
    grain size = gets
    streak = gets
    hardness = gets

    Rock.new(name, colour, type, formation, grain size, streak, hardness)

The user can also export or import rocks from other files

As above, if the user inputs the wrong data type for any criteria, they will be asked to input the value again

#### Saving rocks/minerals to a collection
If the user types "save", they are then prompted to type the name of the rock that they want added to their collection. The program then copies this rock from the database to the collection

In pseudocode:
    name = gets
    if rockname is in rockarray[]
        push rock to collectionarray[]
    end

As above, the user will also be able to import or export their collection of rocks.

Also as above, the user will be prompted to retry if they input the incorrect data type for the rock's name. If the rock isn't in the database, the user will be prompted to reenter their input or add the rock to the database.