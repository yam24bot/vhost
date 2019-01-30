module UsersHelper
  def avatar_for(user, option = {size: 100})
    size = option[:size]
    if user.avatar?
      image_tag user.avatar.url(:thumb), width: size, height:size, class: 'avatar-image'
    else
      cl_image_tag "Artboard_1.png" , width: size, height:size, class: 'avatar-image'
    end
  end

  def tags(user)
    @tags = user.all_tags.split(' ')
  end
end
