require "./blackjack_test"
require "pry"

# class Blackjack
  
# end

class Card

    def initialize(values, suit)
        @values = values
        @suit = suit
    end


    def value
        if @values == :K || @values == :Q || @values == :J
            10
        elsif @values == :A
            1
        else
            @values.to_i
        end
    end

end

class Deck 

    def initialize
      @suit_values = [:S, :D, :C, :H]
      @card_values = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
    end

    def cards
          @full_deck = []
          @full_deck = @card_values.product(@suit_values)
    end

    # def hand
    #       @hand = []
    # end

    def draw
      drawn_card = []
      @shuffled_deck = @full_deck.shuffle!
      @shuffled_deck.shift(@drawn_card)
      binding.pry
    end


    # def drawn_card
    #   drawn_card = []
    #   shuffled_deck = @full_deck.shuffle!
    #   drawn_card.shift(shuffled_deck)
    # end
end