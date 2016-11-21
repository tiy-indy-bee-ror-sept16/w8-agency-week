require 'test_helper'

class LineItemQuantityTest < ActionDispatch::IntegrationTest

  def test_too_many_ordered
    cart = Cart.create!
    size = Size.create!(
      abbr: "S",
      in_stock: 5,
      sock: Sock.new(
        price: 500,
        color: Color.new(name: "grey"),
        style: Style.new(name: "hey"),
        category: Category.new(name: "wha")
      )
    )

    post add_to_cart_path,
      params: {
        size_id: size.id,
        token: cart.token,
        num_ordered: 10
      }
    assert_equal 422, status
    data = JSON.parse(response.body)
    assert data.include?("We do not have that much in stock"), data.inspect
  end

end
