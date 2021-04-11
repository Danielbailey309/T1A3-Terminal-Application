require 'test/unit'
require 'tty-prompt'
require_relative '../rock'

@@prompt = TTY::Prompt.new

class RockTest < Test::Unit::TestCase
    # # Tests for adding a new rock to the database
    # # Ensuring a new instance is actually created (not nil)
    # def test_new_instance
    #     rock = Rock.new("diamond", "colourless", "mineral", "none", "none", "colourless", "10")
    #     assert_not_nil(rock)
    # end
    # # Ensuring the new instance has the expected name (diamond)
    # def test_name
    #     rock = Rock.new("diamond", "colourless", "mineral", "none", "none", "colourless", "10")
    #     assert_equal("diamond", rock.name)
    # end
    # # Test for pushing the new rock to the rock array
    # def test_arr
    #     rockarr = []
    #     rock = Rock.new("diamond", "colourless", "mineral", "none", "none", "colourless", "10")
    #     rockarr.push rock.name
    #     assert_equal(["diamond"], rockarr)
    # end
    # # Test for adding multiple rocks to the array
    # def test_multiple_arr
    #     rockarr = []
    #     diamond = Rock.new("diamond", "colourless", "mineral", "none", "none", "colourless", "10")
    #     rockarr.push diamond
    #     sapphire = Rock.new("sapphire", "blue", "mineral", "none", "none", "blue", "9")
    #     rockarr.push sapphire
    #     assert_equal([diamond, sapphire], rockarr)
    # end
    # # Test for adding the names to a separate array, for readability
    # def test_name_arr
    #     rock_data_arr = []
    #     rock_name_arr = []
    #     rock = Rock.new("diamond", "colourless", "mineral", "none", "none", "colourless", "10")
    #     rock_data_arr.push rock
    #     rock_name_arr.push rock.name
    #     rock = Rock.new("sapphire", "blue", "mineral", "none", "none", "blue", "9")
    #     rock_data_arr.push rock
    #     rock_name_arr.push rock.name
    #     assert_equal(["diamond", "sapphire"], rock_name_arr)
    # end
    # # Tests for identifying rocks from the database
    # # Test for the program receiving information entered about the rock
    # def test_input
    #     puts "insert name"
    #     name = gets.chomp
    #     puts "insert colour"
    #     colour = gets.chomp
    #     puts "insert type"
    #     type = gets.chomp
    #     puts "insert formation"
    #     formation = gets.chomp
    #     puts "insert grain size"
    #     grain_size = gets.chomp
    #     puts "insert streak"
    #     streak = gets.chomp
    #     puts "insert hardness"
    #     hardness = gets.chomp
    #     sapphire = Rock.new(name, colour, type, formation, grain_size, streak, hardness)
    #     assert_not_nil(sapphire)
    # end
    # # Test for the program receiving the correct information about the rock
    # def test_correct_input
    #     puts "insert name"
    #     name = gets.chomp
    #     puts "insert colour"
    #     colour = gets.chomp
    #     puts "insert type"
    #     type = gets.chomp
    #     puts "insert formation"
    #     formation = gets.chomp
    #     puts "insert grain size"
    #     grain_size = gets.chomp
    #     puts "insert streak"
    #     streak = gets.chomp
    #     puts "insert hardness"
    #     hardness = gets.chomp
    #     sapphire = Rock.new(name, colour, type, formation, grain_size, streak, hardness)
    #     assert_equal("sapphire", sapphire.name)
    # end
    # # Test for the program outputting the correct rock, based on one piece of information entered
    # def test_identify_single_criteria
    #     rockarr = []
    #     rock = Rock.new("diamond", "colourless", "mineral", "none", "none", "colourless", "10")
    #     rockarr.push rock
    #     rock = Rock.new("sapphire", "blue", "mineral", "none", "none", "blue", "9")
    #     rockarr.push rock
    #     name_input = gets.chomp
    #     identifyarr = []
    #     rockarr.each do |rock|
    #         if name_input == rock.name
    #             identifyarr.push rock.name
    #         end
    #     end
    #     assert_equal(["diamond"], identifyarr)
    # end
    # # Test for the program outputting the correct rock, based on multiple pieces of information entered
    # def test_identify_multiple_criteria
    #     rock_data_arr = []
    #     rock_name_arr = []
    #     rock = Rock.new("talc", "white", "mineral", "none", "none", "white", "1")
    #     rock_data_arr.push rock
    #     rock = Rock.new("gypsum", "colourless", "mineral", "none", "none", "white", "2")
    #     rock_data_arr.push rock
    #     rock = Rock.new("diamond", "colourless", "mineral", "none", "none", "colourless", "10")
    #     rock_data_arr.push rock
    #     rock = Rock.new("sapphire", "blue", "mineral", "none", "none", "blue", "9")
    #     rock_data_arr.push rock
    #     puts "insert colour"
    #     colour_input = gets.chomp
    #     puts "insert streak"
    #     streak_input = gets.chomp
    #     identifyarr = []
    #     rock_data_arr.each do |rock|
    #         if colour_input == rock.colour
    #             identifyarr.push rock.name
    #         end
    #         if streak_input != rock.streak
    #             identifyarr.delete rock.name
    #         end
    #     end
    #     assert_equal(["diamond"], identifyarr)
    # end
    # # Test for saving a rock to the collection
    # def test_saverock
    #     rock_collection_arr = []
    #     rock_data_arr = []
    #     rock = Rock.new("sapphire", "blue", "mineral", "none", "none", "blue", "9")
    #     rock_data_arr.push rock
    #     save_input = "sapphire"
    #     rock_data_arr.each do |rock|
    #         if save_input == rock.name
    #             rock_collection_arr.push rock.name
    #         end
    #     end
    #     assert_equal(["sapphire"], rock_collection_arr)
    # end
    # Test for selecting an option from tty prompt
    def test_prompt
        input =
        @@prompt.ask("what is your name?" => input)
        assert_equal("Dan", input)
    end
end
