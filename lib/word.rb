class Word
  @@all_words = []

  define_method(:initialize) do |word, language|
    @word = word
    @language = language
  end

  define_method(:word) do
    @word
  end

  define_method(:language) do
    @language
  end

  define_singleton_method(:all) do
    @@all_terms
  end

  define_method(:save) do
    @@all_terms.push(self)
  end

  define_singleton_method(:clear) do
    @@all_terms = []
  end
end
