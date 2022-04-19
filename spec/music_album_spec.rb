require './classes/music_album'
require 'date'

describe MusicAlbum do
  context 'when Instantiated' do
    before(:each) do
      @music_album = MusicAlbum.new('2010-06-23')
    end

    it 'Create instance of music album class' do
      expect(@music_album.instance_of?(MusicAlbum)).to be(true)
    end

    it 'If instance of MusicAlbum is type of Item' do
      expect(@music_album.instance_of?(MusicAlbum)).to be(true)
    end

    it 'If instance of MusicAlbum with date' do
      instance_property = @music_album.publish_date
      expect(instance_property).to eq('2010-06-23')
    end

    it 'instance of on spotify property' do
      instance_property = @music_album.on_spotify
      expect(instance_property).to eq(true)
    end
  end
end
