class Term
  @@all_terms = []

  define_method(:initialize) do |word, definition|
    @word = word.split(", ")
    array_of_defs = definition.split(", ")
    @definition = array_of_defs
    @id = @@all_terms.length().+(1)
  end

  define_method(:word) do
    @word
  end

  define_method(:definition) do
    @definition
  end

  define_singleton_method(:all) do
    @@all_terms
  end

  define_method(:id) do
    @id
  end

  define_method(:save) do
    @@all_terms.push(self)
  end

  define_singleton_method(:clear) do
    @@all_terms = []
  end

  define_singleton_method(:find) do |id|
    found_term = nil
    @@all_terms.each() do |term|
      if term.id().eql?(id)
        found_term = term
      end
    end
    found_term
  end

  define_singleton_method(:search) do |word_to_find|
    term_found = nil
    array = word_to_find.split()
    @@all_terms.each() do |term|
      if term.word().eql?(array)
        term_found = term
      end
    end
    Term.find(term_found.id())
  end


end
