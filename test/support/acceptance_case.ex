defmodule PizzaAppWeb.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias PizzaAppWeb.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import PizzaAppWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(PizzaAppWeb.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(PizzaAppWeb.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(PizzaAppWeb.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
