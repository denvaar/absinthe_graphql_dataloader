defmodule AbsintheDemoWeb.GraphQL.Typedefs do
  use Absinthe.Schema.Notation

  alias AbsintheDemo.Database

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string

    field :author, :author do
      resolve(fn post, _args, _info ->
        # Example of N+1 problem
        {:ok, Database.get_author(post.author_id)}
      end)
    end

    field :categories, list_of(:category) do
      resolve(fn post, _args, _info ->
        # Example of N+1 problem
        {:ok, Database.get_categories_of_post(post.id)}
      end)
    end
  end

  object :author do
    field :id, :id
    field :name, :string
    field :profile_picture_link, :string

    field :posts, list_of(:post) do
      resolve(fn author, _args, _info ->
        # Example of N+1 problem
        {:ok, Database.get_posts_of_author(author.id)}
      end)
    end
  end

  object :category do
    field :id, :id
    field :name, :string

    field :posts, list_of(:post) do
      resolve(fn category, _args, _info ->
        # Example of N+1 problem
        {:ok, Database.get_posts_of_category(category.id)}
      end)
    end
  end
end
