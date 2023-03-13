defmodule NextPayExam.Tag.Queries.TagQueries do
  use NextPayExam, :query
  alias NextPayExam.Schemas.Tag

  def query_all(params \\ %{}, preload \\ []) do
    query = from(t in Tag, preload: ^preload)

    query_by(query, params)
  end

  defp query_by(query, %{"tag_id" => id} = params) do
    query = from(q in query, where: q.tag_id == ^id)

    query_by(query, Map.delete(params, "tag_id"))
  end

  defp query_by(query, %{"tag_ids" => tag_ids} = params) do
    query = from(q in query, where: q.tag_id in ^tag_ids)

    query_by(query, Map.delete(params, "tag_ids"))
  end

  defp query_by(query, _params), do: query
end
