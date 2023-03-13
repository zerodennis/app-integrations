defmodule NextPayExamWeb.TagControllerTest do
  use NextPayExamWeb.ConnCase
  alias NextPayExam.Repo
  alias NextPayExam.Schemas.Tag

  @tag_params %{
    tag_id: Ecto.UUID.generate(),
    name: "Children",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  }

  @other_tag_params %{
    tag_id: Ecto.UUID.generate(),
    name: "Ghosts",
    inserted_at: DateTime.utc_now(),
    updated_at: DateTime.utc_now()
  }

  describe "/api/tags" do
    test "returns a list of all tags", %{conn: conn} do
      tag_1 = Repo.insert!(struct(Tag, @tag_params))

      tag_2 = Repo.insert!(struct(Tag, @other_tag_params))
      conn = get(conn, "/api/tags")

      assert %{assigns: %{data: data}} = conn

      tag_ids = Enum.map(data, & &1.tag_id)

      assert tag_1.tag_id in tag_ids
      assert tag_2.tag_id in tag_ids
    end
  end
end
