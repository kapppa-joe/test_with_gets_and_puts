require 'greeting'

describe 'Greeting#ask_for_user_name' do
  it "prints 'Hello! What is your name? to the console'" do
    greeting = Greeting.new
    expected_msg = "Hello! What is your name?\n"

    expect { greeting.ask_for_user_name }.to output(expected_msg).to_stdout
  end

  it 'ask for a user input from console' do
    greeting = Greeting.new
    expect(greeting).to receive(:gets)
  end
end
