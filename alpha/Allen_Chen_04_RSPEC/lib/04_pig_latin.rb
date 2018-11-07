def translate(string)
  new_string_arr = string.split.map do |word|
    #print "translating " + word + "\n"
    translate_word(word)
  end

  return new_string_arr.join(" ")
end


def translate_word(word)
  vowels="aeiou"
  capitalized = word[0] == word[0].upcase
  new_word=""
  # print word[0].downcase
  # puts
  #
  # print vowels.include?(word[0].downcase)
  # puts
  word.chars.each_with_index do |char, i|
    # print "char is " + char + ", i is " + i.to_s + "\n"
    if i==0 && vowels.include?(char.downcase)
      new_word = word + "ay"
      break;
    elsif char.downcase=="q" && word[i+1].downcase == "u"
      # print "q condition\n"
      # print "i = " + i.to_s + ", word = " + word + "\n"
      # print "word[i+2..-1] = " + word[i+2..-1] + "\n"
      # print "word[0..i+1] = " + word[0..i+1] + "\n"
      new_word = ( word[i+2..-1] + word[0..i+1] + "ay").downcase
      break;
    elsif i>0 && vowels.include?(char.downcase) #reached first vowel
      # print "reached first vowel\n"
      # print "i = " + i.to_s + ", word = " + word + "\n"
      # print "word[i..-1] = " + word[i..-1] + "\n"
      # print "word[0..i-1] = " + word[0..i-1] + "\n"
      new_word = ( word[i..-1] + word[0..i-1] + "ay").downcase
      break;
    end
  end
  if capitalized
    return new_word.capitalize
  else
    return new_word
  end
  # if vowels.include?(word[0].downcase)
  #   return word+"ay"
  # else
  #   return word
  # end
end
