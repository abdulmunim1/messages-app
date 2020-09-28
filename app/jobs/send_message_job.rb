class SendMessageJob < ApplicationJob
    queue_as :default

    def perform(message)
        theirs = ApplicationController.render(
            partial: 'messages/theirs',
            locals: { message: message }
        )

        mine = ApplicationController.render(
            partial: 'messages/mine',
            locals: { message: message }
        )
        ActionCable.server.broadcast 'chat_channel', theirs: theirs, mine: mine, message: message
    end
  end
  