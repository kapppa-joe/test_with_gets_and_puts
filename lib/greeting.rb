class Greeting
  attr_reader :user_name # add this line to allow rspec to read @user_name

  def ask_for_user_name
    puts 'Hello! What is your name?'
    @user_name = gets.chomp
  end

  def say_hello
    puts 'Hello, my friend!'
  end
end
