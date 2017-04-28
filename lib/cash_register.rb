
class CashRegister

  attr_accessor :total, :discount, :title, :price, :quantity, :items, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    @title = title
    @price = price
    @quantity = quantity
    if !@quantity
      self.total += @price
    else
      self.total += (@price * @quantity)
    end
    quantity.times do
      @items << title
    end
    self.last_transaction = price * quantity
  end

  def apply_discount
    if self.discount != 0
      self.total = (@total * ((100.0 - discount.to_f)/100)).to_i
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = self.total - last_transaction
  end

end
