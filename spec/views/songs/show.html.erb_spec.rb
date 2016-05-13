require "spec_helper"

describe "songs/show.html.erb", type: :view do
  let(:abs_path) { "#{Dir.pwd}/app/views" }
  let(:html) { File.read("#{abs_path}/songs/show.html.erb") }

  before(:each) do
    @genre = Genre.create(name: 'genre')
    @artist = Artist.create(name: 'artist')

    @song = Song.create(name: "song_1", artist: @artist, genre: @genre)
  end

  after(:each) do
    @song.delete
    @artist.delete
    @genre.delete
  end

  it "displays the song info" do
    rendered = ERB.new(html).result(binding)

    expect(rendered).to match(/artist - song_1 - genre/)
  end
end
