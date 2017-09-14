defmodule PizzaAppWeb.Repo.Migrations.CreatePizza do
  use Ecto.Migration

  def change do
    create table(:pizzas) do
      add :name, :string
      add :type, :string
      add :price, :integer
      add :toppings, :string

      timestamps()
    end

  end
end
