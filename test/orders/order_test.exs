defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "when all params are valid, returns an order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ]

      response = Order.build(user, items)

      expected = {:ok, build(:order)}

      assert response == expected
    end

    test "when there is an invalid category, returns an error" do
      user = build(:user)

      items = []

      response = Order.build(user, items)

      expected = {:error, "Invalid parameters"}

      assert response == expected
    end
  end
end
