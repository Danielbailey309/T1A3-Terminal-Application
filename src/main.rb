require_relative 'rock'

# Creating variables
menu = 
@rock_data_arr = []
@rock_collection_arr = []

# Adding default rocks to database
rock = Rock.new("Diamond", "colourless", "mineral", "none", "none", "colourless", "10")
@rock_data_arr.push rock
rock = Rock.new("Sapphire", "blue", "mineral", "none", "none", "blue", "9")
@rock_data_arr.push rock
rock = Rock.new("Ruby", "red", "mineral", "none", "none", "white", "9")
@rock_data_arr.push rock
rock = Rock.new("Topaz", "yellow", "mineral", "none", "none", "white", "8")
@rock_data_arr.push rock
rock = Rock.new("Quartz", "colourless", "mineral", "none", "none", "white", "7")
@rock_data_arr.push rock
rock = Rock.new("Apatite", "blue", "mineral", "none", "none", "white", "5")
@rock_data_arr.push rock
rock = Rock.new("Flourite", "green", "mineral", "none", "none", "white", "4")
@rock_data_arr.push rock
rock = Rock.new("Calcite", "white", "mineral", "none", "none", "white", "3")
@rock_data_arr.push rock
rock = Rock.new("Gypsum", "white", "mineral", "none", "none", "white", "2")
@rock_data_arr.push rock
rock = Rock.new("Talc", "green", "mineral", "none", "none", "white", "1")
@rock_data_arr.push rock

# Methods
def identifyrock
    identifyarr = []
    puts "What colour is the rock?"
    colour_input = gets.chomp
    @rock_data_arr.each do |rock|
        if colour_input == rock.colour
            identifyarr.push rock.name
        end
    end
    puts "Is it a rock or a mineral?"
    type_input = gets.chomp
    @rock_data_arr.each do |rock|
        if type_input != rock.type
            identifyarr.delete rock.name
        end
    end
    puts "If it is a rock, how is it formed? (rocks can be sedimentary, igneous or metamorphic)"
    formation_input = gets.chomp
    @rock_data_arr.each do |rock|
        if formation_input != rock.formation
            identifyarr.delete rock.name
        end
    end
    puts "How large is the grain of the rock? (the grain can be coarse, medium or fine)"
    grain_size_input = gets.chomp
    @rock_data_arr.each do |rock|
        if grain_size_input != rock.grain_size
            identifyarr.delete rock.name
        end
    end
    puts "What colour streak does the mineral leave whem scraped across paper?"
    streak_input = gets.chomp
    @rock_data_arr.each do |rock|
        if streak_input != rock.streak
            identifyarr.delete rock.name
        end
    end
    puts "What is the hardness of the rock or mineral, on a scale of 1 to 10?"
    hardness_input = gets.chomp
    @rock_data_arr.each do |rock|
        if hardness_input != rock.hardness
            identifyarr.delete rock.name
        end
    end
    puts identifyarr
end

def saverock
    save_input = gets.chomp
    @rock_data_arr.each do |rock|
        if save_input == rock.name
            @rock_collection_arr.push rock.name
        end
    end
end

def createrock
    puts "What is the name of the rock?"
    name = gets.chomp
    puts "What colour is the rock?"
    colour = gets.chomp
    puts "Is it a rock or a mineral?"
    type = gets.chomp
    puts "If it is a rock, how is it formed? (rocks can be sedimentary, igneous or metamorphic)"
    formation = gets.chomp
    puts "How large is the grain of the rock? (the grain can be coarse, medium or fine)"
    grain_size = gets.chomp
    puts "What colour streak does the mineral leave whem scraped across paper?"
    streak = gets.chomp
    puts "What is the hardness of the rock or mineral, on a scale of 1 to 10?"
    hardness = gets.chomp
    rock = Rock.new(name, colour, type, formation, grain_size, streak, hardness)
    @rock_data_arr.push rock
end

while menu != "quit"
    puts "Please enter a command"
    puts "Available commands are: list, identify, update, save or collection"
    menu = gets.chomp.downcase
    if menu == "update"
        createrock
        puts Rock.all_rocks
    end
    if menu == "list"
        puts "The following rocks are in the database:"
        puts Rock.all_rocks
    end
    if menu == "identify"
        identifyrock
    end
    if menu == "save"
        saverock
    end
    if menu == "collection"
        puts @rock_collection_arr
    end
end