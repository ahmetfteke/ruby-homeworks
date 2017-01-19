require_relative 'Weapon'

class Dagger < Weapon
	def initialize()
		super(-5, 25, 0, 10)
	end
end