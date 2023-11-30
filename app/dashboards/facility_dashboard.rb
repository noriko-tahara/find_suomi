require "administrate/base_dashboard"

class FacilityDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    address: Field::String,
    bookmarks: Field::HasMany,
    closed_on: Field::String,
    description: Field::Text,
    facility_genres: Field::HasMany,
    genres: Field::HasMany,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    name: Field::String,
    opening_hour: Field::String,
    prefecture: Field::BelongsTo,
    reviews: Field::HasMany,
    users: Field::HasMany,
    website: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    name
    address
    prefecture
    genres
    bookmarks
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    description
    opening_hour
    closed_on
    website
    address
    latitude
    longitude
    genres
    facility_genres
    bookmarks
    prefecture
    reviews
    users
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    description
    opening_hour
    closed_on
    website
    address
    latitude
    longitude
    genres
    facility_genres
    bookmarks
    prefecture
    reviews
    users
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how facilities are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(facility)
  #   "Facility ##{facility.id}"
  # end
end
