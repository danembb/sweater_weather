<div align="center">

# Sweater Weather
[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]

## Overview

Sweater Weather is a fictitious backend rails application that has a front end application that calls on its endpoints. The Front end can call on a variety of endpoints that utilize multiple different API's depending on what the goal of the front end. API's used in this application are Unsplash developers for utilization of pictures. Mapquest Developer to give directions for a road trip and the trip timing along with latitude and longitude that was utilized for the Openweather API which was used to get the weather for a desired location or for the road trip. The last API used was a Open Library API to find a number of titles with a certain perameter passed in and to get certain book information. All API's used had an API key that has to be used to access these API endpoints for each application. To do this one has to go to each website and sign up with a profile to get a key and implement that into the app.

## Learning Goals:
</div>

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

<div align="center">

  ## Contributors

### Dane Brophy

[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://github.com/danembb)
[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/dane-brophy/)

## Tools Used

|Development|Development|Testing
|--- |--- |--- |
|[<img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />](https://www.ruby-lang.org/en/downloads/)|[<img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)|[ <img src="https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/rspec/rspec-rails)
|[ <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />](https://rubygems.org/gems/rails/versions/5.2.6)|[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://desktop.github.com/)|[<img src="https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/teamcapybara/capybara)
|[<img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/pry/versions/0.10.3)|[<img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />](https://atom.io/)|[<img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/bblimke/webmock)
|[<img src="https://img.shields.io/badge/sql-postgreSQL-green"/>](https://www.postgresql.org/)||[<img src="https://img.shields.io/badge/-VCR-lightgrey"/>](https://github.com/vcr/vcr)
|[<img src="https://img.shields.io/badge/-Postico-yellowgreen"/>](https://eggerapps.at/postico/)||[<img src="https://img.shields.io/badge/launchy-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/launchy/versions/2.4.3)
|[<img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />](https://www.postman.com/product/rest-client/)||[<img src="https://img.shields.io/badge/-FactoryBot-green"/>](https://github.com/thoughtbot/factory_bot)
|[<img src="https://img.shields.io/badge/-Figaro-yellow"/>](https://github.com/laserlemon/figaro)||[<img src="https://img.shields.io/badge/-Faker-blue"/>](https://github.com/faker-ruby/faker)
|[<img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/lostisland/faraday)||[<img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/simplecov/versions/0.12.0)|


</div>

<div align="center">

## Setup

</div>

This project requires Ruby 2.7.2.

 * Fork and clone this repository
 * Change into the `sweater_weather` directory
 * From the command line, install gems and set up your DB:
     * `bundle install && bundle update`
     * `rails db:{create,migrate,seed}`
 * Run the test suite with `bundle exec rspec -fd`
 * Create an account with [Open Weather Map](https://openweathermap.org/api/one-call-api), [MapQuest](https://developer.mapquest.com/documentation/geocoding-api/), [Unsplash](https://unsplash.com/developers).
 * After creating accounts for all of these install the figaro gem `bundle exec figaro install`
 * Add API keys for your accounts to `application.yml` that was produced by figaro in the `config folder`
<br>
<div align="center">
  
### Project Configurations
</div>

  * Ruby version
      ```bash
      $ ruby -v
      ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
      ```

  * [System dependencies](https://github.com/prekinder/frontend/blob/main/Gemfile)
      ```bash
      $ rails -v
      Rails 5.2.6
      ```

  * Database creation
      ```bash
      $ rails db:{drop,create,migrate,seed}
      Created database 'sweater_weather_development'
      Created database 'sweater_weather_test'
      ```

      ```bash
      $ bundle install
      ```

  * [API key configuration](https://github.com/laserlemon/figaro)
      ```bash
      $ bundle exec figaro install
      ```
      Add your credentials & API keys to `config/application.yml`

  * How to run the test suite
      ```bash
      $ bundle exec rspec -fd
      ```
<div align="center">
  
## Endpoints
</div>

For a more responsive and enteractive response installing/using [Postman](https://www.postman.com/) will enhance the experience. For accessing these end points provided you will have to run `rails server` or `rails s` to spin up your localhost url. Then utilizing the base path of `http://localhost:3000/` the end points get supplied at the end of this url and can get the response that the front end desires depending on the type of call.

- `GET /api/v1/forecast?location={location in the US}`
  - For this endpoint it delivers the current forecast as well as the forecast for the next 8 hours as well as the next 5 days. The location can be anywhere in the U.S. as the location can be given as 'denver,co'.
- `GET /api/v1/backgrounds?location={location in the US}`
  - For this endpoint it responds with a list of books dependent on the integer passed into the params of the url. The book is dependent on what you pass into the location. Such as typing in 'Egypt' will get you all the books associated with Egypt. It will show the isbn number as well as the title and author.
- `POST /api/v1/users'`
  - This endpoint is being used a post method to register a user if they supply the correct information into the front end registration page. The information is passed through the body of the request and the params of the url due to security concerns and keeping the users information secure. That information passed is then stored in the database if all requirments are met.
- `POST /api/v1/sessions'`
  - This endpoint is another post method that starts a user session if they already exist in the database. The front end is sending a request to authenticate a user and similar to the registration endpoint the information is getting sent through the body to secure the user. If he user exists and authenticated the response sends the front end an api key for that users authentication.
- `POST /api/v1/road_trip`
  - For the last endpoint it is also a post method due to using an api key to authenticate a registed user and being able to supply whomever the information needed. The frontend is needing information for a road trip for a user which needs a origin location and a destination along with an api key. These are needed to find the best and fastest route for the user via MapQuest API. Again inforamtion is stored in the body of the response to protect users information.


<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/danembb/sweater_weather.svg?style=flat-square
[contributors-url]: https://github.com/danembb/sweater_weather/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/danembb/sweater_weather.svg?style=flat-square
[forks-url]: https://github.com/danembb/sweater_weather/network/members
[stars-shield]: https://img.shields.io/github/stars/danembb/sweater_weather.svg?style=flat-square
[stars-url]: https://github.com/danembb/sweater_weather/stargazers
[issues-shield]: https://img.shields.io/github/issues/danembb/sweater_weather.svg?style=flat-square
[issues-url]: https://github.com/danembb/sweater_weather/issues
[build-badge]: https://img.shields.io/circleci/build/github/danembb/sweater_weather?style=flat-square
