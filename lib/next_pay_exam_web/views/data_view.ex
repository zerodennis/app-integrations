defmodule NextPayExamWeb.Api.DataView do
  use NextPayExamWeb, :view

  def render("index.json", %{data: data}) do
    render_many(data, __MODULE__, "datum.json")
  end

  def render("datum.json", %{data: datum}) do
    %{
      id: datum.id,
      title: datum.title
    }
  end
end
