require "test_helper"

class ManagingPostsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def test_creating_a_post
    visit '/'
    click_link 'Add Post'

    fill_in 'Title', with: 'Hello World'
    fill_in 'Body', with: 'Welcome to my world!'
    fill_in 'Author Name', with: 'Jack Watson-Hamblin'
    click_button 'Create Post'

    assert page.has_content?('Hello World')
    assert page.has_content?('Welcome to my world!')
    assert page.has_content?('Jack Watson-Hamblin')
  end

  def test_deleting_a_post
    Post.destroy_all
    post = Post.create(title: "Hello World")
    visit '/'
    click_link "Hello World"

    click_link "Destroy"

    refute page.has_content?("Hello World"), "The post is still there"
    assert page.has_content?("Post was successfully destroyed"), "No flash message"
  end
end
