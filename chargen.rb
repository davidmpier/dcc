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

def roll_stat
	stat = {"score" => roll_many(3,6), "mod" => nil}
	stat["mod"] = stat_mod(stat["score"])
	return stat
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

# class Character
# 	def initialize(word)
# 		@name = word
# 		@strength = roll_stat
# 		@agility = roll_stat
# 		@stamina = roll_stat
# 		@personality = roll_stat
# 		@intelligence = roll_stat
# 		@luck = roll_stat
		
# 		#Create derived stats - change based on luck roll or class / race, so want to hold as unique variables for level up
# 		@melee_atk = strength["score"]
# 		@missile_atk = agility["score"]
# 		@fort_save = stamina["score"]
# 		@reflex_save = agility["score"]
# 		@will_save = personality["score"]
# 		@speed = 30
# 		@crit_die = 4
# 		#Lucky Sign will modify some items based on the Luck score. Variable is to hold a string to explain items that are not tracked as a variable
# 		@lucky_sign = ""
		
# 		#Create an array to hold hit dice rolls, initialize with the starting value of 1d4
# 		@hit_dice = Array.new(1, (roll_one(4)+stamina["mod"]))
# 		@hp = hit_dice.sum


# 		#Roll initial money
# 		@money = roll_many(5,12)
# 	end

# 	def verify
# 		puts "Strength: #{@strength["score"]}, #{@strength["mod"]} bonus"
# 		puts "Agility: #{@agility["score"]}, #{@agility["mod"]} bonus"
# 		puts "Stamina: #{@stamina["score"]}, #{@stamina["mod"]} bonus"
# 		puts "Personality: #{@personality["score"]}, #{@personality["mod"]} bonus"
# 		puts "Intelligence: #{@intelligence["score"]}, #{@intelligence["mod"]} bonus"
# 		puts "Luck: #{@luck["score"]}, #{@luck["mod"]} bonus"
# 		puts "Hit Points: #{@hp}"
# 		puts "You have #{@money} coins"
# 	end
# end



#create standard stats
strength = roll_stat
agility = roll_stat
stamina = roll_stat
personality = roll_stat
intelligence = roll_stat
luck = roll_stat


#Create derived stats - change based on luck roll or class / race, so want to hold as unique variables for level up
melee_atk = strength["score"]
missile_atk = agility["score"]
fort_save = stamina["score"]
reflex_save = agility["score"]
will_save = personality["score"]
speed = 30
crit_die = 4
#Lucky Sign will modify some items based on the Luck score. Variable is to hold a string to explain items that are not tracked as a variable
lucky_sign = ""

#Determine Lucky Sign
# case roll_one(30)
# 	when 1 then{
# 	 melee_atk += luck["mod"]
# 	 missile_atk += luck["mod"]
# 	 lucky_sign = "Harsh Winter: All Attack Rolls"
# 	} 
# 	when 2 then{
# 		melee_atk += luck["mod"]
# 		lucky_sign = ""
# 	} 
# 	when 3 then missile_atk += 1
# 	when 4 then lucky_sign = "Unarmed Attack Rolls"

#Create an array to hold hit dice rolls, initialize with the starting value of 1d4
hit_dice = Array.new(1, (roll_one(4)+stamina["mod"]))
hp = hit_dice.sum


#Roll initial money
money = roll_many(5,12)

puts "What is your character name?"
char1 = gets.chomp

# guy = Character.new(char1)
# guy.verify

puts "Strength: #{strength["score"]}, #{strength["mod"]} bonus"
puts "Agility: #{agility["score"]}, #{agility["mod"]} bonus"
puts "Stamina: #{stamina["score"]}, #{stamina["mod"]} bonus"
puts "Personality: #{personality["score"]}, #{personality["mod"]} bonus"
puts "Intelligence: #{intelligence["score"]}, #{intelligence["mod"]} bonus"
puts "Luck: #{luck["score"]}, #{luck["mod"]} bonus"
puts "Hit Points: #{hp}"
puts "You have #{money} coins"