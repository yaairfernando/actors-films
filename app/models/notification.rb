class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, class_name: "User"
  belongs_to :notifiable, polymorphic: true

  after_commit ->{
    if self.m_name == 'Film'
      film = Film.find(self.m_id)
      NotificationRelayJob.perform_later(self, "your film", film)
    end

    if self.m_name == 'Actor'
      actor = Actor.find(self.m_id)
      NotificationRelayJob.perform_later(self, "this actor", actor)
    end
  }
end
