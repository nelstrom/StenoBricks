class Homographer
  attr_reader :dictionary

  def initialize(homographs)
    @dictionary = Hash.new
    homographs.each do |wordlist|
      wordlist.each do |word|
        @dictionary[word] = (wordlist - [word]).sort
      end
    end
  end

  def to_s
    "<" + self.class.name + ": " + dictionary.to_s + ">"
  end
end
