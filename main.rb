require_relative 'characters/Warrior'
require_relative 'characters/Magician'
require_relative 'characters/Assasin'
require_relative 'characters/Golem'

require_relative 'weapons/Spear'
require_relative 'weapons/Staff'
require_relative 'weapons/Dagger'

require_relative 'Tests'

def main()
  @test = Tests.new
  printMeeting
  opt1 = getOption("Which characther do you want to select?", 1, 3)
  printWeapons
  opt2 = getOption("Which weapon do you want to select?", 1, 3)
  @characther = createCharacter(opt1, opt2)
  @golem = Golem.new
  game
end

def game()
  isFirstTestDone = false
  isSecondTestDone = false
  isThirdTestDone = false
  
  while true
    if isFirstTestDone and isSecondTestDone and isThirdTestDone
      @test.printResult
      break
    end
    puts "*************************************-*************************************\nWhich test you want to do?"
    if not isFirstTestDone
      puts "1) Battle against the Golem"
    end
    if not isSecondTestDone
      puts "2) Math Question"
    end
    if not isThirdTestDone
      puts "3) Typing "
    end
    puts "Enter q to quit the game."
    puts "*************************************-*************************************" 
    answer = gets.chomp
    if answer == "q"
      puts "Bye bye!"
      break
    end
    case answer.to_i
    when 1
      if not isFirstTestDone 
        printBattle
        @test.battle(@characther, @golem)
        isFirstTestDone = true
      end
    when 2
      if not isSecondTestDone
        printMath
        @test.askMath(@characther)
        isSecondTestDone = true
      end
    when 3
    if not isThirdTestDone
      printSpeed
      @test.testSpeed(@characther)
        isThirdTestDone = true
    end
    else
      puts "Wrong input!"
    end
  end
end

def getOption(message, lower, upper)
  puts(message)
  opt = gets.chomp.to_i
  while(opt < lower or opt > upper)
    puts "It's not a option we offer. Try again!" 
    opt = gets.chomp.to_i
  end
  opt
end
def printTests

end
def printMeeting
  puts("                                                             
*************************************-*************************************      
                                                                     .:.   
                                                                 `:oy/`    
                                                              .+hNy:       
                                          .----------------``+mds-         
                           `/yhddh+    `/hNNNNNNNNNNNNNNhso+/.``           
                          :mMmdddh.    `-:+osyhdmNMMMdsoo/.                
                          NMddNNmd:            ```.:+o+.`                  
                          ds/myhs-/             `:++-`                     
                          .hdmy/Md.          `:++/`                        
                          /NMMhhyhs.      `+yy:.`y:`                       
                         /ddysydhmMmo+ossoshd+-+ydh/                       
                        -hmmydMm:-yhdNmdysydNMNNMNMy`                      
                         oodmdy/..-+sshhymMMMNMMMMMM+                      
                        +mmdddymmms:ydydMMNNM+MMMMMM:                      
                        smMMMmmy-.-mhyNMNdNMMyyNMMMMh`                     
            `...   ./shhdmmNddmy``-ydMMNsMMMMM/-sdMMMd`                    
          `ohy+//:sNMMMMNhmNNNyhsymNmMMsyMMMMMo  `N/mo                     
         `hM+   /mMMMNmmNhdMMMoNydMMdsmmNMMMMM:   . .                      
        `yMM.  -MMNmmNNMMMoNMM/MsdMMMmyshmNMhh                             
  ./.`.+ymMM../ymdymmhmMMy+dmyoMysdNMMMNdhyys.                             
   :yhhdNMMMys/:MMmy/dNNdoNyoyMMMNdhyyhdmNNNM+                             
     :odMNd+.  /MMMMNdy+:NmsmMMMMMMMMNmhhyss/-                             
    `:yd+-  `-sNMMNdshdhsdomMMMMMNMMMMMMMMMysdhyoo:                        
   `yo-     hMMmy/. `:ymmds-/oyyy+yMMMsNNmsyNmhysdN:                       
            Nd+`       +dMNs:`    `dMMs-.`..`    .m.                       
           +h        `-sh+- ``     -MMy       ``:ms                        
         `oM:       `ym:            yMN`     `dmdy:                        
        `oMd       /mM:              sN      /my.                          
       sNMo`       /Ny               .M                                    
       dm/          `                -M/                                   
       `                              dm-                                  
                                      sdm:                                 
                                                                                               
")
  puts "Welcome to my text based adventure game."
  puts "Select a character from this list to start. Don't forget to be smart!"
  puts(%q{*************************************-*************************************
1) Warrior - The strongest characther. However, he is slow and dumb.
Speed: 65 
Strength: 95
Intelligence: 40
Health: 120

2) Magician - The smartest characther. She is quick but not strong.
Speed: 85 
Strength: 60
Intelligence: 95
Health: 80

3) Assasin - The fastest characther. He is smart and strong enough.
Speed: 90 
Strength: 70
Intelligence: 70
Health: 90
*************************************-*************************************
})
  puts("Select a character from this list to start. Don't forget to be smart!")
end

def printWeapons

  puts "Great choice!" 
  puts("        
*************************************-*************************************                                                             
             `:`                               `:`                   
           `/dMds+/dy-                   -ym/+ydMm+`                 
           `sNMMMMMMMNh`               `hNMMMMMMMMy`                 
             dMMMMMMMN:                 :NMMMMMMMm`                  
         `-+hNMMMMMMMMd`               `dMMMMMMMMNd+-`               
     .:ohmNMMMMMMNNMMMMd:             :hMMMMMNMMMMMMNmho:.`          
  .ymNMMMMMMMMMMm--+yNMMMh:         :hMMMMh+:-mMMMMMMMMMMNmy.        
  `mMMMMMMMMMMMN-    -yNMMMd/`    :dMMMMh-    -NMMMMMMMMMMMm`        
   .dMMMMMMMMMM+       -yNMMMh- -hMMMMh:       +MMMMMMMMMMm-         
    `sNMMMMMMMN`         -yNMMNdNMMNh:`        `NMMMMMMMNs.          
      -yNMMMMMh            :NMMMMMm:            yMMMMMNy-            
        .+hmNNs           -yNMMMMMNy-           oNNmh+.              
           `.-.         -yNMMMd+yNMMNy-         .-.`                 
                      -yNMMMd/`  :hNMMNy-                            
                    -yNMMMd/`      :hMMMNy-                          
                  -yNMMMd/`          :hMMMNy-                        
                -yNMMMd/`              :hMMMNy-                      
              .yNMMMd/`                  :hMMMNy-                    
            .sNMMMm+`                      :hMMMNs.                  
           oNMMMm+`                          :dMMMNo                 
          `+mMd/`                              /dMm/                 
            `:                                  `:.                  
                                                                           ")
  puts "War is coming! Select your weapon!."
  puts("
1) Spear 
Speed: -10 
Strength: +25
Intelligence: 0
Health: +15

2) Staff
Speed: -5 
Strength: +5
Intelligence: +15
Health: +15

3) Dagger
Speed: -5 
Strength: +25
Intelligence: 0
Health: +10
*************************************-*************************************
")
end
def printBattle
  puts("

                  `smNmy.    -oys/                 
                `mMMMMMm   sMMMMMd                
               `dMMMMMMo  sMMMMMMd                
               smmmmmms  +NMMMMMd` .smNds`        
           `............`  .oNMd` .mMMMMMh        
         /dMMMMMMMMMMMMMMh.  -d` -NMMMMMM+        
        hMMMMMMMMMMMMMMMMMd   ` -NMMMMMM+         
       oMMMMMMMMMMMMMMMMMMo    :NMMMMMM/  -oso:   
      .NMMMMMMMNyyyyyyyyo-    :NMMMMMM/  sMMMMMy  
      yMMMMMMMMMh+/////////   NMMMMMN:  sMMMMMMd  
     -MMMMMMMMMMMMMMMMMMMMN.  oMMMMm:  yMMMMMMd`  
     hMMMMMMMMMMMMMMMMMMMMMd.  `::-   yMMMMMMd`   
    :MMMMMMMMMMMMMMMMMMMMMMMMho:...` /MMMMMMh`    
    dMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM/ `hMMMMy`     
   `MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm.  .:-`       
    dMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNy+::/+`      
    `sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMs       
      .yMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm`       
        .yMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-        
          :NMMMMMMMMMMMMMMMMMMMMMMMMMMMM+         
           yMMMMMMMMMMMMMMMMMMMMMMMMMMMs          
           oMMMMMMMMMMMMMMMMMMMMMMMMMd-           
           +MMMMMMMMMMMMMMMMMMMMMMMMh      

")
  puts "Battle is starting. Don't forget, your ping will effect you!"
  puts "Your opponent is a Golem!"
end 
def createCharacter(opt1, opt2)
  puts("Nice! You're all set. Let me test your ping.
*************************************-*************************************")
  if opt1 == 1
    chClass = "Warrior"
  elsif opt1 == 2
    chClass = "Magician"
  else
    chClass = "Assasin"
  end

  if opt2 == 1
    wpClass = "Spear"
  elsif opt2 == 2
    wpClass = "Staff"
  else
    wpClass = "Dagger"
  end
  Object.const_get(chClass).new(wpClass) # look for clas and creates class with string name
end
def printMath
  puts("
*************************************-*************************************
        -://///////////////////////////////:.  
       .odMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm-
     -hMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm
   .hMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN
  +NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN/
`hMMMMMmhyo++sMMMMMMNsssssssyMMMMMMMmssssssssso:` 
dMds/-        NMMMMMm       :MMMMMMM+             
              mMMMMMN       +MMMMMMM`             
              dMMMMMN       sMMMMMMd              
              dMMMMMM       yMMMMMMs              
              mMMMMMM`      dMMMMMM/              
              NMMMMMM`      mMMMMMM-              
             `MMMMMMM.      NMMMMMM`              
             :MMMMMMM-      NMMMMMM`              
             sMMMMMMM-      NMMMMMM.              
            `NMMMMMMM:      NMMMMMM:              
            hMMMMMMMM/      dMMMMMMs              
           hMMMMMMMMM+      yMMMMMMN.         `Ny`
          yMMMMMMMMMMo      +MMMMMMMd`        :MMy
         +MMMMMMMMMMM/      -MMMMMMMMm/     .sMMMm
         NMMMMMMMMMMN`       dMMMMMMMMMNdhdNMMMMMs
        `MMMMMMMMMMM/        .NMMMMMMMMMMMMMMMMMh`
         oMMMMMMMMM+          .hMMMMMMMMMMMMMMm/  
          .smMMMNs.             -smMMMMMMMMds:    
             `.`                   `-:/:-.        
    ")
  puts "Be ready to test your intelligence with math question."
  puts "*************************************-*************************************"

end
def printSpeed
  puts("                             
*************************************-*************************************
                  `-/+oo+//:::::://+++/-`                          
               ./oo+:..`. - .-+`.`````.-/+/.                       
            `:oo/..`.`` `   `.:.`    ` . ..:/:`                    
          `/o+-.`- `        --::.         ``../:`                  
         -oo-.+-`    ./++oo:      `+:/.     ./:./-                 
       `/s/.`.`:`   ::    `y/     +s+MMh/`  `. .`-:`               
      `/+-.``       .   `-::y    `d``/hMMm:     ```:`              
      /o-`.`        .sNMMd.s/    s/    -hMMy`     ``-              
     .s:`.           +oMN.:o/`  -h       /mMm:     ``.             
     ++`.`        `-///m+-/ `///ho+.      `ymm+     `.             
    `o:`.      `+o:. `+h-/     /s -ho       +NMo    ``             
    `s.``  ``  y+     :s/`    `d`  .N-       -mMo   `              
    `s.:/:.//. d-     `o:     s/   `m:        .dM/ ./.             
     o..`      h/      /`    -h    `d.         .dN:                
     //``      :d      .`    h-    -y           `dm`               
     `+`.       y/ .        -s`    y-            .ms               
      ./``      `h.`:/`   `/o`    /o              .m.              
       -:.`      .s`  .`+o+-     -+`               :s              
        .:``      -s   `d`      -/                  +              
         `-.``..   /o  `d`     :y/                  ``             
           `..:`    o- `h.    /yN/                                 
             ```    so``d.   /sNM:                                 
                   .+::`d.  /sMMM/                                 
                   o: +`m` :/mMMMs                                 
                   h` :-d`.o :MMMm`                                
                  :o  .:d`o   /MMM/                                
                  y`   /y/.    /MMm`                               
                 .s    /s:      /NMs                               
                 s`    o+`       -mM/                              
                .+     s.         .hN:                             
                o      s           `oN:                            
               :-      +             :d/                           
              `:      `.              `so                                
                                                         
")
  puts "It's the time for testing your speed!"
  puts "*************************************-*************************************"
  puts "You have 15 seconds to retype the text above."
end
main()
