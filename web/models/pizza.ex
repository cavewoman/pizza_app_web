defmodule PizzaAppWeb.Pizza do
  use PizzaAppWeb.Web, :model

  schema "pizzas" do
    field :name, :string
    field :type, :string
    field :price, :integer
    field :toppings, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :type, :price, :toppings])
    |> validate_required([:name, :type, :price, :toppings])
  end
end
