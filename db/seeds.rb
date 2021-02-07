# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# Creates n users with randomly generated subscriber identities
10.times { User.create(sub: "seed_data | #{SecureRandom.uuid}") }
