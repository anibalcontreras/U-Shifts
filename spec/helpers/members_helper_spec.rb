require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MembersHelper. For example:
#
# describe MembersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MembersHelper, type: :helper do
  describe 'Turnos helper methods' do
    it 'should return true' do
      turno_id = 3
      turno_id_is_int(turno_id).should eq(true)
    end
  end
end
