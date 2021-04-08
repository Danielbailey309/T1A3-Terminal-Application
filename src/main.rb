require_relative 'rock'

# Creating variables
menu = 
menu_options = ["list", "identify", "create", "save", "collection", "quit"]

# Adding default rocks to database
Rock.new("Diamond", "colourless", "mineral", "none", "none", "colourless", "10")
Rock.new("Sapphire", "blue", "mineral", "none", "none", "blue", "9")
Rock.new("Ruby", "red", "mineral", "none", "none", "white", "9")
Rock.new("Topaz", "yellow", "mineral", "none", "none", "white", "8")
Rock.new("Quartz", "colourless", "mineral", "none", "none", "white", "7")
Rock.new("Apatite", "blue", "mineral", "none", "none", "white", "5")
Rock.new("Flourite", "green", "mineral", "none", "none", "white", "4")
Rock.new("Calcite", "white", "mineral", "none", "none", "white", "3")
Rock.new("Gypsum", "white", "mineral", "none", "none", "white", "2")
Rock.new("Talc", "green", "mineral", "none", "none", "white", "1")
Rock.new("Schist", "grey", "rock", "metamorphic", "large", "none", "4")
Rock.new("Shale", "black", "rock", "sedimentary", "fine", "none", "3")

# Main program. Essentially asks the user what they want to do, and then runs the method associated with that command
begin
    while menu != "quit"
        puts "Please enter a command"
        puts "Type 'list' to list all the rocks currently in the database"
        puts "Type 'create' to add a new rock to the database"
        puts "Type 'identify' to identify a new rock that you've found"
        puts "Type 'save' to save a rock from the database to your collection"
        puts "Type 'collection' to view your collection"
        puts "Type 'quit' to exit the application"
        menu = gets.chomp.downcase
        raise "That's not a valid selection" unless menu_options.include?(menu)
        if menu == "list"
            puts "The following rocks are in the database:"
            Rock.all_rocks.each { |rock| puts rock.name }
        end
        if menu == "create"
            Rock.createrock
        end
        if menu == "identify"
            Rock.identifyrock
        end
        if menu == "save"
            Rock.saverock
        end
        if menu == "collection"
            puts "You have the following rocks in your collection:"
            puts Rock.rock_collection
        end
    end
end