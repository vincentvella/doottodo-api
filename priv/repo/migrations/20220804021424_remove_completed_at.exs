defmodule Doottodo.Repo.Migrations.RemoveCompletedAt do
  use Ecto.Migration

  def change do
    alter table(:lists) do
      remove :completed_at
    end
  end
end
