require "rails_helper"

RSpec.describe Parser::JsonParser, type: :service do
  describe "responds to methods" do
    it "should respodn to to_snake_case" do
      expect(described_class.respond_to?(:to_snake_case).to be_true )
    end
  end
end