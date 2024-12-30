module Mutations
  class UpdateCountry < GraphQL::Schema::RelayClassicMutation
    field :country, Types::CountryType, null: false

    argument :id, ID, required: true
    argument :name, String, required: false
    argument :continent, String, required: false

    def resolve(id:, name: nil, continent: nil)
      country = Country.find_by(id)
      update_attributes = {}
      update_attributes[:name] = name if name
      update_attributes[:continent] = continent if continent
      country.update!(update_attributes)

      {
        country: country
      }
    end
  end
end