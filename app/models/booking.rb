class Booking < ActiveRecord::Base
  belongs_to :school
  validates_numericality_of :num_children, :only_integer => true, :greater_than_or_equal_to => 4
  after_create :uuid


  def to_param
    uuid
  end

  def uuid
    uuid = read_attribute :uuid

    if uuid.blank?
      uuid = SecureRandom.uuid
      update_attribute :uuid, uuid
    end

    uuid
  end
end
