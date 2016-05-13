require "spec_helper"

describe "artists/index.html.erb", type: :view do
  let(:abs_path) { "#{Dir.pwd}/app/views" }
  let(:html) { File.read("#{abs_path}/artists/index.html.erb") }

  before(:each) do
    @artists = [
      Artist.create(name: "Taylor Swift"),
      Artist.create(name: "Kanye West")
    ]
  end

  after(:each) do
    @artists.each { |a| a.delete }
  end

  it "displays links to all artists" do
    rendered = ERB.new(html).result(binding)

    expect(rendered).to match(/Kanye West/)
    expect(rendered).to match(/Taylor Swift/)
  end
end
