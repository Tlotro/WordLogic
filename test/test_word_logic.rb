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

  def test_it_does_something_useful
    assert true
  end
end
