require 'rspec'

class EmailProvider
  def initialize subjects
    @subjects = subjects
  end
  def get_subjects
    @subjects
  end
end


class WordChecker
  def initialize subjects_provider
    @subjects_provider = subjects_provider
  end

  def check words
    subjects = @subjects_provider.get_subjects
    subjects.each do |subject|
       subject.include? words
       
     end
  end
end
