#### Status
[![Build Status](https://travis-ci.org/StevenJL/extended_ruby.svg?branch=master)](https://travis-ci.org/StevenJL/extended_ruby)
[![Code Climate](https://codeclimate.com/github/StevenJL/extended_ruby/badges/gpa.svg)](https://codeclimate.com/github/StevenJL/extended_ruby)

# ExtendedRuby

Extensions of various Ruby classes. The added functionality may seem really specific, but I put it in this gem because:

a) I needed this exact functionality to clean up some other code at the time. 

b) I can see this functionality being re-used again.

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
Has all the functionality of a normal Ruby `Array` but with additional methods.

```ruby
# first require it
require 'extended_ruby/array'

# instantiate an extended_ruby array
my_array = ExtendedRuby::Array.new([1, 2, 3, 4])

# note it has all the functionality of any normal array
my_array.map {|x| x+1  } => [2, 3, 4, 5]
my_array.select {|x| x.even?} => [2, 4]
```

##### #blinclude?
Like `#include` but takes a block which is applied to array element before comparing with argument.
```ruby
# Is there an array here whose sum is a multiple of 3? Find out with blinclude?
[[1,0,9], [3,3,5,-2], [1,1,1,1]].blinclude?(0) do |x|
  x.inject(:+) % 3  
end
=> true
```

##### #blindex
```ruby
# Finds index of first item in array whose equal to the target when given block is applied to the item
[['a','apple'],['b','banana'],['c','cat']].blindex('banana') do |x|
  x[1]
end
=> 0
```

##### #bluniq
Short for block uniq, this method makes your array unique based on criteria you define, but also takes a callback which it invokes
on the original object everytime a duplicate is found.

```ruby
my_array = ExtendedRuby::Array.new([['a', 1], ['b', 4], ['b', 3], ['c', 5], ['d', 1], ['d', 2]])
```
Suppose you wanted to remove all duplicates in the array (where duplicate is defined by the first element) but you also want to go back to the first original elment and sum the numbers up.

```ruby
# callback will always take two arguments, the original and a new found duplicate
my_callback = lambda do |original, duplicate| 
  [original.first, original.second + duplicate.second]
end 

my_array.bluniq(my_callback) { |x| x[0] }
=> [['a', 1], ['b', 7], ['c', 5], ['d', 3]])
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/extended_ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
