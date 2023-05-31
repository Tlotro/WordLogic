# frozen_string_literal: true

require_relative "word_logic/version"

module WordLogic
  def get_words(length); end

  def is_word(compchars)
    File.foreach("users.txt") { |line| if (compchars == line) return true end }
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

  def chekWord(res)
    letter = 0
    for i in 1..res.length
      if (res[i] == 2)
        letter +=1
      end
    end
    return letter
  end

  def chekResult(try, chars)
    while (try > 0)
      compareWords(chars, compchars)
      try -= 1
      letter = chekWord(res)
      if (letter == chars.length)
        puts "Ответ получен"
        break
      elsif (try == 0)
        puts "Попытки закончились"
      else
        puts "Ответ не получен, но есть еще попытки"
      end
    end
  end
  
  class Error < StandardError; end
  # Your code goes here...
end
