module GameModule
  def list_games
    if @games.empty?
      return puts '
      There are no games yet!
      '
    end

    @games.each_with_index do |game, index|
      puts "[#{index + 1}] - Author: #{game.author.first_name} #{game.author.last_name}.
      Publish date: #{game.publish_date}
      Multiplayer: #{game.multiplayer}. Last played date: #{game.last_played_at}"
    end
  end

  def game_input
    puts 'Enter Publish date: '
    publish_date = gets.chomp
    puts 'Enter last played date: '
    last_played_at = gets.chomp
    multiplayer = 'no'
    until [true, false].include?(multiplayer)
      puts 'Does this game has multiplayer? [yes / no]: '
      multiplayer = gets.chomp.downcase
      multiplayer = true if multiplayer == 'yes'
      multiplayer = false if multiplayer == 'no'
    end

    { publish_date: publish_date, last_played_at: last_played_at, multiplayer: multiplayer }
  end

  def add_game
    data = game_input

    game = Game.new(data[:publish_date], data[:last_played_at], multiplayer: data[:multiplayer])

    game.author = select_author

    @games << game

    puts '
    GAME SUCCESFULLY CREATED!
    '
  end
end
