require "spec_helper"

describe ExtendedRuby::Array do
  it "behaves like a normal array" do
    my_array = ExtendedRuby::Array.new([1,2,3,4])

    expect(my_array.map{|x| x+1}).to eq([2,3,4,5])
    expect(my_array.select{|x| x.even?}).to eq([2,4])
  end

  it "blinclude? method works" do
    my_array = ExtendedRuby::Array.new([['a','apple'],['b','banana'],['c','cat']])
    expect(my_array.blinclude?('banana') {|x| x[1] }).to be true
  end

  it "blindex method works" do
    my_array = ExtendedRuby::Array.new([['a','apple'],['b','banana'],['c','cat']])
    expect(my_array.blindex('banana') {|x| x[1] }).to eq(1) 
  end

  it "bluniq method works" do
    my_array = ExtendedRuby::Array.new([['a', 1], ['b', 4], ['b', 3], ['c', 5], ['d', 1], ['d', 2]])

    callback = lambda { |original, duplicate| [original.first, original[1] + duplicate[1]] }
    new_array = my_array.bluniq(callback) { |x| x[0] }
    expect(new_array).to eq([['a', 1], ['b', 7], ['c', 5], ['d', 3]])
  end
end
