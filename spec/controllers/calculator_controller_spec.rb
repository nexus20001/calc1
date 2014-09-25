require "rails_helper"

describe CalculatorController do
  render_views
  before :each do
    @user = create(:user)
    sign_in @user
  end

  it "returns result after expression" do
    post :calculate, expression: "1+2+3", format: :html
    expect(response.body).to include '6'
  end

  it "returns error if no correct expression" do
    post :calculate, expression: "1+2+3+", format: :html
    expect(response.body).to include 'error'
  end

  it "returns error if number overflow" do
    # number limit : 100
    post :calculate, expression: "1+2+101", format: :html
    expect(response.body).to include 'error'
  end

    it "returns error if unauthorized operation" do
      # allow operations "+-"
      post :calculate, expression: "1+2*3", format: :html
      expect(response.body).to include 'error'
    end

  it "returns result if sign in as admin" do

    sign_out(@user)
    @admin = create(:admin)
    sign_in (@admin)

    post :calculate, expression: "100000/200*3+1-2", format: :html
    expect(response.body).to include '1499'
  end
  end