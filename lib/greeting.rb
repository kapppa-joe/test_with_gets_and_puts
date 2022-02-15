class Greeting
  attr_accessor :user_name

  def ask_for_user_name
    puts 'Hello! What is your name?'
    @user_name = gets.chomp
  end
end
