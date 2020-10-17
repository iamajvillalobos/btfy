# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedirectLink, type: :organizer do
  subject { described_class.call(ctx) }

  let(:ctx) do
    {
      #foo: 'something foo',
      #bar: { baz: qux },
    }
  end

  context "when called" do
    xit "is expected to be successful" do
      expect(subject).to be_a_success
    end
  end
end
