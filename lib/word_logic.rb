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
    File.readlines("words#{length}.txt").sample
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
    File.foreach("words#{compchars.length}.txt") do |line|
      return true if compchars == line
    end
  end

  def word?(compchars)
    File.foreach("words.txt") do |line|
      return true if compchars == line
    end
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
end
