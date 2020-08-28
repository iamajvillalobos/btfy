class GetGravatarLinkAction
  extend LightService::Action

  expects :email
  promises :image_src

  executed do |ctx|
    email_hash = Digest::MD5.hexdigest(ctx.email)
    ctx.image_src = "https://www.gravatar.com/avatar/#{email_hash}"
  end
end