defmodule AbsintheDemo.Database do
  import Ecto.Query, only: [from: 2, from: 1]
  alias AbsintheDemo.{Author, Post, Category, Repo}

  def gen_all(query) do
    query |> Repo.all()
  end

  # Posts

  def get_post(id) do
    Repo.get(Post, id)
  end

  def query_all_posts(args) do
    from(p in Post)
    |> apply_post_args(args)
  end

  defp apply_post_args(query, %{author_id: author_id} = args) do
    query = from(p in query, where: p.author_id == ^author_id)

    apply_post_args(query, Map.delete(args, :author_id))
  end

  defp apply_post_args(query, %{categories: categories} = args) do
    query = from(p in query, join: c in assoc(p, :categories), where: c.name in ^categories)

    apply_post_args(query, Map.delete(args, :categories))
  end

  defp apply_post_args(query, %{title: title} = args) do
    query = from(p in query, where: ilike(p.title, ^"%#{title}%"))

    apply_post_args(query, Map.delete(args, :title))
  end

  defp apply_post_args(query, %{}), do: query

  # Authors

  def all_authors() do
    Repo.all(Author)
  end

  def get_author(id) do
    Repo.get(Author, id)
  end

  # Categories

  def all_categories() do
    Repo.all(Category)
  end

  def get_category(id) do
    Repo.get(Category, id)
  end

  def get_categories_of_post(post_id) do
    from(c in Category,
      join: pc in "posts_categories",
      on: pc.post_id == ^post_id and pc.category_id == c.id
    )
    |> Repo.all()
  end
end
