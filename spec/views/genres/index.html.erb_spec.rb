require "spec_helper"

describe "genres/index.html.erb", type: :view do
  let(:abs_path) { "#{Dir.pwd}/app/views" }
  let(:html) { File.read("#{abs_path}/genres/index.html.erb") }

  before(:each) do
    @genres = [
      Genre.create(name: "country"),
      Genre.create(name: "pop")
    ]
  end

  after(:each) do
    @genres.each { |a| a.delete }
  end

  it "displays links to all genres" do
    rendered = ERB.new(html).result(binding)

    expect(rendered).to match(/genres\/country.html/)
    expect(rendered).to match(/genres\/pop.html/)
    expect(rendered).to match(/country/)
    expect(rendered).to match(/pop/)
  end
end
