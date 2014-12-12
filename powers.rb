def to_power(a, p)
  b = a * a
  return 1 if p == 0
  return a if p == 1
  return b if p == 2
  twos = 2
  while twos <= p
    twos = twos * 2
    b = b * b if twos <= p
  end
  if twos > p
    twos = twos / 2
  end
  if p > twos
    b = b * a
  end
  b
end


def raise_to_power(a, p)
  # array of powers of 2
  prev  = 1
  exp   = 2
  arr   = [1,2]

  # so we get our array
  until expi + 1 > p
    arr[exp] = arr[prev] * arr[prev]
    exp = exp * 2
  end

  indexes = arr.each_with_index.map{|el,i| i if !el.nil?}.compact

  parts = [arr.length - 1] # the last index of arr

  bin = p.to_s(2) # get the bits so we know which indexes to use

  use_indexes = bin.split('').each_with_index.map{|el, i| i if el == '1'}.compact
  actual = use_indexes.map{|n| indexes.reverse[n]}

  actual.inject(1){|product, n| product * arr[n]}
end
