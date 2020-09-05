require "rails_helper"

RSpec.describe TrialDaysCounterComponent, type: :component do

  context "30 days left on trial" do
    let(:trial_user) { create(:user) }

    it "returns '30 trial days left'" do
      result = render_inline(described_class.new(user: trial_user))
      expect(result.text).to include "30 trial days left"
    end
  end

  context "2 weeks ago left on trial" do
    let(:trial_user) { create(:user) }

    it "returns '2 trial weeks left'" do
      # since trial_ends_at is being set after user creation
      trial_user.update(trial_ends_at: 2.weeks.from_now)

      result = render_inline(described_class.new(user: trial_user))
      expect(result.text).to include "14 trial days left"
    end
  end

  it "only shows for trial users" do
    non_trial_users = create(:user)
    non_trial_users.update(trial_ends_at: 2.week.ago)

    result = render_inline(described_class.new(user: non_trial_users))

    expect(result.text).to eq ""
  end
end
