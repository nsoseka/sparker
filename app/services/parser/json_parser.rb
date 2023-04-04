class Parser::JsonParser
  def initiliaze; end

  def self.underscore_key(k)
    if defined? Rails
      k.to_s.underscore.to_sym
    else
      self.to_snake_case(k.to_s).to_sym
    end
  end

  def self.to_snake_case(string)
    string.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end

  def self.convert_hash_keys(value)
    case value
      when Array
        value.map { |v| convert_hash_keys(v) }
      when Hash
        Hash[value.map { |k, v| [self.underscore_key(k), convert_hash_keys(v)] }]
      else
        value
    end
  end

  def self.remove_recursively(hash, *to_remove)
    hash.each do |key, val|
      hash.except!(*to_remove)

      remove_recursively(val, *to_remove) if val.is_a? Hash
      if val.is_a? Array
        val.each { |el| remove_recursively(el, *to_remove) if el.is_a? Hash }
      end
    end
  end
end