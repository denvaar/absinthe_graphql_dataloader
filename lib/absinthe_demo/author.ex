defmodule AbsintheDemo.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :name, :string
    field :profile_pic_link, :string

    has_many :posts, AbsintheDemo.Post

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :profile_pic_link])
    |> validate_required([:name, :profile_pic_link])
  end
end
