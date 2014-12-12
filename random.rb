class RandomNumber


  A = 7
  B = 5
  M = 11111

  attr_reader :seed
  attr_reader :last
  attr_reader :i

  def initialize(seed)
    @seed = seed
    @last = seed
    @i = 0
  end

  def next
    if @i > 0
      @last = (A * @last + B) % M
    end
    @i += 1
    @last
  end
end
