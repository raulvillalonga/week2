require "pry"

class PasswordChecker
  def check_password(mail, password)
    check_size(password) &&
    has_letters?(password) &&
    has_number?(password) &&
    has_symbol?(password) &&
    has_upcase?(password) &&
    has_lowcase?(password) &&
    contains_name?(mail, password) &&
    contains_domain?(mail, password)
  end

  private
  def check_size(str)
    str.size > 7
  end

  def has_letters?(password)
    if (password =~ /[A-Za-z]/) == nil
      false
    else
      true
    end
  end

  def has_number?(password)
    if (password =~ /\d/) == nil
      false
    else
      true
    end
  end

  def has_symbol?(password)
    if (password =~ /\W/) == nil
      false
    else
      true
    end
  end

  def has_upcase?(password)
    if (password =~ /[A-Z]/) == nil
      false
    else
      true
    end
  end

  def has_lowcase?(password)
    if (password =~ /[a-z]/) == nil
      false
    else
      true
    end
  end

  def contains_name?(mail, password)
    name = mail.split("@")[0]
    !password.include?(name)
  end

  def contains_domain?(mail, password)
    domain = mail.split("@")[1].split(".")[0]
    !password.include?(domain)
  end

end
