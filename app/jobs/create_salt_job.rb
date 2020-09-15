class CreateSaltJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Salt.destroy_all if Salt.all.any?
    Salt.create(key: SecureRandom.hex)
  end
end
