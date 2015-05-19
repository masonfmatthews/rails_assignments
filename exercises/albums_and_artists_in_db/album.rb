class Album
  def initialize(name, price=10, count=1)
    @name = name
    @price = price.to_f
    @count = count
  end

  def change_name(new_name)
    @name = new_name
  end

  def sell(amount=1)
    @count -= amount
  end

  def buy(amount=1)
    @count += amount
  end

  def price
    @price
  end

  def name
    @name
  end

  def count
    @count
  end

  def discount(percent)
    @price -= @price*percent/100.0
  end
end
