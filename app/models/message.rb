class Message < ApplicationRecord
    validates_presence_of :message,:user
    after_create :send_message
    belongs_to :user
    def send_message
        registration_ids = User.get_registration_tokens_except user 
        registration_ids.present? && CloudMessagingService.new.send_notifications(self, registration_ids)
    end
end
