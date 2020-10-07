=begin
Codewars. 22/07/20. 'Split hash by key(s)'. 5kyu. We are given a hash and a set of keys in the form of strings or symbols separated by
commas. Our goal is to create a function which splits the hash at the given keys and returns an array of hashes. For example,
split_hash_by_key({:a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6}, :b, :f) returns [{:a=>1}, {:b=>2, :c=>3, :d=>4, :e=>5}, {:f=>6}]. If one of
the given keys is not included in the hash, we must raise an error. Here is the solution I developed to solve the challenge.
1) We define our method split_hash_by_keys, which takes a hash and any number of keys as its arguments.
2) First we handle our error checking, we raise an exception if any of the keys provided are not included in the hash by calling the any?
   method and checking if any key produces a nil value in our hash.
3) We then initialize an empty array where we will store our hashes.
4) We then initialize an empty hash called sub_hash, our key-value pairs will be stored in here.
5) We call each_pair on the hash, which essentially allows us to iterate over the hash, passing the key and value as block parameters.
6) Inside our each_pair loop, if the key in the hash is not included in args, we simply add that key-value pair to sub_hash.
7) If is key is included in args, we first push sub_hash with its contents into arr, unless sub_hash is empty, this avoids pushing an
   empty hash into arr when the one of the keys in args is the first key in the hash. After we've pushed sub_hash into arr, we then set
   sub_hash equal to an empty hash again, then we place in the current key-value pair.
8) Once our loop finishes, sub_hash will still have contents because pushes are only performed when we encounter one of our args, so once
   we've pushed due to all the args, key-value pairs will still be pushed into sub_hash but sub_hash won't be pushed into array. Thus
   we return the arr with the last sub_hash pushed into it.
=end

def split_hash_by_key_ms(hash, *args)
  raise 'Exception' if args.any? {|k| !hash[k]}

  arr = []
  sub_hash = {}

  hash.each_pair do |k,v|
    if !args.include?(k)
      sub_hash[k] = v
    elsif args.include?(k)
      arr.push(sub_hash) unless sub_hash.empty?
      sub_hash = {}
      sub_hash[k] = v
    end
  end
  
  arr.push(sub_hash)
end


=begin
Here is a much shorter solution.
1) We raise an exception unless keys - hash.keys is empty. Keys is an array and hash.keys turns all the keys of the hash into an array of
   keys. keys - hash.keys will delete the keys in keys that are in hash.keys, so if this action doesn't produce an empty array, that means
   we one of our keys is not included in the hash, in which case an exception must be raised.
2) We then call the enumerable method slice_before on the hash, which produces an enumerator where the object is split before the
   pattern that returns true in the given block, in our case that keys includes the current key in the hash.
3) The product of slice_before could be turned into an array of arrays e.g. [[[:a, 1], [:b, 2]], [[:c, 3], [:d, 4]], [[:e, 5], [:f, 6]]].
4) We simply map over the enumerator and convert each slice to a hash.
=end

def split_hash_by_key(hash, *keys)
  raise 'Invalid Key' unless (keys - hash.keys).empty?
  hash.slice_before {|k,v| keys.include?(k)}.map(&:to_h)
end