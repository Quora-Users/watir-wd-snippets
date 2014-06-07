require 'watir-webdriver'
#uses the phantomjs driver, FireFox and Chrome etc do not work well with Quora
#       see: http://stackoverflow.com/questions/22336953/timeout-error-while-using-watir-webdriver-with-ruby
#            http://stackoverflow.com/questions/21687214/why-am-i-not-able-to-login-to-quora-using-an-automation-package-like-selenium-or
b = Watir::Browser.new :phantomjs
#b. goto url
b.goto "https://www.quora.com/Giordon-Stark/answers?share=1"

# build a loop to continuously scroll until it reaches page end
#       can add in break statements after certain number of loops if you want
last_size = 0
while last_size != b.html.size do
  last_size = b.html.size
  # scroll to the last answer on the page, located in div.PagedList
  b.div(:class => 'PagedList').elements.last.wd.location_once_scrolled_into_view
  # sleep for 3 seconds to handle ajax request delay until page updates
  sleep 3
end
