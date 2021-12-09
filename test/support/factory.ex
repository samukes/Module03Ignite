defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Samuel",
      email: "samuel@mail.com",
      cpf: "12345678900",
      age: 24,
      address: "Rua das Alamedas, 00"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza de peperoni",
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua das Alamedas, 00",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("76.50"),
      user_cpf: "12345678900"
    }
  end
end
