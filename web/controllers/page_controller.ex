defmodule PizzaAppWeb.PageController do
  use PizzaAppWeb.Web, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
