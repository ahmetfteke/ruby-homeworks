require_relative 'Character'

class Assasin < Character
	def initialize(weapon)
		super(90, 70, 70, 90, weapon)
	end
end