class Eratosthenes

  attr_accessor :composites, :primes

  def initialize
    @composites = []
    @primes = []
  end

  def find_primes(up_to)
    (2..up_to).step(2).each do |even|
      self.composites[even] = true if self.composites[even].nil?
    end
    next_prime = 3
    stop_at = Math::sqrt(up_to)
    while next_prime < stop_at
      ((next_prime * 2)..up_to).step(next_prime).each do |multiple|
        self.composites[multiple] = true if self.composites[multiple].nil?
      end
      next_prime += 2
      while next_prime <= up_to && composites[next_prime]
        next_prime += 2
      end
    end
    composites.each_with_index do |el, i|
      next if primes.include? i
      primes << i unless el
    end
    return nil
  end
end
