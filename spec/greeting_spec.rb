require 'greeting'

describe "Greeting#ask_for_user_name" do
  it "prints 'Hello! What is your name? to the console'" do
    greeting = Greeting.new
    expected_msg = 'Hello! What is your name?'
    expect { greeting.ask }.to output(expected_msg).to_stdout
  end
end
