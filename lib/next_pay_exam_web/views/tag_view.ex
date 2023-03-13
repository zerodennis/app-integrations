defmodule NextPayExamWeb.Api.TagView do
  use NextPayExamWeb, :view

  def render("index.json", %{data: tags}) do
    render_many(tags, __MODULE__, "tag.json")
  end

  def render("tag.json", %{tag: tag}),
    do:
      tag
      |> Map.take([
        :tag_id,
        :name
      ])
end
