class Fizzbuzz
  def check number
    number
  end
end


(1..10).each do |num|
  puts Fizzbuzz.new.check(num)
end
