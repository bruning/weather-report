# weather-report
A Ruby command-line application designed to **(a)** pull data from multiple Weather Underground API endpoints and **(b)** present a weather report to the user.  Users can choose from the following report options:

* Current observations from any United States ZIP code
* A ten-day forecast for a given ZIP code
* Today's sunrise and sunset times for a given ZIP code
* Any active weather alerts for a given ZIP code
* Any current hurricane activity

### Dependencies

In addition to needing an API key from Weather Underground, you must also have the following gem installed:

* HTTParty

```
require 'httparty'
```


## Getting Started and Running the Program

After cloning this repository from Github, you'll execute the following code in the command line:

```
ruby weather-report-cli.rb
```

You'll first be prompted to choose the report that you want.  Depending on the report you choose, you may then be prompted to enter a ZIP code.  Some good examples include:

* 00901 - [San Juan, PR](https://www.google.com/search?q=00901+zip+code)
* 10101 - [Manhattan, NY](https://www.google.com/search?q=10101+zip+code)
* 27407 - [My hometown ZIP Code!](https://en.wikipedia.org/wiki/Greensboro,_North_Carolina)
* 27701 - [Automated Insights World Headquarters](https://automatedinsights.com/)
* 60652 - [Scruff McGruff](https://www.google.com/search?q=scruff+mcgruff+zip+code)
* 96701 - [Oahu, HI](https://www.google.com/search?q=96701+zip+code)
* 99723 - [Barrow, AK](https://www.google.com/search?q=barrow+alaska+zip+code)

## Running tests

In the command line, run the following:

```
ruby weather-report-test.rb
```

Currently, the file offers four tests and 12 assertions.

## Built With

* [Weather Underground](https://www.wunderground.com/weather/api) - Used to supply real-time weather data
* [Minitest](https://github.com/seattlerb/minitest) - Used to create unit tests across the project
* [yaml](http://yaml.org/) - Used to help manage API keys / tokens
* [Wordsmith](https://github.com/ai-wordsmith/wordsmith-ruby-sdk) - Was not used, but could have been very useful

## Contributing

At this stage, I don't get the sense that submitting any pull requests would be very useful.

## License

This repository currently has no licenses associated with it.

## Acknowledgments

* Hat tip to [Mason Matthews](https://github.com/masonfmatthews), who did a great job teaching the fundamentals of Ruby.
* Also thanks to [Joe Peck](https://github.com/fatcatt316) for giving this project a look-see.
* And to [Todd S.](https://github.com/toddsheet) for putting bad-juju on my machine (while saving me from certain Git disaster).
