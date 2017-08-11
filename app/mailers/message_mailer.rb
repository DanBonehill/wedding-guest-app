class MessageMailer < ApplicationMailer
  def message_received(message)
    @message = message
    @url = "http://danbethwedding.com/messages/#{@message.id}"
    mail(to: "danbonehill@me.com", subject: "#{@message.name} has sent a message")
  end
end
