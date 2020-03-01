defmodule AbsintheDemo.Repo.Migrations.PostBelongsToAuthor do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :author_id, references(:authors), null: false
    end
  end
end
