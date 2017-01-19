require_relative 'Weapon'

class Spear < Weapon
	def initialize()
		super(-10, 25, 0, 15)
	end
end