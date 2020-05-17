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
end
