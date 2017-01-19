require_relative 'Character'

class Magician < Character
	def initialize(weapon)
		super(85, 60, 95, 80, weapon)
	end
end