require('rspec')
require('term')

describe(Term) do
  before() do
    Term.clear()
  end

  describe("#initialize") do
    it("creates a word and definition pair") do
      test_term = Term.new("word", "definition")
      expect(test_term.word()).to(eq(["word"]))
      expect(test_term.definition()).to(eq(["definition"]))
      expect(test_term.id()).to(eq(1))
    end
  end

  describe("#word") do
    it("returns the word") do
      test_term = Term.new("word", "definition")
      test_term1 = Term.new("berries, apples","fruit")
      expect(test_term.word()).to(eq(["word"]))
      expect(test_term1.word()).to(eq(["berries", "apples"]))
    end
  end

  describe("#definition") do
    it("returns the defintion") do
      test_term = Term.new("word", "definition")
      test_term1 = Term.new("bass", "fish, instrument")
      expect(test_term.definition()).to(eq(["definition"]))
      expect(test_term1.definition()).to(eq(["fish", "instrument"]))
    end
  end

  describe("#id") do
    it("returns the unique id of word") do
      test_term = Term.new("desk", "thing you work on")
      expect(test_term.id()).to(eq(1))
    end
  end

  describe(".all") do
    it("returns all instances of the class") do
      expect(Term.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds word to array of saved word") do
      test_term = Term.new("carrot", "A delicious")
      test_term.save()
      expect(Term.all()).to(eq([test_term]))
    end
  end

  describe(".clear") do
    it("it empties out the array") do
      test_term = Term.new("cake", "yummy")
      test_term.save()
      Term.clear()
      expect(Term.all()).to(eq([]))
    end
  end

  describe(".search") do
    it("returns an object's definition of the word") do
      test_term = Term.new("carrot", "A delicous vegetable")
      test_term.save()
      test_term1 = Term.new("tomato", "a red fruit")
      test_term1.save()
      expect(Term.search("tomato")).to(eq(test_term1))
    end
  end

  describe(".find") do
    it("returns the term by its id number") do
      test_term = Term.new("carrot", "A delicous vegetable")
      test_term.save()
      test_term1 = Term.new("tomato", "a red fruit")
      test_term1.save()
      expect(Term.find(test_term.id())).to(eq(test_term))
    end
  end

end
