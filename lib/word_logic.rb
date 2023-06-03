# frozen_string_literal: true

require_relative "word_logic/version"

module WordLogic

  class Error < StandardError; end
  # Your code goes here...
  
  def get_words(length); end

  def is_word(compchars)
    File.foreach("words.txt") do |line| 
      return true if (compchars == line)
    end
  end

  def compare_words(chars, compchars)
    compcharsres = compchars.clone
    compchars.each { |e| compcharsres << e.dup }
    res = Array(chars.length)
    check_green(chars, compcharsres, res)
    check_yellow(chars, compcharsres, res)
    res
  end

  def check_green(chars, compchars, res)
    for i in 1..chars.length
      if chars[i] == compchars[i]
        compchars[i] = " "
        res[i] = 2
      end
    end
  end

  def check_yellow(chars, compchars, res)
    for i in 1..chars.length
      if compchars.include?(chars[i])
        compchars[i] = " "
        res[i] = 2
      end
    end
  end
  
end
