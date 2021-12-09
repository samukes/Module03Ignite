defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, returns an item" do
      response = Item.build("Pizza de peperoni", :pizza, "35.5", 1)

      expected = {:ok, build(:item)}

      assert response == expected
    end

    test "when there is an invalid category, returns an error" do
      response = Item.build("Pizza de peperoni", :banana, "35.5", 1)

      expected = {:error, "Invalid parameters"}

      assert response == expected
    end

    test "when there is an invalid price, returns an error" do
      response = Item.build("Pizza de peperoni", :pizza, "banana_price", 1)

      expected = {:error, "Invalid parameters"}

      assert response == expected
    end

    test "when there is an invalid quantity, returns an error" do
      response = Item.build("Pizza de peperoni", :pizza, "35.5", 0)

      expected = {:error, "Invalid parameters"}

      assert response == expected
    end
  end
end
