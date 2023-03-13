# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     NextPayExam.Repo.insert!(%NextPayExam.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias NextPayExam.Repo
alias NextPayExam.Schemas.AppIntegration
alias NextPayExam.Schemas.Tag
import Ecto.Query

Repo.insert!(%Tag{
  tag_id: Ecto.UUID.generate(),
  name: "Accounting",
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%Tag{
  tag_id: Ecto.UUID.generate(),
  name: "Bookkeeping",
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%Tag{
  tag_id: Ecto.UUID.generate(),
  name: "Communication",
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%Tag{
  tag_id: Ecto.UUID.generate(),
  name: "Compliance",
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%Tag{
  tag_id: Ecto.UUID.generate(),
  name: "eCommerce",
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%Tag{
  tag_id: Ecto.UUID.generate(),
  name: "HRIS",
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%Tag{
  tag_id: Ecto.UUID.generate(),
  name: "Payroll",
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

all_tags =
  from(t in Tag)
  |> Repo.all()

rand1 = :rand.uniform(3)
rand2 = :rand.uniform(3)
rand3 = :rand.uniform(3)

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Scott the Woz",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand1), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "River Deserts",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand2), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Apple",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description:
    "There are a variety of great apps available for Android and iOS devices, but which is the best for you? Whether you're looking for a fun app to keep you entertained or something to help you stay organized, we've got you covered. In this article, we'll take a look at some of our favorite Android and iOS apps and give you a little insight into what makes them so great.",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand3), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Discord",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description:
    "Discord is a free voice and text chat app for gamers that has gained a large following over the past few years. It’s available on many platforms, including PC, Mac, iOS and Android, and can be used to communicate with friends and teammates in games or between different sessions. While Discord can be used for basic chatting, it’s also powerful enough for more advanced uses. For example, you can use it to track your game stats, join server chats, and more.",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand1), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Nintendo",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description:
    "Nintendo is a well-known video game company that has been in business since 1889. Today, Nintendo produces a wide range of products, including consoles, games, and toys. Nintendo is a household name around the world and is trusted by millions of people to bring them hours of fun.",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand2), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Kinda Funny",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description:
    "If you're looking for a place to laugh and have a good time, then you should definitely check out Kinda Funny. The website is packed with funny quotes, videos, and articles that will make you smile. Plus, the staff is friendly and welcoming, so you'll feel right at home.",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand3), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Steam",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description:
    "Steam is a digital platform for game distribution and management. It's like an online store for games, but with extra features like automatic updates, a library of user-generated content, and the ability to manage multiple accounts.",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand1), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Game Cubes",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand2), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "All-Elite Wrestling",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand3), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "WWE",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand2), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Persona 6",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand3), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Hex Docs",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand1), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Metroid Prime",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand2), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Facebook",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand3), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Twitter",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand1), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Tesla Motors",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand2), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Nightmare Factory",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand3), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Microsoft",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand1), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Google",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand2), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Sony",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "Placeholder",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand3), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})

Repo.insert!(%AppIntegration{
  app_integration_id: Ecto.UUID.generate(),
  name: "Phoenix Framework",
  avatar_url: "https://source.unsplash.com/random?#{:rand.uniform(50)}",
  description: "The greatest framework on planet earth is back.",
  tag_ids: Enum.map(Enum.take_random(all_tags, rand1), & &1.tag_id),
  inserted_at: DateTime.utc_now(),
  updated_at: DateTime.utc_now()
})
