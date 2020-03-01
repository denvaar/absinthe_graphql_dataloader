defmodule AbsintheDemoWeb.GraphQL.Typedefs do
  use Absinthe.Schema.Notation

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
  end

  object :author do
    field :id, :id
    field :name, :string
    field :profile_picture_link, :string
  end
end
