after :users do
  puts '=== Create Comments ==='
  Comment.destroy_all
  ActiveRecord::Base.connection.execute(
    "ALTER SEQUENCE comments_id_seq RESTART WITH 1"
  )
  theo_user = User.find_by(first_name: 'Theo')

  Comment.create(content: 'This is content for testing', parent_id: nil, user_id: theo_user.id)
  puts '=== End ==='
end