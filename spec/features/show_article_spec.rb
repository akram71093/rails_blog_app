require "rails_helper"


RSpec.feature "Showing an Article" do

  before do
    @article = Article.create(title: "This is a title", body: "This is a body")
  end


  scenario "A user shows an article" do
    visit "/"

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)

    expect(current_path).to eq(article_path(@article))
  end

end
