class DictionaryTree
  attr_reader :root, :depth, :num_letters, :num_words

  def initialize(dictionary=nil)
    @root = LetterNode.new(nil,nil,[],nil,nil)
    @depth = 0
    @num_letters = 0
    @num_words = 0

    if dictionary
      dictionary.each do |word,definition|
        insert_word(word,definition)
      end
    end
  end

  def insert_word(word,definition)
    current_node = @root
    current_depth = 0
    word.each_char do |c|
      letter = current_node.children.index{ |item| item.letter = c }
      if letter
        current_node = current_node.children[letter]
        current_depth += 1
      else
        new_node = LetterNode.new(c,nil,[],current_node,current_depth+1)
        current_node.children << new_node
        current_node = new_node
        current_depth += 1
        @num_letters += 1
        if current_depth > @depth
          @depth = current_depth
        end
      end
    end
    current_node.definition = definition
    @num_words += 1
  end

  def definition_of(word)
    current_node = @root
    word.each_char do |c|
      if current_node.children.any? { |child| child.letter == c}
        current_node.children.each do |node|
          if node.letter == c
            current_node = node
          end
        end
      else
        return nil
      end
    end
    current_node.definition
  end

  def remove_word(word)
    current_node = @root
    word.each_char do |c|
      if current_node.children.any? { |child| child.letter == c}
        current_node.children.each do |node|
          if node.letter == c
            current_node = node
          end
        end
      else
        return nil
      end
    end
    current_node.definition = nil
    @num_words -= 1
    if current_node.children == nil
      @num_letters -= 1
    end
  end
end
