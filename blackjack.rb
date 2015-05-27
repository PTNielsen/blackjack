require "./blackjack_test"
require "pry"

class Card

  def initialize(values, suit)
    @values = values
    @suit = suit
  end

  def to_s
    "#{@values}#{@suit}"
  end

  def value
    if @values == :K || @values == :Q || @values == :J
      10
      elsif @values == :A
            11
      else
          @values.to_i
      end
  end

end

      class Deck 

        def initialize
          @suit_values = [:S, :D, :C, :H]
          @card_values = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
          @full_deck = @card_values.product(@suit_values)
          @drawn_cards = []
        end

        def cards
          return @full_deck
        end

        def draw
          @shuffled_deck = @full_deck.shuffle!
          drawn_card = @shuffled_deck.shift
          @drawn_cards.push(drawn_card)
          return drawn_card
        end

        def drawn
          return @drawn_cards
        end

      end

      class Hand

        def initialize(hand = 0)
          @my_cards = []
        end

        def value
          value_of_cards = 0
          card_with_ace = false
          @my_cards.each do | my_card |
            value_of_cards += my_card.value
            if my_card.value == 11
              card_with_ace = true
            end
          end
          if value_of_cards > 21 && card_with_ace
            value_of_cards -= 10
          end
          return value_of_cards
        end

        def add *cards
         cards.each do | card |
          @my_cards.push(card)
        end
      end

      def blackjack?
        value == 21 && @my_cards.count == 2
      end

      def to_s
        hand_as_string = []
        @my_cards.each do | card |
          hand_as_string.push(card.to_s)
        end
        hand_as_string.join(", ")
      end

      def busted?
        value  > 21
      end
    end