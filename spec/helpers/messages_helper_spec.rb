require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MessagesHelper. For example:
#
# describe MessagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MessagesHelper, type: :helper do
  describe 'Messages helper methods' do
    it 'should return true' do
      contenido = 'Ejemplo de descripción'
      first_letter(contenido).should eq(true)
    end
  end
end
