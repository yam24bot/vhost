module UsersHelper
  def avatar_for(user, option = {size: 80})
    size = option[:size]
    if user.avatar?
      image_tag user.avatar.url(:thumb), width: size, class: 'avatar-image'
    else
      image_tag "defaut_avatar.png", width: size, class: 'avatar-image'
    end
  end
end
