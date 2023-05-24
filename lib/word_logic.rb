# frozen_string_literal: true

require_relative "word_logic/version"

module WordLogic
  def getwords(length)
    
  end

  def compareWords(chars, compchars)
    res = Array(chars.length)
    for i in 1..chars.length
      if (chars[i]==compchars[i])
        compchars[i] = ' '
        res[i] = 2
      end
    end
    for i in 1..chars.length
      if (compchars.include?(chars[i]))
        compchars[i] = ' '
        res[i] = 1
      end
    end
    res
  end
  
  class Error < StandardError; end
  # Your code goes here...
end
