class Rock
    attr_reader :name, :colour, :type, :formation, :grain_size, :streak, :hardness
    @@rock_name_arr = []
    def initialize(name, colour, type, formation, grain_size, streak, hardness)
        @name = name
        @colour = colour
        @type = type
        @formation = formation
        @grain_size = grain_size
        @streak = streak
        @hardness = hardness
        @@rock_name_arr.push name
    end
    def self.all_rocks
        return @@rock_name_arr
    end
end