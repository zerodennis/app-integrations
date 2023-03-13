defmodule NextPayExam.AppIntegration.Queries.AppIntegrationQueries do
  use NextPayExam, :query
  alias NextPayExam.Schemas.AppIntegration

  def query_all(params \\ %{}, preload \\ []) do
    query = from(a in AppIntegration, preload: ^preload)

    query_by(query, params)
  end

  defp query_by(query, %{"q" => search_query} = params) do
    query =
      from(q in query,
        where:
          ilike(q.name, ^"%#{search_query}%") or
            ilike(q.description, ^"%#{search_query}%")
      )

    query_by(query, Map.delete(params, "q"))
  end

  defp query_by(query, %{"limit" => limit} = params) do
    query = limit(query, ^limit)

    query_by(query, Map.delete(params, "limit"))
  end

  defp query_by(query, %{"tagIds" => tag_ids} = params) do
    query =
      from(q in query, where: fragment("? && ?", q.tag_ids, type(^tag_ids, {:array, Ecto.UUID})))

    query_by(query, Map.delete(params, "tagIds"))
  end

  defp query_by(query, _params), do: query
end
