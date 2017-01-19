class Weapon
	def initialize(speed, strength, intelligence, health)
		@SPEED = speed
		@STRENGTH = strength 
		@INTELLIGENCE = intelligence 
		@HEALTH = health
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
		@HEALTH
	end
end