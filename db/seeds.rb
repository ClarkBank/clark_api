roles = ['user', 'guest', 'admin']
roles.map { |role| Role.create(name: role) }
