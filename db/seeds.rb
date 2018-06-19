# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'zhangjingqiang@gmail.com', password: 'password', password_confirmation: 'password')

qiang_dev = Stack.create(
  title: "Qiang's Development",
  description: "Development skills Qiang has mastered."
)
qiang_dev.skills.create(description: "Python")
qiang_dev.skills.create(description: "Ruby on Rails")
qiang_dev.skills.create(description: "Go")
qiang_dev.skills.create(description: "Node.js")
qiang_dev.skills.create(description: "Elixir")
qiang_dev.skills.create(description: "PHP")
qiang_dev.skills.create(description: "Scala")

qiang_ops = Stack.create(
  title: "Qiang's Operations",
  description: "Operations skills Qiang has mastered."
)
qiang_ops.skills.create(description: "Kubernetes")
qiang_ops.skills.create(description: "Docker")
qiang_ops.skills.create(description: "Ansible")
qiang_ops.skills.create(description: "OpenStack")
qiang_ops.skills.create(description: "CoreOS")
qiang_ops.skills.create(description: "Rancher")
qiang_ops.skills.create(description: "Jenkins")