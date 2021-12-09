defmodule Exlivery.Users.UserTest do
  alias Exlivery.Users.User

  use ExUnit.Case

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build("Rua das bananeiras", "Samuel", "samuel@mail.com", "123456789", 24)

      expected =
        {:ok,
         %Exlivery.Users.User{
           address: "Rua das bananeiras",
           age: 24,
           cpf: "123456789",
           email: "samuel@mail.com",
           name: "Samuel"
         }}

      assert response == expected
    end

    test "when there are invalid params, returns an error" do
      response = User.build("Rua das bananeiras", "Samuel", "samuel@mail.com", "123456789", 15)

      expected = {:error, "Invalid parameters"}

      assert response == expected
    end
  end
end
