require 'rails_helper'

# Test suite for the Item model
RSpec.describe Curriculum, type: :model do
  # Association test
  # ensure a Curriculum record belongs to a single user record
  it { should belong_to(:user) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end
