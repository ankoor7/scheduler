require "spec_helper"

describe Course do
  describe ".add_event" do
    it "should raise an ArgumentError if the supplied object is not an Event" do
      @course = Course.new
      @event = 'fake event'
      expect{@course.add_event(@event)}.to raise_error(ArgumentError)
      end
    end

end

describe Event do

end