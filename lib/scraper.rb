require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    student_array = []
    #name
    #location
    #profile url
    page = Nokogiri::HTML(open(index_url))

    student_list = page.css("div.student-card")
    student_list.each do |student|
      student_hash = {}
      url = student.css("a").first.attributes["href"].value

      name = student.css("h4.student-name").text

      location = student.css("p.student-location").text
      student_hash = {:name => name, :location =>location, :profile_url =>url}
      student_array<<student_hash
    end
    #div #roster-cards-container
    #div #student-card
      #a href
      #div card-text-container
      #h4 #student-name
      #p #student-location
      student_array
  end

  def self.scrape_profile_page(profile_url)
    profile = Nokogiri::HTML(open(profile_url))

    social_urls = profile.css("div.social-icon-container a").collect do |url|
      url.text
    end
    binding.pry

    #profile quote
    #div.profile_quote.text
    #bio
    #div.description-holder p .text
  end

end
