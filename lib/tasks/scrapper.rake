require_relative '../scrapper'

namespace :scrapper do
  desc "Scrapes data off a specified webpage"
  task scrape_silverbird_movies: :environment do
    Scrapper.from_pages(
      [
        {
          url: 'http://silverbirdcinemas.com/genre/adventure',
          selector: 'div.page.post-1875.type-page.status-publish.hentry'
        },
        {
          url: 'http://silverbirdcinemas.com/genre/comedy/',
          selector: 'div.page.post-2406.type-page.status-publish.hentry'
        }
      ]
    ).each { |movie_data| Movie.create(movie_data) }
  end
end