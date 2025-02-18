# lib/json_web_token.rb

module JsonWebToken
  # Encode payload menjadi token dengan waktu kedaluwarsa default 24 jam
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  # Decode token dan kembalikan payload-nya
  def self.decode(token)
    body = JWT.decode(token, Rails.application.secret_key_base)[0]
    HashWithIndifferentAccess.new body
  rescue JWT::DecodeError => e
    # Jika token tidak valid, raise error atau kembalikan nil
    nil
  end
end
