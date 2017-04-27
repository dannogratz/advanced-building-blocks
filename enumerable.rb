=begin
	reate a script file to house your methods and run it in IRB to test them later.
Add your new methods onto the existing Enumerable module. Ruby makes this easy for you because any class or module can be added to without trouble ... just do something like:

    module Enumerable
      def my_each
        # your code here
      end
    end
Create #my_each, a method that is identical to #each but (obviously) does not use #each. You'll need to remember the yield statement. Make sure it returns the same thing as #each as well.

Create #my_each_with_index in the same way.

Create #my_select in the same way, though you may use #my_each in your definition (but not #each).

Create #my_all? (continue as above)

Create #my_any?

Create #my_none?

Create #my_count

Create #my_map

Create #my_inject

Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40

Modify your #my_map method to take a proc instead.

Modify your #my_map method to take either a proc or a block. It won't be necessary to apply both a proc and a block in the same #my_map call since you could get the same effect by chaining together one #my_map call with the block and one with the proc. This approach is also clearer, since the user doesn't have to remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.

Quick Tips:

Remember yield and the #call method.


=end


module Enumerable
	def my_each
		i = 0
		len = self.length
		while i < len 
			yield(self[i])
			i += 1
		end
		self
	end

	def my_each_with_index
		i = 0
		len = self.length
		if block_given?
			while i < len
				yield(self[i], i)
				i += 1
			end
		end
		self
	end

	def my_select
		filtered = []
		if block_given?
			self.my_each do |n|
				filtered << n if yield(n)
			end
		end
		filtered
	end

	def my_all
		all = false
		if block_given?
			self.my_each do |n|
				all = true if yield(n)
			end
		end
		all
	end

	def my_any
		any = false
		if block_given?
			self.my_each do |n|
				any = true if yield(n)
			end
		end
		any
	end

	def my_none
		none = false
		if block_given?
			self.my_each do |n|
				none = true if yield(n)
			end
		end
		none
	end

	def my_count
		count = 0
		self.my_each do |n|
			count += 1 if yield(n)
		end
		count
	end

	def my_inject(initial)
		result = initial
		if block_given?
			self.my_each do |n|
				result = yield(result, n)
			end
		end
		result
	end

	def my_map(&my_proc)
		mapped = []
		if block_given?
			self.my_each do |n|
				mapped << (my_proc != nil ? my_proc.call(n) : yield(n))
			end
		end
		mapped
	end


	def multiply_els(els)
		els.my_inject(1){|product, i| product * i}
	end



end