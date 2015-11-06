require 'rspec'
require_relative '../lib/password_checker'

RSpec.describe PasswordChecker do
  describe '#check_password' do
    it 'password "11D$a98g" is correct' do
      expect(PasswordChecker.new.check_password("rafa@ironhack.com", "11D$a98g")).to be(true)
    end

    it 'password "11D$a98g" is incorrect because it has less than 7 characters' do
      expect(PasswordChecker.new.check_password("rafa@ironhack.com", "11D$a9")).to be(false)
    end

    it 'password "111$9988" to be false because it has no letters' do
      expect(PasswordChecker.new.check_password("rafa@ironhack.com", "111$9988")).to be(false)
    end

    it 'password "DDD$aggg" to be false because it has no number' do
      expect(PasswordChecker.new.check_password("rafa@ironhack.com", "DDD$aggg")).to be(false)
    end

    it 'password "11Daa98g" to be false because it has no symbols' do
      expect(PasswordChecker.new.check_password("rafa@ironhack.com", "11Daa98g")).to be(false)
    end

    it 'password "11aaa98g%$" to be false because it has no upcases letters' do
      expect(PasswordChecker.new.check_password("rafa@ironhack.com", "11aaa98g%$")).to be(false)
    end

    it 'password "11AAA98S%$" to be false because it has no lowcases letters' do
      expect(PasswordChecker.new.check_password("rafa@ironhack.com", "11AAA98S%$")).to be(false)
    end

    it 'password "1rafa1AAA98S%$" to be false because it contains the username' do
      expect(PasswordChecker.new.check_password("rafa@ironhack.com", "1rafa1AAA98S%$")).to be(false)
    end
    it 'password "1ironhack1AAA98S%$" to be false because it contains the domain' do
      expect(PasswordChecker.new.check_password("rafa@ironhack.com", "1ironhack1AAA98S%$")).to be(false)
    end
  end
end
