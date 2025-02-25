# frozen_string_literal: true

RSpec.describe Admin::PluginsController do

  it "is a subclass of StaffController" do
    expect(Admin::PluginsController < Admin::StaffController).to eq(true)
  end

  context "while logged in as an admin" do
    before do
      sign_in(Fabricate(:admin))
    end

    it 'should return JSON' do
      get "/admin/plugins.json"
      expect(response.status).to eq(200)
      expect(response.parsed_body.has_key?('plugins')).to eq(true)
    end
  end
end
