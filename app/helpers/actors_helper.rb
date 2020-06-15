module ActorsHelper
  def send_notification likeable
    recipient = Actor.find(@likeable.id).creator
    create_notification(recipient, "Actor")
  end

  def status_for(actor)
    if actor.published_at?
      if actor.published_at > Time.zone.now
        'Scheduled'
      else
        'Published'
      end
    else
      'Draft'
    end
  end

  def verbose_date(date)
    date.strftime('%B %d %Y') if !date.nil?
  end
end
