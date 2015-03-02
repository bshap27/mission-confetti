topics = {
    "Art" => {
      :subtopics => ["Design", "Food"]
    },
    "Music" => {
      :subtopics => []
    },
    "Sports" => {
      :subtopics => ["Amateur", "Outdoor"]
    },
    "Technology" => {
      :subtopics => ["Gadgets", "Podcasting"]
    }
  }

topics.each do |name, hash|
  t = Topic.new
  t.name = name
  hash.each do |attribute, value|
    t[attribute] = value
  end
  t.save
end