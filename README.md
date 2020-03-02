# GraphQL server with Dataloader Example

I've left a trail of [commit messages](https://github.com/denvaar/absinthe_graphql_dataloader/commits/master) that is hopefully easy to follow. I might try to make a video soon.

- [Create a new Phoenix app](https://github.com/denvaar/absinthe_graphql_dataloader/commit/5fa2681f8797aa9317e223437eaf6fbd51e39bfb).
- [Install Absinthe and configure it to work with Phoenix](https://github.com/denvaar/absinthe_graphql_dataloader/commit/51bd434b832091ca394ee2f977bdfe63b5e38ab6).
- [Create a database schema with some basic relations; Hook it up to GraphQL schema](https://github.com/denvaar/absinthe_graphql_dataloader/commit/1b523986f5698eeb7c2dfa8dc12dd357e771d245). At this point we have a naive GraphQL schema. The resolvers cause some horrible database queries to happen.
- [Set up Dataloader with Absinthe to improve performance of database queries](https://github.com/denvaar/absinthe_graphql_dataloader/commit/dbbaae5828ffc1a403ce0cea3bc901e048288e0f).

### Setup Instructions

1. Install dependencies `mix deps.get`
1. Create database `mix ecto.setup`
1. Create database schema and populate with data `mix ecto.drop; mix ecto.create; mix ecto.migrate; mix run priv/repo/seeds.exs`
1. Start the Phoenix server `mix phx.server`
1. Run GraphQL queries (and browse schema documentation) from your web browser at `http://localhost:4000/api/graphiql`

### Learn more about Dataloader (Efficiently load data in batches)

- [Elixir Dataloader GitHub repo](https://github.com/absinthe-graphql/dataloader)
- [Elixir Dataloader Hex docs](https://hexdocs.pm/dataloader/Dataloader.html)
- [A helpful blog post](https://schneider.dev/blog/elixir-phoenix-absinthe-graphql-react-apollo-followup/)
- [Original Dataloader JavaScript implementation](https://github.com/graphql/dataloader)

### Learn more about Absinthe (Elixir implementation of GraphQL spec)

- [Absinthe GitHub Repo](https://github.com/absinthe-graphql/absinthe)
- [Absinthe Hex docs](https://hexdocs.pm/absinthe/overview.html)

### Learn more about Phoenix (Elixir Web Framework)

- [Official website](http://www.phoenixframework.org/)
- [Guides](https://hexdocs.pm/phoenix/overview.html)
- [Docs](https://hexdocs.pm/phoenix)
- [Mailing list](http://groups.google.com/group/phoenix-talk)
- [Source](https://github.com/phoenixframework/phoenix)
