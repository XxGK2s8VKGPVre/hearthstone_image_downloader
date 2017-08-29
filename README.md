This script allows you to download Hearthstone full card art from Gamepedia. It accomplishes this by visiting the relevant pages and downloading the full size image from them programatically.

The structure of the files on Gamepedia is highly irregular so it was necessary to generate a list of all the urls for all the cards. These cards are listed by expansion on Gamepedia so I was able to extract the url for the thumbnail for each card for reach expansion. I did this by going to each set's page and clicking on "edit source". This gave me a list of card names which I then transformed into URLs using the following pattern. "https://hearthstone.gamepedia.com/File:#{card_name}_full.jpg". Unfortunately some cards have alternate names between the thumbnails and the actual URL to download so this requires a lot of manual intervention upon runtime. I have included a list of all the thumbnail urls through the Knights of the Frozen Throne expansion in a txt file (1894 urls).

In order to get at the full size files instead of the thumbnail sized ones, you need to visit the url for the thumbnail and then on this page there is a link to the full size url which you can use to download the full size file. The 'hearthstone_image_downloader.rb' script contains these steps given a list of thumbnail urls. Note: this script will break if the page structure for Gamepedia changes on these thumbnail pages for where the full size image is stored.

Setup
1. Download phantomjs and put it on your path. If you have npm I recommend this command in your terminal 'npm install -g phantomjs-prebuilt'
2. Start phantomjs by using this command in your terminal 'phantomjs --webdriver=8001'
3. Use the version of ruby found in the .ruby-version file. I recommend doing this with .rbenv but this isn't necessary.
4. Add the selenium-webdriver gem with this command in your terminal 'gem install selenium-webdriver'.
5. Add the thumbnail urls you want to 'hearthstone_image_downloader.rb' script.
6. From the directory the script is in run this command in your terminal 'ruby hearthstone_image_downloader.rb'

Errors: There are a ton of js errors on the Gamepedia page and phantomjs periodically tries to clean up sessions. These can crash your script or phantomjs. To recover restart phantomjs and modify the script to pick up at the file you left off.

File Destination: the files will be downloaded into the directory you have this script. You can easily modify this.
