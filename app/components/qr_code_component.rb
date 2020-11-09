class QrCodeComponent < ViewComponent::Base
  def initialize(url, size = 5)
    @url = url
    @size = size
  end

  def show
    qrcode = RQRCode::QRCode.new(@url)
    qrcode.as_svg(
      offset: 0,
      color: "000",
      shape_rendering: "crispEdges",
      module_size: @size,
      standalone: true
    )
  end
end
