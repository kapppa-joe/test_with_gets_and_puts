class Greeting
  # a class that ask user to input their name, then greet them with the name
  # if no name was provided, will greet user with 'Hello, my friend!'

  # add this line to allow rspec to access @user_name
  attr_accessor :user_name

  def ask_name_and_greet_user
    ask_for_user_name
    say_hello
  end

  def ask_for_user_name
    puts 'Welcome! What is your name?'
    @user_name = gets.chomp
  end

  def say_hello
    if @user_name.nil? || @user_name.empty?
      puts 'Hello, my friend!'
    else
      puts "Hello, #{@user_name}!"
    end
  end
end
