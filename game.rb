require "./blackjack"
require "pry"

def deal_hands deck, user, dealer
  2.times { user.add(deck.draw) }
  puts "Your hand is #{user.to_s} for a value of #{user.value}"
  2.times { dealer.add(deck.draw) }
  if user.blackjack?
    puts "The dealer's hand is #{dealer.to_s} for a value of #{dealer.value}"
  else
    puts "The dealer's hand is #{dealer.to_s.slice(0..1)}, '?' for a value of '?'"
  end
end

def hit? deck, user, dealer
  until user.value >= 21
    print "Would you like to hit? (y/n): "
    user_input = gets.chomp
    if user_input == "y"
      user.add(deck.draw)
      system "clear"
      puts "Your hand is #{user.to_s} for a value of #{user.value}"
    elsif user_input == "n"
      system "clear"
      puts "Your hand is #{user.to_s} for a value of #{user.value}"
      while !dealer.blackjack? &&  !dealer.busted? && dealer.value <  user.value && dealer.value < 17
      dealer.add(deck.draw)
      end
      puts "The dealer's hand is #{dealer.to_s} for a value of #{dealer.value}"
      break
    else 
      puts "Invalid key."
      hit?(deck, user, dealer)
    end
  end
end

def user_has_won user, dealer
  if user.blackjack? && !dealer.blackjack?
    return true
  elsif user.value > dealer.value && !user.busted?
    return true
  elsif !user.busted? && dealer.busted? 
    return true
  end
end

def dealer_has_won user, dealer
  if dealer.blackjack? && dealer.value > user.value
    return true
  elsif user.busted?
    return true
  elsif dealer.value > user.value && !dealer.busted?
    return true
  end
end

def result user, dealer
  if user_has_won(user, dealer)
    puts "You win!"
  elsif dealer_has_won(user, dealer)
    puts "You lose!  Better luck next time!"
  else
    puts "It's a push!"
  end
end

def play_again? deck, user, dealer
  print "Would you like to play again? Enter 'y' for 'Yes' or any other key for 'No': "
  decision = gets.chomp
  if decision == "y"
    begin_game
  else
    game_over
  end
end

def game_over
  puts "OK! See you later!"
end

def begin_game
  user = Hand.new
  dealer = Hand.new
  deck = Deck.new
  system "clear"
  deal_hands(deck, user, dealer)
  hit?(deck, user, dealer)
  result(user, dealer)
  play_again?(deck, user, dealer)
end

system "clear"
print "Ready to play Blackjack? Enter 'y' for 'Yes' or any other key for 'No': "
ready_to_play = gets.chomp
ready_to_play = "y"
  if ready_to_play == "y"
    puts "Good luck!"
    begin_game
  else
    puts "Maybe next time!"
    game_over
  end