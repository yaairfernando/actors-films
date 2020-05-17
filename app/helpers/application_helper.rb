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

  def create_notification likeable
    if @likeable.is_a?(Film)
      recipient = Film.find(@likeable.id).creator
      user = current_user
      film_id = @likeable.id
      notification = Notification.find_by(:recipient_id => recipient.id, :user_id => user.id, :m_id => film_id)
      if notification.nil?
        Notification.create(recipient: recipient, user: user, action: "liked", notifiable: recipient, m_name: "Film", m_id: film_id )
      else
        notification.save
      end
    end

    if @likeable.is_a?(Actor)
      recipient = Actor.find(@likeable.id).creator
      user = current_user
      actor_id = @likeable.id
      notification = Notification.find_by(:recipient_id => recipient.id, :user_id => user.id, :m_id => actor_id)
      if notification.nil?
        Notification.create(recipient: recipient, user: user, action: "liked", notifiable: recipient, m_name: "Actor", m_id: actor_id )
      else
        notification.save
      end
    end
  end
end
