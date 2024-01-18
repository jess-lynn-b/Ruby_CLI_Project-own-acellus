require "nokogiri"
require "open-uri"
require "pry"
require "json"
URL = "https://www.acellusacademy.com/online-high-school/"
class API
  def self.find_class_by_type(honor_class)
    html_file = open(URL).read
    html_doc = Nokogiri::HTML(URI.open(BASE_URL + honor_class))
  end
end