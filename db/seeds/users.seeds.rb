puts '=== Create Users ==='
User.destroy_all
ActiveRecord::Base.connection.execute(
  "ALTER SEQUENCE users_id_seq RESTART WITH 1"
)

User.create([
              {
                first_name: 'Theo', last_name: 'Nguyen', email: 'theo@example.com', password: '123123123'
              },

              {
                first_name: 'Thai Dui', last_name: 'Nguyen', email: 'dui@example.com', password: '123123123' 
              }
            ])

puts '=== End ==='