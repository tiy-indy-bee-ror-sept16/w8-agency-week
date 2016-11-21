class LineItem < ApplicationRecord
  belongs_to :size
  belongs_to :cart
  has_one :sock, through: :size
  before_save :change_stock, on: [:create, :update]

  validate :not_ordering_too_damn_much


protected

  def not_ordering_too_damn_much
    if quantity_change > size.in_stock
      errors.add(:base, "We do not have that much in stock")
    end
  end

  def change_stock
    size.update(in_stock: size.in_stock - quantity_change)
  end

  def quantity_change
    if num_ordered_changed?
      num_ordered_change[1] - num_ordered_change[0]
    else
      0
    end
  end

end
