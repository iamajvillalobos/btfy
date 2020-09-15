namespace :salt do
  task create: :environment do
    CreateSaltJob.perform_later
  end
end

