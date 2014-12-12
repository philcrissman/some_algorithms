
def combinations(arr, n)
  (0..arr.length-1).map{|a| (a+1..arr.length-1).map{|b| (b+1..arr.length-1).map{|c| [a,b,c]}}}.flatten(2)
end

def combo(arr, n)
  array = []
  (0..arr.length-1).each{|i| (i+1..arr.length-1).each{|j| (j+1..arr.length-1).each{|k| array << [i,j,k]}}}
  array
end
