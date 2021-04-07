require_relative 'rock'

rock_data_arr = []
rock_name_arr = []
rock = Rock.new("diamond", "colourless", "mineral", "none", "none", "colourless", "10")
rock_data_arr.push rock
rock_name_arr.push rock.name
rock = Rock.new("sapphire", "blue", "mineral", "none", "none", "blue", "9")
rock_data_arr.push rock
rock_name_arr.push rock.name