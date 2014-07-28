require 'rails_helper'

describe User do

  include TestFactories

  describe "#favorited(post)" do

    before do
      @topic = Topic.create(name: 'This is my topic title', description: 'This is my topics body text and some more words.')
      @post = post_without_user(topic: @topic)
      @post2 = post_without_user(topic: @topic)
      @user = authenticated_user

      #create post with favorite
      @favorite = @user.favorites.create(post: @post)
    end

    it "returns `nil` if user has not favorited the post" do
      expect(@user.favorited(@post2)).to eq(nil)
    end

    it "returns the appropriate favorite if it exists" do
      expect(@user.favorited(@post)).to eq(@favorite)
    end
  end
end