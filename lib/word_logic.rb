# frozen_string_literal: true

require_relative "word_logic/version"

module WordLogic

  class Error < StandardError; end
  # Your code goes here...
  
  def getwords(length); end

  wordLength = 6
  theWord = ""
  
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
      if compcharsres.include?(chars[i])
        compchars[i] = " "
        res[i] = 1
      end
      end
  end

  def setWord(word)
    theWord = word
  end
  
  def in_out(inWord)
    yes = true
    inWord.each_char do |s| 
      if s >= 'z' or s<='a'
        yes = false 
        break 
      end
    end
    if (yes and inWord.length == wordLength)
      res = compareWords(inWord,theWord)
      res.each do |i|
        if i==2
          print 'G'  
        else if i==1
          print 'Y'
        else
          print 'N'
        end
      end
      puts ''
    end
    res
  end
  
  
end
