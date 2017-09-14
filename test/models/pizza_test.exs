defmodule PizzaAppWeb.PizzaTest do
  use PizzaAppWeb.ModelCase

  alias PizzaAppWeb.Pizza

  @valid_attrs %{name: "some content", price: 42, toppings: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pizza.changeset(%Pizza{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pizza.changeset(%Pizza{}, @invalid_attrs)
    refute changeset.valid?
  end
end
