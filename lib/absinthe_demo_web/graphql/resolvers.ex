defmodule AbsintheDemoWeb.GraphQL.Resolvers do
  alias AbsintheDemo.Database

  def list_posts(_parent, args, resolution) do
    {:ok, Database.query_all_posts(args) |> Database.gen_all()}
  end

  def list_authors(_parent, _args, _resolution) do
    {:ok, Database.all_authors()}
  end

  def list_categories(_parent, _args, _resolution) do
    {:ok, Database.all_categories()}
  end
end
