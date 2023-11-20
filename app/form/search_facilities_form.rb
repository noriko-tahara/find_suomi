class SearchFacilitiesForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :genre_id, :integer
  attribute :prefecture_id, :integer
  attribute :name, :string
  attribute :description, :string
  attribute :address, :string

  def search
    relation = Facility.distinct

    relation = relation.by_genre(genre_id) if genre_id.present?
    relation = relation.by_prefecture(prefecture_id) if prefecture_id.present?

    keywords.each do |word|
      relation = relation.keywords_contain(word)
    end

    relation
  end

  private

  def keywords
    name.present? ? name.split(/[[:blank:]]+/) : []
  end
end
