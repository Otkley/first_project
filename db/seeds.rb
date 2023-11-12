# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Post.create!(
  {
    title: "Primer post!",
    content: "Este es el contenido del primer post!"
  },
  {
    title: "Segundo post o.o",
    content: "El contenido del segundo post"
  }
)