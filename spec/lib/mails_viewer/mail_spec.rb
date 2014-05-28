require 'spec_helper'

describe Mail::Message do
  let(:message) { Mail::Message.new }

  context "#filename_for" do
    it "should generate a filename in format: <timestamp>.<email>.txt" do
      filename = message.filename_for("email@email.com")
      filename.should_not be_nil
      filename.should match(/\d+\.email@email\.com\.txt/)
    end

    it "removes forward slashes from email" do
      filename = message.filename_for('firstname/lastname@email.com')
      filename.should_not be_nil
      filename.should match(/\d+\.firstname_lastname@email\.com\.txt/)
    end

  end
end
