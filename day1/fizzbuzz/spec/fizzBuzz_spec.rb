require_relative '../fizzBuzz.rb'

RSpec.describe "FizzBuzz checker" do 
  it "number returns number" do
    expect(FizzBuzz.new.check(1)).to eq("Bang")
  end
  it "number returns number" do
    expect(FizzBuzz.new.check(4)).to eq(4)
  end
  it "if 3 returns Fizz" do
    expect(FizzBuzz.new.check(3)).to eq("Fizz")
  end
  it "if 5 returns Buzz" do
    expect(FizzBuzz.new.check(5)).to eq("Buzz")
  end
  it "if 15 returns FizzBuzz" do
    expect(FizzBuzz.new.check(15)).to eq("FizzBuzzBang")
  end
  it "if 10 returns Bang" do
    expect(FizzBuzz.new.check(10)).to eq("BuzzBang")
  end
  it "if 30 returns Bang" do
    expect(FizzBuzz.new.check(30)).to eq("FizzBuzz")
  end
  it "if 12 returns Bang" do
    expect(FizzBuzz.new.check(12)).to eq("FizzBang")
  end
  it "if 7 returns Bang" do
    expect(FizzBuzz.new.check(7)).to eq("Nike")
  end
  it "if 14 returns Bang" do
    expect(FizzBuzz.new.check(14)).to eq("Nike")
  end
  it "if 20 returns Bang" do
    expect(FizzBuzz.new.check(20)).to eq("Vodafone")
  end
end