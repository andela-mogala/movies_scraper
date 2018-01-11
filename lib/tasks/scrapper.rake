require 'nokogiri'
require 'open-uri'

namespace :scrapper do
  desc "Scrapes data off a specified webpage"
  task scrape_silverbird_movies: :environment do
    scrape_web_page_for_movie_details
  end
end


def scrape_web_page_for_movie_details
  url = 'http://silverbirdcinemas.com/genre/adventure'
  doc = Nokogiri::HTML(open(url))
  movie_divs = doc
             .css('div.page.post-1875.type-page.status-publish.hentry')
             .children
             .select { |child| child.name == 'ul' }
  movie_divs.each do |movie|
    Movie.create(
      title: movie.css('li h5 a').text,
      img_url: movie.css('li figure a img').first.attributes['src'].value,
      description: movie.css('li p.excerpt').first.text
    )
  end
end