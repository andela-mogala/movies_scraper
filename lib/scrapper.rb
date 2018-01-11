require 'nokogiri'
require 'open-uri'

class Scrapper

  def self.from_pages(list_of_pages)
    list_of_pages.map do |page|
      scrape_page_for_movie_details(page)
    end
  end

  def self.scrape_page_for_movie_details(url:, selector:)
    doc = Nokogiri::HTML(open(url))
    doc
      .css(selector)
      .children
      .select { |child| child.name == 'ul' }
      .map do |movie|
        {
          title: movie.css('li h5 a').text,
          img_url: movie.css('li figure a img').first.attributes['src'].value,
          description: movie.css('li p.excerpt').first.text
        }
      end
  end
end