require 'tty-prompt'

class Rock
    attr_reader :name, :colour, :type, :formation, :grain_size, :streak, :hardness
    @@rock_arr = []
    @@rock_collection_arr = []
    @@prompt = TTY::Prompt.new
    def initialize(name, colour, type, formation, grain_size, streak, hardness)
        @name = name
        @colour = colour
        @type = type
        @formation = formation
        @grain_size = grain_size
        @streak = streak
        @hardness = hardness
        @@rock_arr.push(self)
    end
    
    def self.all_rocks
        return @@rock_arr
    end
    
    def self.rock_collection
        return @@rock_collection_arr
    end

    # When the user types "identify" in the menu, this method will ask the user a series of questions to find out which rock it is
    def self.identifyrock
        identifyarr = []
        puts "What colour is the rock?".colorize :blue
        colour_input = gets.chomp
        @@rock_arr.each do |rock|
            if colour_input == rock.colour
                identifyarr.push rock
            end
        end

        puts "Is it a rock or a mineral?".colorize :blue
        type_input = gets.chomp
        identifyarr.filter! {|rock| rock.type == type_input }

        question = "If it is a rock, how is it formed?".colorize :blue
        choices = ["sedimentary", "igneous", "metamorhic"]
        formation_input = @@prompt.select(question, choices)
        identifyarr.filter! {|rock| rock.formation == formation_input }

        question = "How large is the grain of the rock?".colorize :blue
        choices = ["coarse", "medium", "fine"]
        grain_size_input = @@prompt.select(question, choices)
        identifyarr.filter! {|rock| rock.grain_size == grain_size_input }

        puts "What colour streak does the mineral leave whem scraped across paper?".colorize :blue
        streak_input = gets.chomp
        identifyarr.filter! {|rock| rock.streak == streak_input }

        puts "What is the hardness of the rock or mineral, on a scale of 1 to 10?".colorize :blue
        hardness_input = gets.chomp
        raise "That is not a valid hardness (must be between 1 and 10)" if hardness_input.to_i < 1 or hardness_input.to_i > 10
        identifyarr.filter! {|rock| rock.hardness == hardness_input }

        raise "That rock is not in the database. You can add a new rock to the database by selecting that option from the main menu." if identifyarr == []
        puts "Your rock is one of the following:".colorize :green
        identifyarr.each { |rock| puts rock.name }
    end

    # When the user types "save" in the menu, this method will save the rock to the user's collection
    def self.saverock
        rock_collection_temp_arr = []
        puts "What is the name of the rock you want to add to your collection?".colorize :blue
        save_input = gets.chomp.capitalize
        @@rock_arr.each do |rock|
            if save_input == rock.name
                rock_collection_temp_arr.push rock.name
            end
        end
        raise "That rock is not in the database. You can add a new rock to the database by selecting that option from the main menu." if rock_collection_temp_arr == []
        @@rock_collection_arr.push rock_collection_temp_arr
    end

    # When the user types "create" in the menu, this method will ask a series of questions about the rock and
    # then add a rock to the database with the specifications entered
    def self.createrock

        puts "What is the name of the rock?".colorize :blue
        name = gets.chomp.capitalize
        
        puts "What colour is the rock?".colorize :blue
        colour = gets.chomp
        
        puts "Is it a rock or a mineral?".colorize :blue
        type = gets.chomp
        
        question = "If it is a rock, how is it formed?".colorize :blue
        choices = ["sedimentary", "igneous", "metamorhic"]
        formation = @@prompt.select(question, choices)
        
        question = "How large is the grain of the rock?".colorize :blue
        choices = ["coarse", "medium", "fine"]
        grain_size = @@prompt.select(question, choices)
        
        puts "What colour streak does the mineral leave whem scraped across paper?".colorize :blue
        streak = gets.chomp
        
        puts "What is the hardness of the rock or mineral, on a scale of 1 to 10?".colorize :blue
        hardness = gets.chomp
        raise "That is not a valid hardness (must be between 1 and 10)" if hardness.to_i < 1 or hardness.to_i > 10
        
        Rock.new(name, colour, type, formation, grain_size, streak, hardness)
        Rock.all_rocks.each { |rock| puts rock.name }
    end
end