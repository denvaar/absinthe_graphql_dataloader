defmodule AbsintheDemoWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types(AbsintheDemoWeb.GraphQL.Typedefs)

  alias AbsintheDemoWeb.GraphQL.Resolvers

  query do
    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve(&Resolvers.list_posts/3)
    end
  end
end
