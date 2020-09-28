class ApiKeysController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!

  load_and_authorize_resource
  
  def index
    @api_keys = current_user.api_keys.order(created_at: :desc)
  end

  def create
    api_key = current_user.api_keys.new(
      key: SecureRandom.uuid,
      client_name: create_api_client_name
    )
    if api_key.save
      flash[:notice] = "API key added"
    else
      flash[:error] = api_key.errors.full_messages.to_sentence
    end

    redirect_to api_keys_path
  end

  def reactivate
    api_key = ApiKey.find(params[:api_key_id])
    if api_key.update(deactivated_at: nil)
      flash[:notice] = "Api Key #{api_key.key} is now activated"
    else
      flash[:error] = api_key.errors.full_messages.to_sentence
    end

    redirect_to api_keys_path
  end

  def deactivate
    api_key = ApiKey.find(params[:api_key_id])
    if api_key.update(deactivated_at: Time.current)
      flash[:notice] = "APi Key #{api_key.key} was deactivated"
    else
      flash[:error] = api_key.errors.full_messages.to_sentence
    end

    redirect_to api_keys_path
  end

  private

  def create_api_client_name
    person = Faker::TvShows::HowIMetYourMother.character
    house = Faker::TvShows::GameOfThrones.house

    "#{person} Of House #{house}".gsub(" ", "").underscore
  end
end