defmodule PizzaAppWeb.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :date, :string
      add :number_of_rsvps, :integer
      add :number_of_attendees, :integer
      add :number_of_pizzas_ordered, :integer
      add :number_of_pizzas_left, :float

      timestamps()
    end

  end
end
