require "rails_helper"


RPsec.describe Mechanic show page, type: :feature do
  it "has a show page with a mechanics attributes displayed" do
    visit "/mechanics/#{mechanic_1.id}"

    
  end

end