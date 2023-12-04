require 'csv'

csv = CSV.read('db/fixtures/csv_files/02_genres.csv', headers: true)
csv.each do |row|
  genre_id = row['id']
  genre_name = row['name']

  Genre.seed_once(:id) do |s|
    s.id = genre_id
    s.name = genre_name
  end
end