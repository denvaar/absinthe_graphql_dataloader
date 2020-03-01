defmodule AbsintheDemo.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :profile_pic_link, :string

      timestamps()
    end
  end
end
