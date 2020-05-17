module ActorsHelper
  def send_notification likeable
    recipient = Actor.find(@likeable.id).creator
    create_notification(recipient, "Actor")
  end
end
