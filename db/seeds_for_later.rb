  # Script.create(title:"Hamlet", author: "William Shakespeare")
  # 5.times do
  #   Act.create(script: 1)
  # end

  # 5.times do
  #   Scene.create(act: 1, script: 1)
  # end

  # 2.times do
  #   Scene.create(act: 2, script: 1)
  # end

  # 4.times do
  #   Scene.create(act: 3, script: 1)
  # end

  # 7.times do
  #   Scene.create(act: 4, script: 1)
  # end

  # 2.times do
  #   Scene.create(act: 5, script: 1)
  # end

  # filename = File.expand_path(File.dirname(__FILE__)) + "/../hamlet.txt"

  # File.open(filename, "r") do |file|
  #   script = ""
  #   file.readlines.each do |line|
  #     script << line
  #   end
  #   acts = script.split(/ACT/)
  #   scenes = acts[3].split(/SCENE/)
  #   lines = scenes[1].split(/[A-Z]{3,}/)
  #   lines.each do |line|
  #     Line.create()
  #   characters = scenes[1].scan(/[A-Z]{3,}/)
  #     Character.create()

  # end


# require 'pry'
# filename = File.expand_path(File.dirname(__FILE__)) + "/../hamlet.txt"

#   File.open(filename, "r") do |file|
#     script = ""
#     file.readlines.each do |line|
#       script << line
#     end

#     acts = script.split(/ACT/)

#     scenes = acts.each do |act|
#       scene = []
#       scene << act.split(/SCENE/)
#       scene
#     end

#     lines = scenes.each do |scene|
#       lines = []
#       lines << scene.split(/[A-Z]{3,}/)
#       lines
#     end

#     characters = scenes.each do |scene|
#       characters = []
#       characters << scene.scan(/[A-Z]{3,}/)
#       characters
#     end


#   binding.pry
#   end
