class Greeting
  attr_accessor :user_name # add this line to allow rspec to access @user_name

  def ask_for_user_name
    puts 'Hello! What is your name?'
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
