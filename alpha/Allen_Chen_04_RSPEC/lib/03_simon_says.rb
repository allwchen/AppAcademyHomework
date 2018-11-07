def echo (word)
  return word
end

def shout(word)
  return word.upcase
end

def repeat(word, n=2)
  answer = ""
  while n>1
    answer << word + " "
    n-=1
  end
  return answer + word
end

def start_of_word(word, n=1)
  return word[0,n]
end

def first_word(string)
  string.split[0].to_s
end

def titleize(str)
  little_words = ["of", "the", "over", "a", "and"]
  str.split.map.with_index do |word, i|
    if word.length>4 || i==0 || !little_words.include?(word)
      word.capitalize
    else
      word
    end
  end.join(" ")
end
