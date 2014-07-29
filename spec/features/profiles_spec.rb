require 'rails_helper'

describe "Visiting profiles" do

  include TestFactories

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = authenticated_user(role: 'admin')
    login_as(@user, :scope => :user)
    @topic = Topic.create(description: "A topic")
    @post = post_without_user(user: @user, topic: @topic)
    @comment = comment_without_email(user: @user)
  end

  describe "not signed in" do
    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)
    end
  end
end