defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "creates report file" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      expected =
        "12345678900, pizza, 1, 35.5japonesa, 2, 20.50, 76.50\n" <>
          "12345678900, pizza, 1, 35.5japonesa, 2, 20.50, 76.50\n"

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      assert response == expected
    end
  end
end
