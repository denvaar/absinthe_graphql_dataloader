defmodule AbsintheDemo.DataSource do
  def data() do
    Dataloader.Ecto.new(AbsintheDemo.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
end
