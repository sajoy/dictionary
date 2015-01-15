require('rspec')
require('term')
require('word')

describe(Word) do
  before() do
    Word.clear()
  end

  describe("#initialize") do
    it("creates a word in another language") do
      test_term = Word.new("word", "language")
      expect(test_term.word()).to(eq("word"))
      expect(test_term.language()).to(eq("language"))
    end
  end

  describe("#word") do
    it("returns instance of word ") do
      test_term = Word.new("word", "language")
      expect(test_term.word()).to(eq("word"))
  end
  end

  describe("#language") do
    it("returns the word in another language") do
      test_term = Word.new("word", "language")
      expect(test_term.language()).to(eq("language"))
    end
  end


  describe(".all") do
    it("returns all instances of the class") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds word to array of saved word") do
      test_term = Word.new("chou", "pomme")
      test_term.save()
      expect(Word.all()).to(eq([test_term]))
    end
  end

  describe(".clear") do
    it("it empties out the array") do
      test_term = Word.new("pain", "pate")
      test_term.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

end
