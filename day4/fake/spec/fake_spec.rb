require_relative '../fake.rb'

RSpec.describe "Test EmailProvider class" do 
  it "should returns a empty hash if no words give" do
    provider = EmailProvider.new([])
    counter = WordChecker.new(provider)
    expect(counter.check([])).to eq(true)
  end
  it "should returns a empty hash if no words give" do
    provider = EmailProvider.new([])
    counter = WordChecker.new(provider)
    expect(counter.check(["hola"])).to eq(false)
  end
  it "should returns a empty hash if no words give" do
    provider = EmailProvider.new(["hola"])
    counter = WordChecker.new(provider)
    expect(counter.check(["hola"])).to eq(false)
  end
end