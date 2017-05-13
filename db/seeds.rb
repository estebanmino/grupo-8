# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy all
Comment.destroy_all
Post.destroy_all
User.destroy_all
Team.destroy_all
Tournament.destroy_all
Division.destroy_all




Division.create(
    name: "Primera A",
    description: "División de primera categoria donde juegan solo los mejores",

  )

Division.create(
    name: "Primera B",
    description: "Primera B, una division exigente donde el objetivo es ascender",

  )

Division.create(
    name: "Segunda A",
    description: "Segunda division, una division donde reina la buena onda y el tercer tiempo!",

  )
divs_ids = Division.pluck(:id)
for i in divs_ids

  for j in 1..2
    Tournament.create(
    name: "Torneo Div:#{i}-Numero:#{j}",
    description: Faker::Lorem.sentence,
    season: "Otoño/invierno",
    division_id: i)


  end
end
divs = Division.all
for i in divs
  for j in i.tournaments
    8.times do
      team = Team.create(
        name: "#{Faker::Name.unique.last_name} FC",
        points: 0,
        won: 0,
        lost: 0,
        tie: 0,
        division_id: i.id
      )
      team.tournaments << j
    end
  end
end

teams = Team.all
posiciones = ["medio", "defensa", "delantero"]

for team in teams
  cap = true
  7.times do

    user = User.create(
      name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.unique.email,
      position: posiciones.sample,
      password: Faker::Internet.password,
      is_admin: false,
      #team_id: i.id,
      is_captain: cap
    )
    Membership.create(:team_id => team.id, :user_id => user.id)
    cap = false

  end
end

user = User.create(
name: "Cristian",
last_name: "Carreño",
email: "cristian@gmail.com",
position: "medio",
password: "123456",
is_admin: true,
#team_id: 1,
is_captain: true)
Membership.create(:team_id => 1, :user_id => user.id)


user = User.create(
name: "Esteban",
last_name: "Miño",
email: "efmino@uc.cl",
position: "atacante",
password: "123456",
is_admin: true,
#team_id: 2,
is_captain: true)
Membership.create(:team_id => 1, :user_id => user.id)


user = User.create(
name: "Felipe",
last_name: "Pezoa",
email: "felipe@gmail.com",
position: "medio",
password: "123456",
is_admin: true,
#team_id: 1,
is_captain: true)
Membership.create(:team_id => 1, :user_id => user.id)

user_ids = User.pluck(:id)

10.times do
  Post.create(
    name: Faker::Lorem.word,
    description: Faker::Lorem.sentence,
    user_id: user_ids.sample
  )

end
posts_id = Post.pluck(:id)

50.times do
  Comment.create(
  content: Faker::Lorem.sentence,
  user_id: user_ids.sample,
  post_id: posts_id.sample

  )
end
