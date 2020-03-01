defmodule AbsintheDemo.Database do
  import Ecto.Query, only: [from: 2]
  alias AbsintheDemo.{Author, Post, Category, Repo}

  # Posts

  def all_posts() do
    Repo.all(Post)
  end

  def get_post(id) do
    Repo.get(Post, id)
  end

  def get_posts_of_author(author_id) do
    from(c in Post, preload: :author, where: c.author_id == ^author_id)
    |> Repo.all()
  end

  def get_posts_of_category(category_id) do
    from(p in Post,
      join: pc in "posts_categories",
      on: pc.category_id == ^category_id and pc.post_id == p.id
    )
    |> Repo.all()
  end

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
