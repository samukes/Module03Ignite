defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params valid, saves user" do
      params = %{
        name: "Samuel",
        address: "Rua das Alamedas, 00",
        email: "samuel@mail.com",
        cpf: "78945612300",
        age: 24
      }

      response = CreateOrUpdate.call(params)

      expected = {:ok, "User create/updated successfully"}

      assert expected == response
    end

    test "when invalid params, returns error" do
      params = %{
        name: "Samuel",
        address: "Rua das Alamedas, 00",
        email: "samuel@mail.com",
        cpf: "78945612300",
        age: 10
      }

      response = CreateOrUpdate.call(params)

      expected = {:error, "Invalid parameters"}

      assert expected == response
    end
  end
end
