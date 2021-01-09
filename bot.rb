require 'telegram_bot'
token = open(".auth_token").read()
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
      reply.text = "Assalomu aleykum #{message.from.first_name}! 🤖 Sizga qanday yordam berishimiz mumkin? :)"
    else
      reply.text = "Siz bilan yaqin oralarda bog'lanamiz :)"
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end