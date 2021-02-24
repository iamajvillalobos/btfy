class QrCodeComponent < ViewComponent::Base
  def initialize(url)
    @url = url
  end

  def qrcode_url
    RQRCode::QRCode.new(@url).as_svg(module_size: 3)
  end
end
