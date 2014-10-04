require "pry"

module ExtendedRuby
  class Array < ::Array

    def blinclude?(target, &block)
      self.each do |item|
        return true if block[item] == target
      end
      false
    end

    def blindex(target, &block)
      self.each_with_index do |item, index| 
        return index if block[item] == target
      end
      nil
    end

    def bluniq(callback, &block)
      output = ExtendedRuby::Array.new([])

      self.each do |item|
        if index = output.blindex(block[item]) {|x| block[x]}
          original = output[index]
          output[index] = callback[original, item]
        else
          output << item
        end
      end
      output
    end
  end
end

