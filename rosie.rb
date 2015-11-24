
class Bankroll
attr_accessor :begining, :spent, :won

def initialize (begining, spent, won)
  @begining = begining.to_i
  @spent = spent.to_i
  @won = won.to_i
end


def bankroll_counter
  @bankroll_tot = @begining - @spent + @won
  puts "Your bankroll is $#{@bankroll_tot}"
  if @bankroll_tot <= 0
    puts "This casino is not a credit institution. You loose!\nBetter luck next time!"
  end

end
end

class Game

 def intro_to_casino
    puts `clear`
    sleep 0.65
    puts '#$#$ $#$ $#$# #$#$# #$#$#$ $#$#$#$ $#$#$# #$#$# $#$#$ $#$'
    puts ""
    sleep 0.65
    puts "***************** WELCOME TO THE CASINO! *****************"
    sleep 0.65
    puts ""
    puts '#$#$ $#$ $#$# #$#$# #$#$#$ $#$#$#$ $#$#$# #$#$# $#$#$ $#$'
    puts ""
    sleep 0.75
    puts "Please enter your name:"
    @name = gets.strip.capitalize
    puts "Hello, #{@name}" 
    create_bankroll
 end

 def create_bankroll
   @bankroll = Bankroll.new(500, 0, 0)
   @bankroll.bankroll_counter
   game_room_menu
 end

 def game_room_menu
   sleep 1
   puts "What game would you like to play?\nType 1 for Slots, 2 for High-Low, 3 for checking your bankroll, 4 to quit."
   input = gets.strip.to_i
   case input
   when 1
      slots
   when 2
      high_low
   when 3
      @bankroll.bankroll_counter
      puts "Press Enter to go back to Slots Menu"
      gets
      game_room_menu
   when 4 
      exit_now
   else 
      puts "Not a Valid entry. Try again."
   #display menu
      game_room_menu 
   end
 end

 def slots
  puts "Great! Let's play Slots!!\n\nPress 1 to play, 2 to go to main menu, 3 to quit."
  input = gets.strip.to_i
  case input
  when 1
      slot_game
  when 2
      game_room_menu
  when 3
      exit_now
  else 
      puts ""
      puts "Not a Valid entry"
      puts ""
  #display menu
      slots
  end
 end

 def exit_now
  sleep 1
  puts "\n\nThanks for coming! Hope you enjoyed your time at the Casino.\n\n"
  exit 0
 end

 def slot_game
  puts "Press 'Enter' to pull the slot. It is $50."
  gets

  @bankroll.spent = 50
  symbols = ['^_^', '$', '<3']
  slot_one = symbols.sample(1)
  slot_two = symbols.sample(1)
  slot_three = symbols.sample(1)
  print slot_one
  sleep (1)
  print " #{slot_two}"
  sleep (1)
  print " #{slot_three}\n\n"
  sleep (1)
  if slot_one == slot_two && slot_one == slot_three
    puts "You win the Jackpot!!!!!!!!!"
    puts ""
    @bankroll.won = 1000
    slots
  else 
    puts "Oh man! Try again soon!"
    puts ""
    slots
  end
 end

end

@game = Game.new
@game.intro_to_casino