# frozen_string_literal: true

require_relative "word_logic/version"

module WordLogic
  def getwords(length); end

  def compareWords(chars, compchars)
    compcharsres = compchars.clone
    compchars.each { |e| compcharsres << e.dup }
    res = Array(chars.length)
    checkGreen(chars, compcharsres, res)
    checkYellow(chars, compcharsres, res)
    res
  end

  def checkGreen(chars, compchars, res)
    for i in 1..chars.length
      if chars[i] == compchars[i]
        compchars[i] = " "
        res[i] = 2
      end
      end
  end

  def checkYellow(chars, compchars, res)
    for i in 1..chars.length
      if ompcharsres.include?(chars[i])
        compchars[i] = " "
        res[i] = 2
      end
      end
  end

  class Error < StandardError; end
  # Your code goes here...
end
