# Writing tests with `gets` and `puts` in rspec

## What's in this repo
I have trial & error for a bit, and figured out a way to test `gets` and `puts` without using StringIO / dependency injection, or overwriting global var $stdin.
Here I summarize my findings with some sample code.

(Basically it's just the way that Clare introduced to us in [her wiki page](#reference))

## How to run this repo

(to have a try on the user interaction)
```shell
ruby lib/greeting.rb
```

(to run the test)
```shell
bundle exec rspec
```


## To test `gets` (getting user input from console)
1. Assume you have a class `Greeting`, in which you calls `gets` in method #ask_for_user_name

2. In spec code, make an instance of Greeting.
   Then, use `expect ... to receive(:gets) ... and_return('a_string') ...` to let rspec mock the user input.
   After that, calls the method that use `gets`.

e.g.
```ruby
greeting = Greeting.new
expect(greeting).to receive(:gets).and_return('a name')
greeting.ask_for_user_name
```

3. If we replace `expect` with `allow` in above, rspec will still mock the user input, but the test can pass even if `gets` was not called.


## To test `puts`
1. Assume you have a class, in which you calls `puts` in some method 

2. In spec code, make an instance of your class.
   Then, use `expect { instance.method_call }.to output('some_string').to_stdout` to make rspec check that method_call does print out some_string to the console.

e.g. 
```ruby
greeting = Greeting.new
expected_msg = "Hello, my friend!\n"
expect { greeting.say_hello }.to output(expected_msg).to_stdout
```

3. Note that rspec normally will try to compare strictly with "\n" (linebreaks).
  It might helps to put some rspec matcher a_string_starting_with, a_string_matching etc. around your string so that your test can have some flexibility.


## Environment
The code in this repo was confirmed to run as expected on a machine with below config:

* MacOS ver 12.1
* ruby ver 2.6.9 (installed via rbenv)
* bundler ver 2.3.6


## Reference
Clare's wiki:
https://clare-wiki.herokuapp.com/pages/coding/lang/oo/ruby/Ruby#testing-command-line-inputs-and-outputs-stdin-stdout-stderr

Related parts from rspec doc
https://www.rubydoc.info/gems/rspec-expectations/RSpec%2FMatchers:output
https://relishapp.com/rspec/rspec-mocks/v/3-10/docs/basics/allowing-messages

