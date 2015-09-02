class SentenceTranslator
    def initialize(sentence)
        @sentence_words = sentence.split(' ')
    end


    def translate
        word_list = @sentence_words.map! do |word|
            word_translator = WordTranslator.new word
            word_translator.translate
        end
        word_list.join(' ')
    end
end


class WordTranslator
    @@letters = ('a'..'z').to_a
    @@vowels = %w[a e i o u]
    @@exceptional_prefix = 'qu'
    @@consonants = @@letters - @@vowels

    def initialize(word)
        @word = word
    end

    def head
        @word[0..1]
    end

    def body
        @word[2..-1]
    end

    def starts_with_qu
        head == @@exceptional_prefix
    end

    def stem
        starts_with_qu ? body + head : head + body
    end

    def test_letter
        starts_with_qu ? body[0] : head[0]
    end
    
    def has_initial_consonant
        @@consonants.include?(test_letter)
    end

    def has_initial_vowel
        @@vowels.include?(test_letter)
    end

    def translate
        first_vowel_index = stem.index(/[aeiou]/)
        vowel_precedant = stem[first_vowel_index - 1]

        if has_initial_consonant and vowel_precedant != 'q'
            translated = stem[first_vowel_index..-1] + stem[0..first_vowel_index-1]
        elsif has_initial_consonant
            translated = stem[3..-1] + stem[0..2]
        elsif has_initial_vowel
            translated = stem
        end
        
       return translated + 'ay'
    end
end
