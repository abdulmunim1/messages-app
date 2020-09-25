class CloudMessagingService
  require 'fcm'

  def send_notifications message,registration_ids
    fcm_client = FCM.new(ENV["FIREBASE_SERVER_KEY"])
    user=message.user
    options = { 
                    priority: 'high',
                    notification: { body: message.message,
                                    title: user.email,
                                    sound: 'default',
                    }
                }
    response = fcm_client.send(registration_ids, options)
    JSON.parse(response[:body])
  end
end