class Plan < ApplicationRecord
  def self.order_by_plan
    p1 = find_by(period: "monthly")
    p2 = find_by(period: "yearly")
    p3 = find_by(period: "lifetime")

    [p1, p2, p3]
  end
end
