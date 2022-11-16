class Shirt < ApplicationRecord


  def self.latest_shirts
    self.order(created_at: :desc)
  end
end
