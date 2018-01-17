require "rails_helper"


RSpec.feature "Editing an article" do

  before do
    john = User.create(email: "john@example.com" , password: "password")
    login_as(john)
    @article = Article.create(title: "First Article", body: "Lorem Ipsum", user: john)
  end

  scenario "A user delete an article" do
    visit "/"
    click_link @article.title
    click_link "Delete Article"
    expect(page).to have_content("Article has been deleted")
    expect(page.current_path).to eq(articles_path)
  end

end
