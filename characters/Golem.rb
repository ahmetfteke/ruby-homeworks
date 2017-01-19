require_relative 'Character'

class Golem < Character
	def initialize()
		super(60, 90, 5, 100, nil)
		puts("Golem's ping: " + getPing.to_s)
	end
end