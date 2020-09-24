class Message < ApplicationRecord
    after_create :send_message
    belongs_to :user
    def send_message
        CloudMessagingService.new.send_notifications self
    end
end
