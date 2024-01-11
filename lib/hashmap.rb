class HashMap
  attr_accessor :capacity, :load_factor

  def initialize(capacity = 16, load_factor = 0.75)
    @capacity = capacity
    @load_factor = load_factor
    @length = 0
    @buckets = Array.new(capacity)
  end

  def hash(value)
    hash_code = 0
    hash_prime = 31

    value.each_char { |char| hash_code = (hash_code * hash_prime + char.ord) % @buckets.length }
    raise IndexError if hash_code.negative? || hash_code >= @buckets.length

    hash_code
  end

  def set(key, value)
    idx = hash(key)
    @buckets[idx] = [key, value]
    @length += 1
    resize if @length > @capacity * @load_factor
  end

  def resize
    new_capacity = @capacity * 2
    @buckets = Array.new(new_capacity)
  end

  def get(key)
    return nil if key.nil?

    key_value = hash(key)
    bucket = @buckets[key_value]
    
    return nil if bucket.nil?
    bucket[1]
  end

  def key?(key)
    return true if get(key)
    false
  end

  def remove(key)
    return nil if key.nil?

    key_value = hash(key)
    bucket = @buckets[key_value]

    return nil if bucket.nil?
    @buckets[key_value] = nil
    @length -= 1
  end

  def length
    @length
  end

  def clear
    @buckets = Array.new(capacity)
    @length = 0
  end

  def keys
    keys = []
    @buckets.each do |bucket|
      keys << bucket[0] if bucket != nil
    end
    keys.flatten
  end

  def values
    values = []
    @buckets.each do |bucket|
      values << bucket[1] if bucket != nil
    end
    values.flatten
  end

  def entries
    arr = []
    @buckets.each do |bucket|
      arr << bucket if bucket != nil
    end
    arr
  end
end
