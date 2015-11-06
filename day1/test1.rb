require 'rspec'
class Add
  def initialize
    @frase = ""
    @resultado = 0
  end

  def sumar(frase)
    @frase = frase
    arr_frase = @frase.gsub("\n",",").split(",")
    @resultado = arr_frase.reduce(0){|sum, x| sum + x.to_i}
  end

  def validar(num)
    if @resultado == num
      puts "FUNCIONA"
    else
      puts "NO FUNCIONA"
    end        
  end
end



RSpec.describe "String calculator" do

  before :each do 
    @calculator = Add.new
  end

  it "return 0 for the empty string" do
    expect(@calculator.sumar("")).to eq(0)
  end
  it "return add 2 number" do
    expect(@calculator.sumar("2,3")).to eq(5)
  end
  it "return resutl more numbers" do
    expect(@calculator.sumar("2,3,5,4")).to eq(14)
  end
    it "return add 2 number /n" do
    expect(@calculator.sumar("2\n3")).to eq(5)
  end
  it "return resutl more numbers /n" do
    expect(@calculator.sumar("2,3\n5,4")).to eq(14)
  end
end

=begin
val = Add.new("2,3")
val.sumar
val.validar(5)

val = Add.new("2,3,0,4,5,7,8")
val.sumar
val.validar(52)

val = Add.new("")
val.sumar
val.validar(0)
=end