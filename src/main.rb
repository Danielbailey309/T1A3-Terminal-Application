require_relative 'rock'

require 'colorize'
require 'tty-prompt'

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
    while menu != 6
        question = "What would you like to do?".colorize :blue
        choices = {
            "List all rocks currently in the database" => 1,
            "Add a new rock to the database" => 2,
            "Identify a new rock that you've found" => 3
            "Save a rock from the database to your collection" => 4,
            "View your collection" => 5,
            "Exit the application" => 6
        }
        menu = @@prompt.select(question, choices)
        raise "That's not a valid selection" unless choices.include?(menu)
        if menu == 1
            puts "The following rocks are in the database:"
            Rock.all_rocks.each { |rock| puts rock.name }
        end
        if menu == 2
            Rock.createrock
        end
        if menu == 3
            Rock.identifyrock
        end
        if menu == 4
            Rock.saverock
        end
        if menu == 5
            puts "You have the following rocks in your collection:"
            puts Rock.rock_collection
        end
    end
rescue Exception => e
    puts "An error occurred: #{e}".colorize :red
end