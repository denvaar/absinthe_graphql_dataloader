defmodule AbsintheDemoWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types(AbsintheDemoWeb.GraphQL.Typedefs)

  alias AbsintheDemoWeb.GraphQL.Resolvers

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(:blog_context, AbsintheDemo.DataSource.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  query do
    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve(&Resolvers.list_posts/3)
    end

    @desc "Get all authors"
    field :authors, list_of(:author) do
      resolve(&Resolvers.list_authors/3)
    end

    @desc "Get all categories"
    field :categories, list_of(:category) do
      resolve(&Resolvers.list_categories/3)
    end
  end
end
