defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  import Exlivery.Factory

  setup do
    UserAgent.start_link(%{})

    :ok
  end

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      {:ok, cpf: "78945612300"}
    end

    test "when the user found, returns the user", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected =
        {:ok,
         %User{
           address: "Rua das Alamedas, 00",
           age: 24,
           cpf: cpf,
           email: "samuel@mail.com",
           name: "Samuel"
         }}

      assert response == expected
    end

    test "when the user not found, returns error" do
      response = UserAgent.get("00000000000")

      expected = {:error, "User not found"}

      assert response == expected
    end
  end
end
