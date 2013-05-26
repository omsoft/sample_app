require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the SeoUrlHelper. For example:
#
# describe SeoUrlHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe SeoHelper do
  
  describe "meta_title helper" do
    it "adds a vertical bar if you provide a page_title" do
      helper.meta_title('MySite', 'Internal Page').should include('|')
    end
  end
  
end
