require 'rspec'

class FizzBuzz
  def check number

    result = ''
    numberStr = number.to_s

    if (number % 3 == 0)
      result += "Fizz"
    end
    
    if (number % 5 == 0)
      result += "Buzz"
    end

    if numberStr[0] == '1'
      result += "Bang"
    end

    if result == ''
      result = number.to_i
    end
    
    if (number % 7 == 0)
      result = "Nike"
    end

    if (numberStr[0] == '2')
      result = "Vodafone"
    end

    result
  end
end