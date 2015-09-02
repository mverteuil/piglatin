require 'minitest/autorun'
require './piglatin'


class TestPigLatin < MiniTest::Test
    def test_translate_word_starting_with_vowel
        translator = SentenceTranslator.new('apple')
        assert_equal 'appleay', translator.translate
    end

    def test_translate_word_starting_with_consonant
        translator = SentenceTranslator.new('banana')
        assert_equal 'ananabay', translator.translate
    end

    def test_translate_word_starting_with_two_consonants
        translator = SentenceTranslator.new('cherry')
        assert_equal 'errychay', translator.translate
    end

    def test_translates_two_words
        translator = SentenceTranslator.new('eat pie')
        assert_equal 'eatay iepay', translator.translate
    end

    def test_translates_word_starting_with_three_consonants
        translator = SentenceTranslator.new('three')
        assert_equal 'eethray', translator.translate
    end

    def test_translates_sch_as_phoneme
        translator = SentenceTranslator.new('school')
        assert_equal 'oolschay', translator.translate
    end

    def test_translates_qu_as_phoneme
        translator = SentenceTranslator.new('quiet')
        assert_equal 'ietquay', translator.translate
    end

    def test_translates_qu_as_consonant_when_preceded_by_consonant
        translator = SentenceTranslator.new('square')
        assert_equal 'aresquay', translator.translate
    end

    def test_translates_many_words
        translator = SentenceTranslator.new('the quick brown fox')
        assert_equal 'ethay ickquay ownbray oxfay', translator.translate
    end
end
