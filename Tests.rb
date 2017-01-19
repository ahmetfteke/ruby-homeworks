class Tests
	def initialize()
		@success = 0
		@fail  	 = 0 
	end

	def battle(player, monster)
		@player = player
		@monster = monster

		thread1 = Thread.new{youHit()}
		thread2 = Thread.new{monsterHit()}
		thread1.join
		thread2.join

		if @player.getHealth > 0
			puts "Congratulations! You won this battle."
			@success += 1
		else
			puts "Sorry! Golem wons."
			@fail += 1
		end
		printScore
	end
	def youHit()
		while @player.getHealth > 0 and @monster.getHealth > 0
			hitpower = @player.getStrength / 20 
			@monster.setHealth(@monster.getHealth - hitpower)
			puts "Golem got " + hitpower.to_s + " damage. Remaning health: " + @monster.getHealth.to_s
			sleep(@player.getPing)
		end
	end

	def monsterHit()
		while @player.getHealth > 0 and @monster.getHealth > 0
			hitpower = @monster.getStrength / 20
			@player.setHealth(@player.getHealth - hitpower)
			puts "You got " + hitpower.to_s + " damage. Remaning health: " + @player.getHealth.to_s
			sleep(@monster.getPing)
		end
	end

	def askMath(player)
		int = player.getIntelligence
		if int < 50
			num1 = rand(1000)
			num2 = rand(1000)
		elsif int < 75
			num1 = rand(100)
			num2 = rand(100)
		else
			num1 = rand(10)
			num2 = rand(10)
		end
		answer = num1 + num2
		puts "Solve this math problem: " + num1.to_s + " + " + num2.to_s
		user_anwer = gets.to_i
		if answer == user_anwer
			puts "Congratulations! You got the answer."
			@success += 1
		else
			puts "Work harder! You've failed."
			@fail += 1
		end
		printScore
	end
	def testSpeed(player)
		speed = player.getSpeed
		limit = 15
		if speed < 70
			to_write = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
		elsif speed < 80
			to_write = "Lorem ipsum dolor sit amet, consectetur"
		else
			to_write = "Lorem ipsum dolor sit"
		end
		puts to_write
		time_now = Time.now
		user_input = gets.chomp
		spent_time = Time.now - time_now
		if to_write == user_input and spent_time < limit
			puts "Congratulations! Counter: " + spent_time.to_s
			@success += 1
		else
			puts "You've failed! Counter: " + spent_time.to_s
			@fail += 1
		end
		printScore
	end
	def printScore
		puts "Tests you've passed: " + @success.to_s + "\nTests you've failed: " + @fail.to_s
	end
	def printResult
    	puts "Tests are over."
    	if @success == 3
    		puts "You won! This game."
    	else
    		puts "I'm sorry you lost this game."
    	end
    	puts "Thank you for playing!"
    end
end