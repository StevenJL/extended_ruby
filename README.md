# ExtendedRuby

Extensions of various Ruby classes. 
A growing project.


## Installation

Add this line to your application's Gemfile:

    gem 'extended_ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install extended_ruby

## Usage

#### ExtendedRuby::Array
Has all the functionality of your average `Array` but with a `uniq_wc` method (short for Unique with Callback).
This method makes your array unique based on criteria you define, but also takes a callback which it invokes
on the original object everytime a duplicate is found.

```
# instantiate an extended_ruby array
my_array = ExtendedRuby::Array.new([['a', 1], ['b', 4], ['b', 3], ['c', 5], ['d', 1], ['d', 2]])

# note it has all the functionality of any normal array
my_array.map {|x| "#{x[0]}#{x[1]}"} => ['a1', 'b4', 'b3', 'c5', 'd1', 'd2']
my_array.select {|x| x[1].even?} => [['b', 4], ['d', 2]]

# suppose you wanted to remove all duplicates in the array but also everytime you found a duplicate,
# you want to go back to the first one and concatenate it

my_criteria = Lambda { |array| array.first } # uniqueness is determined by the first element
my_callback = Lambda { |original, duplicate| original[2] = original[2] + duplicate[2] }
my_array.uniq_wc(:criteria => my_criteria, :callback => my_callback)

```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/extended_ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
