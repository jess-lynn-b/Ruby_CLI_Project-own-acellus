require_relative 'api.rb'
module Scraper
 URL = "https://www.acellusacademy.com/online-high-school/"
  @classes = []
# extract Math classes from the page
  def self.extract_classes(doc)
    classes = doc.css('.et_pb_section_6 .et_pb_column p')
    
    @classes = []
    classes[1].css('a').each do |honor_class|
      @classes << honor_class.text.strip
      end
  end
  # scrape all classes
  def self.all
    @classes
  end
# extract the Language Arts classes
  def self.extract_language_classes(doc)
    classes = doc.css('.et_pb_section_6 .et_pb_column p')
    @classes = []
    classes[2].css('a').each do |honor_class|
      @classes << honor_class.text.strip
    end
  end
# extract the Fine Arts classes
  def self.extract_fine_classes(doc)
    classes = doc.css('.et_pb_module  .et_pb_css_mix_blend_mode_passthrough .et-last-child')
    @classes = []
    classes[3].css('a').each do |honor_class|
      @classes << honor_class.text.strip
    end
  end
# extract the History/Social Studies classes

# extract the Science classes

# extract the Technology classes

# extract the Foreign Language classes

# extract the Health/Social & Emotional classes

# extract the Career & Technical Education classes



    
# scrape data
  def self.scrape_classes
    puts "Scraping all classes..."
    unparsed_page = URI.open(URL)
    doc = Nokogiri::HTML(unparsed_page)
extract_classes(doc)
  end
end
  