class Gcd
  def initialize
  end

  def gcd(a, b)
    while b != 0
      r = a % b
      a = b
      b = r
    end
    return a
  end

  def gcd2(a, b)
    return a if b == 0
    r = a % b
    self.gcd2(b,r)
  end
end
