class Hash
  def to_symbols_and_strings!
    keys.each do |key|
      self[(key.to_sym rescue key) || key] = delete(key).to_s
    end
    self
  end
end