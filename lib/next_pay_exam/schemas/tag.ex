defmodule NextPayExam.Schemas.Tag do
  use Ecto.Schema

  @schema_fields [
    :tag_id,
    :name
  ]

  @derive {Phoenix.Param, key: :tag_id}
  @derive {Jason.Encoder, only: @schema_fields}

  @primary_key false

  schema "tag" do
    field(:tag_id, Ecto.UUID, primary_key: true)
    field(:name, :string)
    field(:inserted_at, :utc_datetime_usec)
    field(:updated_at, :utc_datetime_usec)
  end
end
