require 'open-uri'
require 'selenium-webdriver'

@driver = Selenium::WebDriver.for :remote, url:'http://localhost:8001'

thumbnail_urls = ["https://hearthstone.gamepedia.com/File:Activate!_full.png"]
# example thumbnail page shown, you will need to populate this with the urls for the thumbnails of the images you want

def download_image(url, destination)
  open(url) do |u|
    File.open(destination, 'wb') { |f| f.write(u.read) }
  end
end

for i in 0..thumbnail_urls.size-1
  @driver.get thumbnail_urls[i]
  url = @driver.find_element(:class, 'internal').attribute('href')
  download_image(url, url.split('/').last)
end

@driver.quit