defmodule AbsintheDemo.DataSource do
  import Ecto.Query, only: [from: 2]
  alias AbsintheDemo.{Post, Database}

  def data() do
    Dataloader.Ecto.new(AbsintheDemo.Repo, query: &query/2)
  end

  def query(Post, params) do
    Database.query_all_posts(params)
  end

  def query(queryable, _params) do
    queryable
  end
end
