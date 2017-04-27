=begin
Build a method #bubble_sort that takes an array and returns a sorted array.
It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn't it?).

    > bubble_sort([4,3,78,2,0,2])
    => [0,2,2,3,4,78]
Now create a similar method called #bubble_sort_by which sorts an array but accepts a block. 
The block should take two arguments which represent the two elements currently being compared. 
Expect that the block's return will be similar to the spaceship operator you learned about 
before -- if the result of the block is negative, the element on the left is "smaller" than the element 
on the right. 0 means they are equal. A positive result means the left element is greater. Use this to sort 
your array.

    > bubble_sort_by(["hi","hello","hey"]) do |left,right|
    >   left.length - right.length
    > end
    => ["hi", "hey", "hello"]
=end

def bubble_sort(arr)
	n = arr.length
	loop do
		swapped = false
		(n-1).times do |arr_element|
			if arr[arr_element] > arr[arr_element + 1]
				arr[arr_element], arr[arr_element + 1] = arr[arr_element + 1], arr[arr_element]
				swapped = true
			end
		end
		break if !swapped
	end
	arr
end

puts bubble_sort([4,2,55,1,66,8,43,22,55,11,43,2,34])

def bubble_sort_by(arr)
	n = arr.length
	loop do 
		swapped = false
		(n-1).times do |x|
			if yield(arr[x], arr[x + 1]) > 0
				arr[x], arr[x + 1] = arr[x + 1], arr[x]
				swapped = true
			end
		end
		break if !swapped
	end
	arr
end

p bubble_sort_by(["hi","hello","hey", "heya", "howdy"]){ |left,right| left.length - right.length}