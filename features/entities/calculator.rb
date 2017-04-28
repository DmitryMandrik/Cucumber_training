class Calculator

  attr_accessor :a, :b, :summary, :mult

  # def initialize(a, b)
  #   @a, @b = a, b
  # end

  def sum
    @summary = @a + @b
  end

  def multiply
    @mult = @a * @b
  end

end