defmodule NextPayExam.Tag.Resolvers.TagResolver do
  use NextPayExam, :resolver
  alias NextPayExam.Repo
  alias NextPayExam.Tag.Queries.TagQueries, as: Queries

  def list_all(params \\ %{}, preload \\ []) do
    tags =
      params
      |> Queries.query_all(preload)
      |> Repo.all()

    {:ok, tags}
  end
end
