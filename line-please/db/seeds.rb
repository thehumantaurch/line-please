# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Script.create(title: "Hamlet", author: "William Shakespeare")

Scene.create(script_id: 1)
Scene.create(script_id: 1)
Scene.create(script_id: 1)

Character.create(name: "Hamlet")
Character.create(name: "Ophelia")
Character.create(name: "Horatio")

9.times do
  SceneCharacter.create(scene_id: Scene.all.sample.id, character_id: Character.all.sample.id )
end


40.times do
  Line.create(words: "Words, words, words", scene_character_id: SceneCharacter.all.sample.id)
end