require "spec_helper"

describe CoursesController do
  describe "#add_event" do
    it "should raise an ArgumentError if the supplied object is not an Event" do
      @course = Course.new
      @event = 'fake event'
      expect{@course.add_event(@event)}.should raise_error(ArgumentError)
      end
    end
end

# decribe EventsController do

# end
