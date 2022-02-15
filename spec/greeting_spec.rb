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

  test_names = ['Peter Parker', 'Eater Barker', 'Berry Porter']

  test_names.each do |name|
    it 'save the user input in @user_name' do
      allow(@greeting).to receive(:gets).and_return(name)

      @greeting.ask_for_user_name
      expect(@greeting.user_name).to eql name
    end
  end
end

describe 'Greeting#say_hello' do
  it 'when username is empty, greet user with "Hello, my friend!"' do
    greeting = Greeting.new
    expected_msg = "Hello, my friend!\n"
    expect { greeting.say_hello }.to output(expected_msg).to_stdout
  end

  it 'when username is not empty, greet user with their name' do
    greeting = Greeting.new
    greeting.user_name = 'Hairy Dotter'

    expected_msg = "Hello, Hairy Dotter!\n"
    expect { greeting.say_hello }.to output(expected_msg).to_stdout
  end
end
