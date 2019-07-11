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

#create standard stats
strength = roll_stat
agility = roll_stat
stamina = roll_stat
personality = roll_stat
intelligence = roll_stat
luck = roll_stat


#Create derived stats - change based on luck rull or class / race, so want to hold as unique variables for level up
meleeAtk = strength["score"]
missileAtk = agility["score"]
fortSave = stamina["score"]
reflexSave = agility["score"]
willSave = personality["score"]
speed = 30


#Create an array to hold hit dice rolls, initialize with the starting value of 1d4
hitDice = Array.new(1, (roll_one(4)+stamina["mod"]))
hp = hitDice.sum

#Roll initial money
money = roll_many(5,12)


puts "Strength: #{strength["score"]}, #{strength["mod"]} bonus"
puts "Agility: #{agility["score"]}, #{agility["mod"]} bonus"
puts "Stamina: #{stamina["score"]}, #{stamina["mod"]} bonus"
puts "Personality: #{personality["score"]}, #{personality["mod"]} bonus"
puts "Intelligence: #{intelligence["score"]}, #{intelligence["mod"]} bonus"
puts "Luck: #{luck["score"]}, #{luck["mod"]} bonus"
puts "Hit Points: #{hp}"
puts "You have #{money} coins"
