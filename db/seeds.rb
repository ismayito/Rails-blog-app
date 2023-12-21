# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
first_user = User.create!(Name: 'Tom', Photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 
Bio: 'Teacher from Mexico.', PostsCounter: 0,email:"test2@example.com", password: 'test@example.com')
second_user = User.create!(Name: 'Lilly', Photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 
Bio: 'Teacher from Poland.',PostsCounter: 0,email:"test1@example.com",password: 'test@example.com')

first_post = Post.create!(author_id: first_user.id, Title: 'Tom first', Text: 'This is Tom first post', LikesCounter: 0, CommentsCounter: 0)
second_post = Post.create!(author_id: second_user.id, Title: 'Lily first', Text: 'This is Lily first post', LikesCounter: 0, CommentsCounter: 0)
third_post = Post.create!(author_id: first_user.id, Title: 'Mr Tom second post', Text: 'This is Tom second post', LikesCounter: 0, CommentsCounter: 0)
fourth_post = Post.create!(author_id: second_user.id, Title: 'Ms Lily second post', Text: 'This is Lily second post', LikesCounter: 0, CommentsCounter: 0)
fifth_post = Post.create!(author_id: first_user.id, Title: 'Mr Tom third post', Text: 'This is Tom third post', LikesCounter: 0, CommentsCounter: 0)
sixth_post = Post.create!(author_id: second_user.id, Title: 'Ms Lily third post', Text: 'This is Lily third post', LikesCounter: 0, CommentsCounter: 0)

first_comment = Comment.create!(user_id: first_user.id, post_id: first_post.id, Text: 'Tom first comment!')
second_comment = Comment.create!(user_id: second_user.id, post_id: second_post.id, Text: 'Lily second comment!')