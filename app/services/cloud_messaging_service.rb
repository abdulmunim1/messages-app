class CloudMessagingService
  require 'fcm'

  def send_notifications message
    fcm_client = FCM.new(ENV["FIREBASE_SERVER_KEY"])
    user=message.user
    options = { 
                    priority: 'high',
                    notification: { body: message.message,
                                    title: user.email,
                                    sound: 'default',
                    }
                }
    registration_ids = User.get_registration_tokens_except user 
    response = fcm_client.send(registration_ids, options)
    JSON.parse(response[:body])
  end
end