module ApplicationHelper

  def upload_image(image, obj)
    @value = Cloudinary::Uploader.upload(image)
    obj.image = @value['url']
    obj.public_id = @value['public_id']
    obj.save
  end

  def update_image(image, obj)
    @value = Cloudinary::Uploader.upload(image)
    Cloudinary::Uploader.destroy(obj.public_id)
    obj.public_id = @value['public_id']
    obj.image = @value['url']
    obj.save
  end

  def destroy_image(id)
    Cloudinary::Uploader.destroy(id)
  end

  def format_date(date)
    date.strftime('%B %d %Y')
  end

  def create_notification(recipient, m_name)
    user = current_user
    likeable_id = @likeable.id
    notification = Notification.find_by(:recipient_id => recipient.id, :user_id => user.id, :m_id => likeable_id, m_name: m_name)
    if notification.nil?
      Notification.create(recipient: recipient, user: user, action: "liked", notifiable: recipient, m_name: m_name, m_id: likeable_id )
    else
      notification.save
    end
  end

  def linked_users(body)
    body.gsub /@([\w]+)/ do |match|
      link_to match, user_path($1)
    end.html_safe
  end
end
