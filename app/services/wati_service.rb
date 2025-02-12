require 'net/http'
require 'uri'
require 'json'

class WatiService
  WATI_API_URL = 'https://api.wati.io/v1'
  WATI_ACCESS_TOKEN = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI2NGFkZWUxYS01Y2JlLTQ3MWQtYjMxNy05NDVjOThmYTUxYTYiLCJ1bmlxdWVfbmFtZSI6ImluZm9AYW5kYXJhaW1wZXJpYWx0ZXJyYWNlLmNvLmlkIiwibmFtZWlkIjoiaW5mb0BhbmRhcmFpbXBlcmlhbHRlcnJhY2UuY28uaWQiLCJlbWFpbCI6ImluZm9AYW5kYXJhaW1wZXJpYWx0ZXJyYWNlLmNvLmlkIiwiYXV0aF90aW1lIjoiMDIvMTIvMjAyNSAyMDozNDo1NCIsImRiX25hbWUiOiJ3YXRpX2FwcF90cmlhbCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlRSSUFMIiwiZXhwIjoxNzQwMDA5NjAwLCJpc3MiOiJDbGFyZV9BSSIsImF1ZCI6IkNsYXJlX0FJIn0.N93GBpGiFvRb-b0xUuc2isoV9EyozZcv1Q9csvhV2kQ'

  def self.send_message(agent)
    uri = URI.parse("#{WATI_API_URL}/sendSessionMessage")
    header = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer #{WATI_ACCESS_TOKEN}"
    }

    message = "Selamat datang, #{agent.name}! 🎉\nAnda telah bergabung dengan Andara Agen Affiliate Program. Anda mendapatkan saldo Rp 500.000,- yang bisa dicairkan setelah referral Anda membayar DP 30%.\n\nCek dashboard Anda di: www.andaraimperialterrace.click/login"

    body = {
      phone: agent.mobile, # Pastikan format nomor: 6281234567890
      message: message
    }.to_json

    response = Net::HTTP.post(uri, body, header)
    puts "WATI Response: #{response.body}"
  end
end
