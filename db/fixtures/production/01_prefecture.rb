require 'csv'

csv = CSV.read('db/fixtures/csv_files/01_prefectures.csv', headers: true)
csv.each do |row|
  prefecture_id = row['id']
  prefecture_name = row['name']

  Prefecture.seed_once(:id) do |s|
    s.id = prefecture_id
    s.name = prefecture_name
  end
end