class AddCountryReferenceToSchools < ActiveRecord::Migration[5.0]
  def change
    add_reference :schools, :country

    12.times  { |x| School.update_all('country_id = 2') }
  end
end
