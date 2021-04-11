require_relative 'rock'

require 'colorize'
require 'tty-prompt'

# Creating variables
prompt = TTY::Prompt.new
menu = 
menu_options = [1..6]

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

def gethelp
    puts "Welcome to my application!
    If you're looking to start your own collection of rocks and minerals, then this is the application for you! 
    From the main menu, you have a list of options available to you.
    Choosing 'List all rocks currently in the database', will simply provide a list of all the rocks that come with the database by default, as well as any that you've added.
    Choosing 'Add a new rock to the database' will run you through a series of questions about the rock that you want added to the database. These questions are regarding the rock's colour, type, formation, grain size, streak colour and hardness. Additionally, it will ask what you would like to name the rock you've found.
    Choosing 'Identify a rock that I've found' will run you through the same questions as before, and provide you with a list of rocks that meet the criteria that you've entered.
    Choosing 'Save a rock from the database to my collection' will allow you to enter the name of any rock in the database, and it will be saved to your personal collection of rocks. It's recommended that you identify which rock you have before picking this option
    Choosing 'View my collection' will provide a list of all the rocks that you've saved to your collection
    Choosing 'Get help' will display this message again.
    Finally, choosing 'Exit' will quit the application"
end

if ARGV.include? "--help"
    gethelp
    exit
end
# Main program. Essentially asks the user what they want to do, and then runs the method associated with that command
begin
    while menu != 7
        question = "What would you like to do?".colorize :blue
        choices = {
            "List all rocks in the database": 1,
            "Add a new rock to the database": 2,
            "Identify a rock": 3,
            "Save a rock to my collection": 4,
            "View my collection": 5,
            "Get help": 6,
            "Exit": 7
        }
        menu = prompt.select(question, choices, per_page: 7)
        raise "That's not a valid selection" unless menu_options.include?(1..6)
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
        if menu == 6
            gethelp
        end
    end
rescue Exception => e
    puts "An error occurred: #{e}".colorize :red
end