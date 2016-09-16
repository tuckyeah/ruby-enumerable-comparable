# A simple representation of a playing card.
class Card
  include Comparable

  def <=>(other)
    suit_comparison = SUITS.index(suit) <=> SUITS.index(other.suit)
    rank_comparison = RANKS.index(rank) <=> RANKS.index(other.rank)

    # this compares the suits first because then it will group them when
    # we make a deck - to just evaluate individual cards, we'd want to do
    # rank_comparison.zero? then suit_comparison
    # this means that unless they're the same suit, we'll be ordering by suit
    if suit_comparison.zero?
      rank_comparison
    else
      suit_comparison
    end
  end

  SUITS = %w(C D H S).freeze # freeze makes it immutable
  RANKS = [(2..10).to_a, %w(J Q K A)].flatten.freeze
  # flatten turns these two arrays into one

  attr_reader :suit, :rank

  def initialize(rank, suit)
    raise ArgumentError, # guard clause
          "Suit: '#{suit}' not in #{SUITS}" unless SUITS.include? suit
    raise ArgumentError, # guard clause
          "Rank: '#{rank}' not in #{RANKS}" unless RANKS.include? rank

    @suit = suit
    @rank = rank
  end

  def to_s
    "#{rank}:#{suit}"
  end
end
