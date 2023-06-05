# frozen_string_literal: true

require_relative "../lib/word_logic"
require "word_logic"

class TestWordLogic < Minitest::Test
  include WordLogic
  def test_that_it_has_a_version_number
    refute_nil ::WordLogic::VERSION
  end

  def test_it_compares_words_correctly
    assert compare_words("ab", "ba") == [1, 1]
    assert compare_words("a", "b") == [0]
    assert compare_words("a", "a") == [2]
    assert compare_words("ac", "ba") == [1, 0]
    assert compare_words("cac", "aba") == [0, 1, 0]
    assert compare_words("caa", "aba") == [0, 1, 2]
    assert compare_words("cac", "aaa") == [0, 2, 0]
  end

  def test_it_recognises_words
    assert word?("хозяйка")
    assert word?("утверждать")
    assert word?("тоска")
    assert word?("каркас")
    assert word?("вселенная")
    assert word?("похвалить")
    assert word?("раздавить")
    assert word?("спустить")
    assert word?("спирт")
    assert word?("удержать")
  end

  def test_no_false_positive
    assert !word?("хозяка")
    assert !word?("утвеждать")
    assert !word?("тоса")
    assert !word?("карас")
    assert !word?("вселеная")
    assert !word?("повалить")
    assert !word?("раздаить")
    assert !word?("сустить")
    assert !word?("пирт")
    assert !word?("удежать")
  end

  def test_it_recognises_words_by_lines
    assert word_by_l?("хозяйка")
    assert word_by_l?("утверждать")
    assert word_by_l?("тоска")
    assert word_by_l?("каркас")
    assert word_by_l?("вселенная")
    assert word_by_l?("похвалить")
    assert word_by_l?("раздавить")
    assert word_by_l?("спустить")
    assert word_by_l?("спирт")
    assert word_by_l?("удержать")
  end

  def test_no_false_positive_by_lines
    assert !word_by_l?("хозяка")
    assert !word_by_l?("утвеждать")
    assert !word_by_l?("тоса")
    assert !word_by_l?("карас")
    assert !word_by_l?("вселеная")
    assert !word_by_l?("повалить")
    assert !word_by_l?("раздаить")
    assert !word_by_l?("сустить")
    assert !word_by_l?("пирт")
    assert !word_by_l?("удежать")
  end

  def test_input_and_output
    set_word("хозяйка")
    assert in_out("абрикос") == [1, 0, 0, 0, 1, 1, 0]
    assert in_out("бутылка") == [0, 0, 0, 0, 0, 2, 2]
    set_word("спустить")
    assert in_out("спустить") == [2, 2, 2, 2, 2, 2, 2, 2]
  end
end
