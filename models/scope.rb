class Scope < ActiveRecord::Base
  has_many :statuses, class_name: "Scope::Status"

  before_create :set_random_color

  private

  def set_random_color
    self.color = "##{SecureRandom.hex(6)}"
  end
end

