# frozen_string_literal: true

require_relative "word_logic/version"

# module with logic
module WordLogic
  class Error < StandardError; end

  # Uses suboptimal file
  def pick_random_word
    File.readlines("words.txt").sample
  end

  # Requires optimization of the database
  def pick_random_word_by_l(length)
    File.readlines("words#{length}.txt").sample if File.exist?("words#{length}.txt")
  end

  # splits the main file into smaller files for each length
  def reload_database
    for i in (1..37)
      File.delete("words#{i}.txt") if File.exist?("words#{i}.txt")
    end
    File.foreach("words.txt") do |line|
      if File.exist?("words#{line.length - 2}.txt")
        File.write("words#{line.length - 2}.txt", line, mode: "a")
      else
        File.write("words#{line.length - 2}.txt", line)
      end
    end
  end

  def get_words(length); end

  def word_by_l?(compchars)
    res = false
    if File.exist?("words#{compchars.length}.txt")
      File.foreach("words#{compchars.length}.txt") do |line|
        res = true if compchars == line[0..-3]
      end
    end
    res
  end

  def word?(compchars)
    res = false
    File.foreach("words.txt") do |line|
      res = true if compchars == line[0..-3]
    end
    res
  end

  def compare_words(chars, compchars)
    compcharsres = compchars.clone
    res = check_green(chars, compcharsres)
    check_yellow(chars, compcharsres, res)
    res
  end

  def check_green(chars, compchars)
    res = Array.new(chars.length)
    for i in 0..chars.length - 1
      res[i] = 0
      res[i] = 2 if chars[i] == compchars[i]
    end
    res
  end

  def check_yellow(chars, compchars, res)
    for i in 0..chars.length - 1
      for j in 0..chars.length - 1
        if res[j].zero? && compchars[i] == chars[j]
          res[j] = 1
          break
        end
      end
    end
  end

  @@the_word = ""
  @@tries

  def set_word(word)
    @@the_word = word
    @@tries = word.length + 1
  end

  def set_random_word
    set_word(pick_random_word)
  end  

  def set_random_word_by_l(len)
    set_word(pick_random_word_by_l(len))
  end  

  def word
    @@the_word
  end

  def word_length
    @@the_word.length
  end

  def tries
    @@tries
  end

  def in_out(inword)
    res = compare_words(inword, @@the_word)
    if word_by_l?(inword) && inword.length == @@the_word.length
      @@tries -= 1
      win = true
      res.each do |i|
        case i
        when 2
          print "G"
        when 1
          print "Y"
          win = false
        else
          print "N"
          win = false
        end
      end
      puts " #{tries}"
    else
      puts "not a proper word"
    end
    
    if win
      puts "Congratulations, you win"
    elsif @@tries.zero?
      puts "Out of tries"
    end
    res
  end
end
