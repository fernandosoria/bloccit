class FavoriteMailer < ActionMailer::Base
  default from: "no-reply@example.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@fernandosoria-bloccit.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@fernandosoria-bloccit.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@fernandosoria-bloccit.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
