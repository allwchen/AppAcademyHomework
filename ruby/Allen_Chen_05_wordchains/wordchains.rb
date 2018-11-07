class WordChainer
  def initialize(dictionary_file_name)
    @dictionary = Set.new()
    File.open(dictionary_file_name).each_line{ |line| @dictionary.add(line.chomp) }
    return true
  end

  def adjacent_words(word)
    @dictionary.select { |other_word| other_word.length == word.length}.
                select { |other_word| off_by_1_letter(word, other_word)}.to_a
  end

  def off_by_1_letter(word, other_word)
    count = 0
    word.chars.each_with_index do |ch, idx|
      count += 1 if ch != other_word[idx]
      return false if count > 1
    end
    count==1
  end
  # [19] pry(main)> off_by_1_letter("cat", "bat")
  # => true
  # [20] pry(main)> off_by_1_letter("cat", "cats")
  # => false
  # [21] pry(main)> off_by_1_letter("cat", "baf")
  # => false
  # [22] pry(main)> off_by_1_letter("cola", "cool")
  # => false

  def run(source, target)
    @current_words = [source]
    @all_seen_words = {source => nil}
    while @current_words.empty? == false
      # new_current_words = []
      # @current_words.each do |current_word|
      #   adj_words = adjacent_words(current_word)
      #   adj_words.each do |adj_word|
      #     next if @all_seen_words.include?(adj_word)
      #     new_current_words << adj_word
      #     @all_seen_words << adj_word
      #   end
      # end
      new_current_words = explore_current_words
      @current_words = new_current_words
      break if @current_words.include?(target)
    end
    build_path(target)
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adj_words = adjacent_words(current_word)
      adj_words.each do |adj_word|
        next if @all_seen_words.has_key?(adj_word)
        new_current_words << adj_word
        @all_seen_words[adj_word] = current_word
      end
    end
    # new_current_words.each do |word|
    #   print "#{word} <= #{@all_seen_words[word]}"
    #   puts
    # end
    return new_current_words
  end

  def build_path(target)
    path = [target]
    while target != nil
      prev_word = @all_seen_words[target]
      path << prev_word if prev_word != nil
      target = prev_word
    end
    return path.reverse
  end

end
