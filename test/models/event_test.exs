defmodule PizzaAppWeb.EventTest do
  use PizzaAppWeb.ModelCase

  alias PizzaAppWeb.Event

  @valid_attrs %{date: "some content", number_of_attendees: 42, number_of_pizzas_left: "120.5", number_of_pizzas_ordered: 42, number_of_rsvps: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
