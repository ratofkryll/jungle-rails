require 'rails_helper'

RSpec.feature 'Visitor navigates to homepage', type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!({
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: rand(1..30),
        price: rand(1000..5000)
        })
    end
  end

  scenario 'They see all products' do
    visit root_path
    expect(page).to have_css 'article.product', count: 10
  end
end
