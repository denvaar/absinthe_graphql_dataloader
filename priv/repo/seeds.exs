# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     AbsintheDemo.Repo.insert!(%AbsintheDemo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias AbsintheDemo.{Post, Author, Category, Repo}

# Categories

programming = Repo.insert!(%Category{name: "Programming"})
tennis = Repo.insert!(%Category{name: "Tennis"})
music = Repo.insert!(%Category{name: "Music"})
cycling = Repo.insert!(%Category{name: "Cycling"})
sports = Repo.insert!(%Category{name: "Sports"})

# Authors

create_author = fn name, link ->
  Repo.insert!(%Author{name: name, profile_pic_link: link})
end

burt = create_author.("Burt", "https://via.placeholder.com/150/0000FF/808080?text=Burt")

la_fawnda =
  create_author.("LaFawnda", "https://via.placeholder.com/150/0000FF/808080?text=LaFawnda")

marge = create_author.("Marge", "https://via.placeholder.com/150/0000FF/808080?text=Marge")
charles = create_author.("Charles", "https://via.placeholder.com/150/0000FF/808080?text=Charles")

# Posts

create_post = fn title, body, author_id, categories ->
  Repo.insert!(%Post{title: title, body: body, author_id: author_id})
  |> Repo.preload(:categories)
  |> Ecto.Changeset.change()
  |> Ecto.Changeset.put_assoc(:categories, categories)
  |> Repo.update!()
end

create_post.("Cool Bike", "Post about a cool bike...", burt.id, [cycling, sports])

create_post.("Tennis is Hard", "Post about how tennis is a hard sport", la_fawnda.id, [
  tennis,
  sports
])

create_post.("How to Serve the Ball", "Post about how to serve a tennis ball", burt.id, [
  tennis,
  sports
])

create_post.(
  "Elixir Rules!",
  "Post about how Elixir is the best programming language",
  marge.id,
  [programming]
)

create_post.("Learn Python", "Post about learning Python", la_fawnda.id, [programming])

create_post.("Rust is Popular", "Post about how Rust is so loved and popular", charles.id, [
  programming
])

create_post.("I <3 Music", "Post about loving music", charles.id, [music])
create_post.("Rap musik 4 lyfe", "Post about rap music", marge.id, [music])
