#
class SteppedRange
  include Enumerable

  def each
    current = start
    # yield is like return, but for enumerables
    while current <= stop
      yield current
      current += step
    end
  end

  attr_reader :start, :stop, :step
  private :start, :stop, :step
  def initialize(start, stop, step)
    # don't do this (but you can if you want)
    # @start, @stop, @step = start, stop, step
    @start = start
    @stop = stop
    @step = step
  end
end
