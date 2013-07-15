require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the CoursesHelper. For example:
#
# describe CoursesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe CoursesHelper do
  describe ".add_event" do
    it "should raise an ArgumentError if the supplied object is not an Event" do
      @course = Course.new
      @event = 'fake event'
      expect{add_event(@event, @course)}.to raise_error(ArgumentError)
      end
    end
end
