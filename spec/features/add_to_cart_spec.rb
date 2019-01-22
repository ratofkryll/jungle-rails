require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario 'Clicking "Add" on a product adds it to the cart' do
    visit root_path
    first('article.product').find_button('Add').click
    expect(page).to have_text 'My Cart (1)'
  end
end
