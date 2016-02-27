defmodule PinsterPhoenix.Repo.Migrations.CreateLink do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :url, :string, null: false

      timestamps
    end

  end
end
