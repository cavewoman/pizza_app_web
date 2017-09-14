defmodule PizzaAppWeb.PizzaControllerTest do
  use PizzaAppWeb.ConnCase

  alias PizzaAppWeb.Pizza
  @valid_attrs %{name: "some content", price: 42, toppings: "some content", type: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, pizza_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing pizzas"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, pizza_path(conn, :new)
    assert html_response(conn, 200) =~ "New pizza"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, pizza_path(conn, :create), pizza: @valid_attrs
    assert redirected_to(conn) == pizza_path(conn, :index)
    assert Repo.get_by(Pizza, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, pizza_path(conn, :create), pizza: @invalid_attrs
    assert html_response(conn, 200) =~ "New pizza"
  end

  test "shows chosen resource", %{conn: conn} do
    pizza = Repo.insert! %Pizza{}
    conn = get conn, pizza_path(conn, :show, pizza)
    assert html_response(conn, 200) =~ "Show pizza"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, pizza_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    pizza = Repo.insert! %Pizza{}
    conn = get conn, pizza_path(conn, :edit, pizza)
    assert html_response(conn, 200) =~ "Edit pizza"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    pizza = Repo.insert! %Pizza{}
    conn = put conn, pizza_path(conn, :update, pizza), pizza: @valid_attrs
    assert redirected_to(conn) == pizza_path(conn, :show, pizza)
    assert Repo.get_by(Pizza, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    pizza = Repo.insert! %Pizza{}
    conn = put conn, pizza_path(conn, :update, pizza), pizza: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit pizza"
  end

  test "deletes chosen resource", %{conn: conn} do
    pizza = Repo.insert! %Pizza{}
    conn = delete conn, pizza_path(conn, :delete, pizza)
    assert redirected_to(conn) == pizza_path(conn, :index)
    refute Repo.get(Pizza, pizza.id)
  end
end
