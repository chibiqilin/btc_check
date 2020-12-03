#!/bin/bash
#Scrape cost and change in price of bitcoin from a specified url.
#Author: Andrew Vu

curl=$(which curl)
#urls
url_btc="https://coinmarketcap.com/currencies/bitcoins/"

#scrape url
function scrape_url() {
				$curl --silent https://coinmarketcap.com/currencies/bitcoin/ | grep '<span class="cmc-details-panel-price__price">' | sed 's/<[^>]*>//g' | grep -oP 'Bitcoin \(BTC\)\$\d+,\d+\.\d+ USD \(\d+\.\d+%\)'| sed 's/BTC//g' | sed 's/USD //g' | sed 's/(//g' | sed 's/)//g'
}


#Main
scrape_url

#END
