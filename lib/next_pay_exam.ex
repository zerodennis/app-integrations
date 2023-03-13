defmodule NextPayExam do
  @moduledoc """
  NextPayExam keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Ecto.Query

  def query do
    quote do
      import Query
    end
  end

  def resolver do
    quote do
      alias NextPayExam.Repo
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
