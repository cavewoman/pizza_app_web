defmodule PizzaAppWeb.PizzaController do
  use PizzaAppWeb.Web, :controller

  alias PizzaAppWeb.Pizza

  def index(conn, _params) do
    pizzas = Repo.all(Pizza)
    render(conn, "index.html", pizzas: pizzas)
  end

  def new(conn, _params) do
    changeset = Pizza.changeset(%Pizza{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pizza" => pizza_params}) do
    changeset = Pizza.changeset(%Pizza{}, pizza_params)

    case Repo.insert(changeset) do
      {:ok, _pizza} ->
        conn
        |> put_flash(:info, "Pizza created successfully.")
        |> redirect(to: pizza_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pizza = Repo.get!(Pizza, id)
    render(conn, "show.html", pizza: pizza)
  end

  def edit(conn, %{"id" => id}) do
    pizza = Repo.get!(Pizza, id)
    changeset = Pizza.changeset(pizza)
    render(conn, "edit.html", pizza: pizza, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pizza" => pizza_params}) do
    pizza = Repo.get!(Pizza, id)
    changeset = Pizza.changeset(pizza, pizza_params)

    case Repo.update(changeset) do
      {:ok, pizza} ->
        conn
        |> put_flash(:info, "Pizza updated successfully.")
        |> redirect(to: pizza_path(conn, :show, pizza))
      {:error, changeset} ->
        render(conn, "edit.html", pizza: pizza, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pizza = Repo.get!(Pizza, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(pizza)

    conn
    |> put_flash(:info, "Pizza deleted successfully.")
    |> redirect(to: pizza_path(conn, :index))
  end
end
