class Character
	def initialize(speed, strength, intelligence, health, weapon)
		if (weapon) # if character have a weapon
			@WEAPON = Object.const_get(weapon).new #character has a weapon - composition
			@SPEED = speed + @WEAPON.getSpeed()
			@STRENGTH = strength + @WEAPON.getStrength()
			@INTELLIGENCE = intelligence + @WEAPON.getIntelligence()
			@health = health  + @WEAPON.getHealth()
			setPing
		else
			@SPEED = speed
			@STRENGTH = strength 
			@INTELLIGENCE = intelligence 
			@health = health
			setPing
		end
		#print
	end
	def setPing() # ping will be used as luck, higher ping will affect badly for fighting
		@PING = rand(4) + 1
		case @PING
		when 0..2
			puts("Ping: "+ @PING.to_s + ". Great internet connection!")
		when 2..4
			puts("Ping: "+ @PING.to_s + ". There is little ping.")
		when 4..5
			puts("Ping: "+ @PING.to_s + ". It's high ping. Trouble!")
		end
	end
	def print()
		puts(@SPEED)
		puts(@STRENGTH)
		puts(@INTELLIGENCE)
		puts(@health)
		puts(@PING)
	end
	def getSpeed
		@SPEED
	end
	def getStrength
		@STRENGTH
	end
	def getIntelligence
		@INTELLIGENCE
	end
	def getHealth
		@health
	end
	def getPing
		@PING
	end
	def setHealth(newHealth)
		@health = newHealth
	end
end