defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  alias Exlivery.Orders.Agent, as: OrderAgent

  import Exlivery.Factory

  setup do
    OrderAgent.start_link(%{})

    :ok
  end

  describe "save/1" do
    test "saves the order" do
      order = build(:order)

      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get/1" do
    test "when the order found, returns the order" do
      order = build(:order)
      {:ok, uuid} = OrderAgent.save(order)

      response = OrderAgent.get(uuid)

      expected = {:ok, order}

      assert response == expected
    end

    test "when the order not found, returns error" do
      response = OrderAgent.get("00000000000")

      expected = {:error, "Order not found"}

      assert response == expected
    end
  end
end
