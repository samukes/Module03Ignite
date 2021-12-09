defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build("Rua das Alamedas, 00", "Samuel", "samuel@mail.com", "12345678900", 24)

      expected = {:ok, build(:user)}

      assert response == expected
    end

    test "when there are invalid params, returns an error" do
      response = User.build("Rua das bananeiras", "Samuel", "samuel@mail.com", "123456789", 15)

      expected = {:error, "Invalid parameters"}

      assert response == expected
    end
  end
end
