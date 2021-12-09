defmodule Exlivery.Factory do
  use ExMachina

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
end
