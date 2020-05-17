module FilmsHelper
  def send_notification likeable
    recipient = Film.find(@likeable.id).creator
    create_notification(recipient, "Film")
  end
end
