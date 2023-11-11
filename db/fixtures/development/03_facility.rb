require 'csv'
require 'geocoder'

csv = CSV.read('db/fixtures/csv_files/03_facilities.csv', headers: true)
csv.each do |row|
  address = row['address']
  prefecture_name = address.slice(0..2)
  prefecture = Prefecture.find_by("name like ?", "%#{prefecture_name}%")
  result = Geocoder.search(address).first

  Facility.seed(:id) do |s|
    s.id = row['id']
    s.name = row['name']
    s.description = row['description']
    s.opening_hour = row['opening_hour']
    s.closed_on = row['closed_on']
    s.website = row['website']
    s.address = address
    s.latitude = result.latitude
    s.longitude = result.longitude
    s.prefecture_id = prefecture.id
  end

  facility = Facility.find_by(id: row['id'])
  genres = Genre.where(name: row['genre'].split(' '))

  genres.each do |genre|
    FacilityGenre.seed do |s2|
      s2.facility_id = facility.id
      s2.genre_id = genre.id
    end
  end
end