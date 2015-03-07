categories_array = ["Arts", "Business", "Comedy", "Education", "Hobbies", "Government", "Health", "Kids", "Music", "News", "Politics", "Religion", "Science", "Medicine", "Culture", "Sports", "TV", "Film", "Technology"]

categories_array.each do |category|
  Api.new(category).load
end

User.find_or_create_by(first_name: "Becca", last_name: "Shapiro", email_address: "rshapiro3@gmail.com", username: "becca", password: "password")
User.find_or_create_by(first_name: "Casie", last_name: "Levine", email_address: "emailaddress", username: "casie", password: "password")
Post.create(title: "First Podcast Post", content: "I love this podcast!", user_id: 1, podcast_id: 1)
Post.create(title: "First Episode Post", content: "I love this episode!", user_id: 1, episode_id: 1)