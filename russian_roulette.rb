# # puts "Hello player 1, what's your name?"
# # player_1 = "Peter" #gets.chomp
# # player_2 = "computer"
# # player_list = []
# # player_list = player_1 , player_2
# # bullet_in_chamber = rand(1..6)
# # untried_chambers = *(1..6)
# # goes_first = rand(2..3)
# # current_player = nil
# #
# # if goes_first % 2 == 0
# #   puts "#{player_2} goes first."
# #   current_player = 2
# # else
# #   puts "#{player_1} goes first."
# #   current_player = 1
# # end
# #
# # while true
# #   picked_bullet = untried_chambers.sample
# #   untried_chambers.delete_if {|picked| picked == picked_bullet}
# #
# #   puts current_player, picked_bullet, bullet_in_chamber, untried_chambers
# #
# #   if current_player % 2 == 0
# #     if picked_bullet == bullet_in_chamber
# #       puts player_1 + " got shot."
# #       break
# #     else
# #       puts "It's #{player_2} turn"
# #       current_player += 1
# #     end
# #
# #   elsif current_player % 3 == 0
# #     if picked_bullet == bullet_in_chamber
# #       puts player_2 + " got shot."
# #       break
# #     else
# #       puts "It's #{player_1} turn"
# #       current_player += 1
# #     end
# #   end
# # end
#
#
# gun = []
# 6.times do
#   gun << 0
# end
# gun[rand(0...6)] = 1
#
# gun_array = *(1..6)
# # print gun_array
#
# puts "pick a number 1 to 6"
# player_choose = gets.chomp.to_i
# # print player_choose
#
# index_chosen = gun_array.index(player_choose)
# bullet_in = gun.find_index(1)

def russian_roulette()
  gun = []
  6.times do
    gun << 0
  end
  gun[rand(0...6)] = 1

  gun_array = *(1..6)
  # print gun_array

  puts "pick a number 1 to 6"
  player_choose = gets.chomp.to_i
  # print player_choose

  index_chosen = gun_array.index(player_choose)
  bullet_in = gun.find_index(1)

  if  bullet_in == index_chosen
    puts "Bang! you die.."
  else
    puts "bullet was in " + (bullet_in + 1).to_s
    puts "you picked " + (index_chosen + 1).to_s
    puts "you survived. would you want to try again? type yes or no"
    answer = gets.chomp
    if answer == "yes"
      russian_roulette()
    else
      return
    end
  end
end
russian_roulette()
