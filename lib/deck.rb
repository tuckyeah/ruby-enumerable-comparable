require_relative 'card'

# A simple representation of a deck of playing cards
class Deck
  attr_reader :storage # lets us access 'deck' inside the class
  private :strorage # doesn't let us access 'deck' from outside the class

  def initialize
    # take all the card suits and all the card RANKS
    # and create a card for each, then flatten that array.
    @storage = Card::SUITS.map do |suit|
      Card::RANKS.map { |rank| Card.new(rank, suit) }
    end.flatten
  end

  # swap front and back somewhere in the middle third.
  def cut
    count = storage.length
    random = Random.rand(count / 3)
    cut_point = (count / 3 + random)
    storage.replace storage.slice(cut_point, count - cut_point) +
                                    storage.slice(0, cut_point)
    self
  end

  def count
    storage.count
  end

  # takes the first card off the deck and returns a single card object
  # this is an engineering fault because we can't chain other instance methods
  # after draw
  def draw
    storage.shift
  end

  # shuffles the deck and returns itself, otherwise we'd have an Array returned
  # and Arrays don't have 'cut' or 'draw' as methods
  # this returns Self so we can call other instance methods after shuffle
  def shuffle
    storage.shuffle! # instance variable
    self
  end

  def deal(cards, *hands)
    # deal the number of cards requested into the numbers of hands requested
    # one at a time
    cards.times do
      hands.each do |hand|
        hand << draw
      end
    end
  end
end
