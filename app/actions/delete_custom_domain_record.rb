# frozen_string_literal: true

class DeleteCustomDomainRecord
  extend ::LightService::Action

  expects :custom_domain

  executed do |ctx|
    unless ctx.custom_domain.destroy
      ctx.fail!(ctx.custom_domain.error.full_messages)
    end
  end
end
