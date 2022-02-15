require 'greeting'

describe 'Greeting#ask_for_user_name' do
  before(:each) do
    # make a new instance for each test
    @greeting = Greeting.new

    # let rspec auto give an empty string when `gets` is called,
    # so that the tests won't wait for user input and get stuck
    allow(@greeting).to receive(:gets).and_return('')
  end

  it "prints 'Hello! What is your name? to the console'" do
    expected_msg = a_string_starting_with('Hello! What is your name?')
    expect { @greeting.ask_for_user_name }.to output(expected_msg).to_stdout
  end

  it 'ask for a user input from console' do
    # this test ensures the method `gets` was called at least once.
    expect(@greeting).to receive(:gets)
    @greeting.ask_for_user_name
  end

  it 'save the user input in @user_name' do
    test_name = 'Peter Parker'

    allow(@greeting).to receive(:gets).and_return(test_name)

    @greeting.ask_for_user_name
    expect(@greeting.user_name).to eql test_name
  end
end
