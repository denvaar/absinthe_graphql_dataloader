defmodule AbsintheDemoWeb.GraphQL.Typedefs do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias AbsintheDemo.Database

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string

    field :author, :author, resolve: dataloader(:blog_context)

    field :categories, list_of(:category), resolve: dataloader(:blog_context)
  end

  object :author do
    field :id, :id
    field :name, :string
    field :profile_picture_link, :string

    field :posts, list_of(:post), resolve: dataloader(:blog_context)
  end

  object :category do
    field :id, :id
    field :name, :string

    field :posts, list_of(:post), resolve: dataloader(:blog_context)
  end
end
