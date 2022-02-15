require 'greeting'

describe 'Greeting#ask_for_user_name' do
  it "prints 'Hello! What is your name? to the console'" do
    greeting = Greeting.new
    expected_msg = a_string_starting_with('Hello! What is your name?')

    # let rspec auto give an empty string when `gets`` is called,
    # so that the test won't get stuck.
    allow(greeting).to receive(:gets).and_return('')

    expect { greeting.ask_for_user_name }.to output(expected_msg).to_stdout
  end

  it 'ask for a user input from console' do
    greeting = Greeting.new

    allow(greeting).to receive(:gets).and_return('')

    # use expect in this test to ensure `gets` was called at least once.
    expect(greeting).to receive(:gets)

    greeting.ask_for_user_name
  end

  it 'save the user input in @user_name' do
    greeting = Greeting.new
    test_name = 'Peter Parker'

    allow(greeting).to receive(:gets).and_return(test_name)

    greeting.ask_for_user_name
    expect(greeting.user_name).to eql test_name
  end
end
