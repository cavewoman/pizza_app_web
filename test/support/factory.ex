defmodule PizzaAppWeb.Factory do
  use ExMachina.Ecto, repo: AppPrototyp.Repo
  # Sample user factory
  # def user_factory do
  #   %User{
  #     name: "Test User 1",
  #     email: sequence(:email, &"testuser#{&1}@example.com"),
  #   }
  # end
end
