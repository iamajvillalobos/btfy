class QrcodesController < ApplicationController
  skip_authorization_check

  def download
    filename = "#{Time.current.to_i}.png"
    qrcode = RQRCode::QRCode.new(params[:url]).as_png
    data = qrcode.save(filename, interlace: true)
    send_data qrcode, disposition: "attachment", filename: filename
  end
end