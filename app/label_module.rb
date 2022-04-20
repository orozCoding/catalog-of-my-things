module LabelModule
  def create_label
    puts 'Enter label\'s title: '
    title = gets.chomp.to_s.capitalize
    puts 'Enter label\'s color: '
    color = gets.chomp.to_s.capitalize
    label = Label.new(title, color)
    @labels << label
    label
  end

  def list_labels
    unless @labels.empty?
      puts ''
      return @labels.each_with_index do |label, i|
        puts "[#{i + 1}] - Title: #{label.title}, Color: #{label.color}"
      end
    end

    puts '
    There are no labels yet!
    '
  end

  def select_label
    unless @labels.empty?
      number = -1
      list_labels
      puts "[#{@labels.length + 1}] - Create new label"
      until number.positive? && number <= @labels.length + 1
        puts 'Select one label from the list above:'
        number = gets.chomp.to_i
      end
      return @labels[number.to_i - 1] if number <= @labels.length
    end

    create_label
  end
end
