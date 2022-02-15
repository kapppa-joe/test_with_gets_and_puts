class Greeting
  attr_reader :user_name # add this line to allow rspec to read @user_name

  def ask_for_user_name
    puts 'Hello! What is your name?'
    gets
    @user_name = gets.chomp
  end
end
