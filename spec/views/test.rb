require 'spec_helper'

describe 'products/show.html.erb' do
  it 'displays product details correctly' do
    assign(:product, Product.create(name: 'Shirt', price: 50.0))

    render

    rendered.should contain('Shirt')
    rendered.should contain('50.0')
  end
end