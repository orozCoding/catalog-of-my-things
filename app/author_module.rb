module AuthorModule
  def create_author
    puts 'Enter author\'s first name: '
    name = gets.chomp.to_s.capitalize
    puts 'Enter author\'s last name: '
    last_name = gets.chomp.to_s.capitalize
    author = Author.new(name, last_name)
    @authors << author
    persist_data(@authors, './data/authors')
    author
  end

  def list_authors
    unless @authors.empty?
      puts ''
      return @authors.each_with_index do |author, i|
        puts "[#{i + 1}] - #{author.first_name} #{author.last_name}"
      end
    end

    puts '
    There are no authors yet!
    '
  end

  def select_author
    unless @authors.empty?
      number = -1
      list_authors
      puts "[#{@authors.length + 1}] - Create new author"
      until number.positive? && number <= @authors.length + 1
        puts 'Select one author from the list above:'
        number = gets.chomp.to_i
      end
      return @authors[number.to_i - 1] if number <= @authors.length
    end

    create_author
  end
end
