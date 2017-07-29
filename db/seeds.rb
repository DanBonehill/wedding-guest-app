# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create User
User.create(email: "danbonehill@me.com", password: "Password")

# Create Invitations
invitations = Invitation.create([{}, {}, {}, {}])

# Create Guests
Guest.create([
    { name: "Daniel Bonehill", invitation: invitations[0] },
    { name: "Beth Stevenson", invitation: invitations[1] },
    { name: "Andrew Bonehill", invitation: invitations[2] },
    { name: "Michelle Bonehill", invitation: invitations[2] },
    { name: "Emma Bonehill", invitation: invitations[3] }
  ])

# Create Messages
Message.create([
    { name: "Daniel Bonehill", email: "dan@example.com", content: "This is a seeded message", unique_code: invitations[0][:unique_code], read: false },
    { name: "Emma Bonehill", email: "emma@example.com", content: "This is a seeded message", unique_code: invitations[3][:unique_code], read: false },
    { name: "Alan Stevenson", email: "alan@example.com", content: "This is a seeded message", read: false },
    { name: "Fred", email: "fred@example.com", content: "This is a seeded message", read: false }
  ])
