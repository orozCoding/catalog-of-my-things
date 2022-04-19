require './classes/game'

describe Game do
  it 'Test the proprities' do
    game = Game.new('2000-05-05', 5, '2012-05-05')
    expect(game).to be_an_instance_of Game
    expect(game.last_played_at).to be_a(DateTime)
    expect(game.publish_date).to be_a(DateTime)
    expect(game.multiplayer).to eq 5
  end

  it 'Test move_to_archived method: last_played_at is older than 2 years' do
    game = Game.new('2022-05-05', 5, '2012-01-01')
    game.move_to_archived
    expect(game.archived).to be false
  end

  it 'Test move_to_archived method: last_played_at is less than 2 years' do
    game = Game.new('2022-05-05', 5, '2022-01-01')
    game.move_to_archived
    expect(game.archived).to be false
  end

  it 'Test move_to_archived method: publish_date is less than 10 years' do
    game = Game.new('2020-05-05', 5, '2022-01-01')
    game.move_to_archived
    expect(game.archived).to be false
  end

  it 'Test move_to_archived method: publish_date is older than 10 years' do
    game = Game.new('2000-05-05', 5, '2012-01-01')
    game.move_to_archived
    expect(game.archived).to be true
  end
end
