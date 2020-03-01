defmodule AbsintheDemo.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :title, :string

    belongs_to :author, AbsintheDemo.Author
    many_to_many :categories, AbsintheDemo.Category, join_through: "posts_categories"

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body, :author])
  end
end
