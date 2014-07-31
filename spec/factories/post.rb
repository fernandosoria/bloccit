FactoryGirl.define do
  factory :post do
    title "Post Title"
    body "Post bodies must be pretty long."

    after(:build) do |post|
      post.class.skip_callback(:create, :after, :create_vote)
    end

    factory :post_with_user do
      after(:create) do |post|
        post.send(:create_vote)
      end
    end
  end
end