require "spec_helper"

describe "genres/show.html.erb", type: :view do
  let(:abs_path) { "#{Dir.pwd}/app/views" }
  let(:html) { File.read("#{abs_path}/genres/show.html.erb") }

  before(:each) do
    @genre = Genre.create(name: "Country")
    @artists = [
      Artist.create(name: "Taylor Swift"),
      Artist.create(name: "Hank Williams")
    ]
    @songs = [
      Song.create(name: "Our Song", genre: @genre, artist: @artists[0]),
      Song.create(name: "I Saw the Light", genre: @genre, artist: @artists[1])
    ]
  end

  after(:each) do
    @songs.each { |s| s.delete }
    @artists.each { |a| a.delete }
    @genre.delete
  end

  let(:rendered) { ERB.new(html).result(binding) }

  it "displays the genre's name" do
    expect(rendered).to match(/Country/)
  end

  it "displays the genre's artists" do
    expect(rendered).to match(/Taylor Swift/)
    expect(rendered).to match(/Hank Williams/)
    expect(rendered).to match(/artists\/taylor-swift\.html/)
    expect(rendered).to match(/artists\/hank-williams\.html/)
  end

  it "displays the genre's songs" do
    expect(rendered).to match(/songs\/i-saw-the-light\.html/)
    expect(rendered).to match(/songs\/our-song\.html/)
    expect(rendered).to match(/Hank Williams - I Saw the Light - Country/)
    expect(rendered).to match(/Taylor Swift - Our Song - Country/)
  end
end
