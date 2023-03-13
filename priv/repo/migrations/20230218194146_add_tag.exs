defmodule NextPayExam.Repo.Migrations.AddTag do
  use Ecto.Migration

  def change do
    create table(:tag) do
      add :name, :string
      add :tag_id, :binary_id, primary_key: true

      timestamps(type: :utc_datetime_usec)
    end
  end
end
