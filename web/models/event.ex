defmodule PizzaAppWeb.Event do
  use PizzaAppWeb.Web, :model

  schema "events" do
    field :date, :string
    field :number_of_rsvps, :integer
    field :number_of_attendees, :integer
    field :number_of_pizzas_ordered, :integer
    field :number_of_pizzas_left, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:date, :number_of_rsvps, :number_of_attendees, :number_of_pizzas_ordered, :number_of_pizzas_left])
    |> validate_required([:date, :number_of_rsvps, :number_of_attendees, :number_of_pizzas_ordered, :number_of_pizzas_left])
  end
end
