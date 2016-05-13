require "spec_helper"

describe "songs/index.html.erb", type: :view do
  let(:abs_path) { "#{Dir.pwd}/app/views" }
  let(:html) { File.read("#{abs_path}/songs/index.html.erb") }

  before(:each) do
    @genre = Genre.create(name: 'genre')
    @artist = Artist.create(name: 'artist')

    @songs = [
      Song.create(name: "song_1", artist: @artist, genre: @genre),
      Song.create(name: "song_2", artist: @artist, genre: @genre)
    ]
  end

  after(:each) do
    @songs.each { |a| a.delete }
    @artist.delete
    @genre.delete
  end

  it "displays links to all songs" do
    rendered = ERB.new(html).result(binding)

    expect(rendered).to match(/artist - song_1 - genre/)
    expect(rendered).to match(/artist - song_2 - genre/)
  end
end
