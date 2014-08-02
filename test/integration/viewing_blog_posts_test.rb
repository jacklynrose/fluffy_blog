require "test_helper"

class ViewingBlogPostsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def test_viewing_the_list_of_posts
    posts = []
    (1..3).each do |n|
      posts << Post.create(
        title: "Hello World ##{n}"
      )
    end

    visit '/'

    assert page.has_content?("Hello World #1"), "Content \"Hello World #1\" not found"
    assert page.has_content?("Hello World #2"), "Content \"Hello World #2\" not found"
    assert page.has_content?("Hello World #3"), "Content \"Hello World #3\" not found"
  end

  def test_viewing_a_single_post
    post = Post.create(title: "Hello World #1", body: "Welcome to my world!", author_name: "Jack Watson-Hamblin")

    visit '/'
    click_link "Hello World #1"

    assert page.has_content?("Hello World #1"), "Title not found on the page"
    assert page.has_content?("Welcome to my world!"), "Body not found on the page"
    assert page.has_content?("Jack Watson-Hamblin"), "Author's name not found on the page"
  end
end
