defmodule AbsintheDemoWeb.GraphQL.Typedefs do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias AbsintheDemo.Database

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string

    field :author, :author, resolve: dataloader(:blog_context)

    field :categories, list_of(:category) do
      # post_id arg is implied
      resolve(dataloader(:blog_context))
    end
  end

  object :author do
    field :id, :id
    field :name, :string
    field :profile_pic_link, :string

    field :posts, list_of(:post) do
      # author_id arg is implied
      arg(:categories, list_of(:string))
      resolve(dataloader(:blog_context))
    end
  end

  object :category do
    field :id, :id
    field :name, :string

    field :posts, list_of(:post) do
      arg(:categories, list_of(:string))
      arg(:author_id, :id)
      resolve(dataloader(:blog_context))
    end
  end
end
