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
    description: "Grupo #{j} de la división, los primeros cuatro lugares
podrían acceder a playoffs, prepárate!",
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

    User.create(
      name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.unique.email,
      position: posiciones.sample,
      password: Faker::Internet.password,
      is_admin: false,
      team_id: team.id,
      is_captain: cap,
      goals: 0,
      yellow_cards: 0,
      red_cards: 0
    )
    cap = false

  end
end

adm_team = Team.create(
    id: 0,
    name: "Administradores FC",
    points: 0,
    won: 0,
    lost: 0,
    tie: 0,
    division_id: Division.first.id

)



c = User.create(
name: "Cristian",
last_name: "Carreño",
email: "cristian@gmail.com",
position: "medio",
password: "123456",
is_admin: true,
team_id: 0,
is_captain: false,
goals: 0,
yellow_cards: 0,
red_cards: 0)

c.generate_token_and_save

e = User.create(
name: "Esteban",
last_name: "Miño",
email: "efmino@uc.cl",
position: "atacante",
password: "123456",
is_admin: true,
team_id: 0,
is_captain: false,
goals: 0,
yellow_cards: 0,
red_cards: 0)
e.generate_token_and_save


adm = User.create(
name: "Admin",
last_name: "Istrador",
email: "admin@gmail.com",
position: "medio",
password: "admin1234",
is_admin: true,
team_id: 0,
is_captain: false,
goals: 0,
yellow_cards: 0,
red_cards: 0)

adm.generate_token_and_save
