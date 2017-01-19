require_relative 'Weapon'

class Staff < Weapon
	def initialize()
		super(-5, 5, 15, 15)
	end
end