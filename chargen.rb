#Make helper functions into their own classes
#Potentially make a second "helper" class to pass data
#think of simple website for storing data, make a sketch / workflow
#heroku - free service to push data and host website

#Make a new method for rolling a single dice, 1..n
def roll_one(num)
	rand(1..num)
end

def roll_many(x,y)
	roll=0
	#roll x dice with y sides, sum all results
	x.times do
		roll += roll_one(y)
	end
	return roll
end

class Stat
	#accessor functions
	def score
		@score
	end

	def mod
		@mod
	end

	#Determine stat mod
	def stat_mod(stat)
		mod = case stat
			when 3 then -3
			when 4..5 then -2
			when 6..8 then -1
			when 9..12 then 0
			when 13..15 then 1
			when 16..17 then 2
			#No actual rules for stat over 18, most people suggest +1 for every value over. This should return that 
			when 18..Float::INFINITY then stat-15
			else "oops"
		end
		return mod
	end

	def initialize(name)
		@score = roll_many(3,6)
		@mod = stat_mod(@score)
	end
end


class Character
	def initialize(word)
		@name = word
		@strength = Stat.new("strength")
		@agility = Stat.new("agility")
		@stamina = Stat.new("stamina")
		@personality = Stat.new("personality")
		@intelligence = Stat.new("intelligence")
		@luck = Stat.new("luck")
		
		#Create derived stats - change based on luck roll or class / race, so want to hold as unique variables for level up
		@melee_atk = @strength.mod
		@missile_atk = @agility.mod
		@fort_save = @stamina.mod
		@reflex_save = @agility.mod
		@will_save = @personality.mod
		@speed = 30
		@crit_die = 4
		#Lucky Sign will modify some items based on the Luck score. Variable is to hold a string to explain items that are not tracked as a variable
		@lucky_sign = ""
		
		#Create an array to hold hit dice rolls, initialize with the starting value of 1d4
		@hit_dice = Array.new(1, (roll_one(4)+@stamina.mod))
		@hp = @hit_dice.sum


		#Roll initial money
		@money = roll_many(5,12)
	end

	def verify
		puts "Your name is #{@name}"
		puts "Strength: #{@strength.score}, #{@strength.mod} bonus"
		puts "Agility: #{@agility.score}, #{@agility.mod} bonus"
		puts "Stamina: #{@stamina.score}, #{@stamina.mod} bonus"
		puts "Personality: #{@personality.score}, #{@personality.mod} bonus"
		puts "Intelligence: #{@intelligence.score}, #{@intelligence.mod} bonus"
		puts "Luck: #{@luck.score}, #{@luck.mod} bonus"
		puts "Hit Points: #{@hp}"
		puts "You have #{@money} coins"
	end
end

# puts "What is your character name?"
# char1 = gets.chomp

guy = Character.new("Goreburger")
guy.verify