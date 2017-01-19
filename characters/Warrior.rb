require_relative 'Character'

class Warrior < Character
	def initialize(weapon)
		super(65, 95, 40, 120, weapon)
	end
end