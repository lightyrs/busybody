module BusyBody
  
  require 'rubygems'
  require 'nokogiri'
  require 'httparty'

  def self.pry(name,url)
    begin      
      # Make sure the url is readable by httparty
      unless url.include? 'http://'
        url = url.insert 0, "http://"
      end

      # Skip all of this if we're dealing with a feed
      unless url.downcase =~ /.rss|.xml|libsyn/i
        begin
          doc = Nokogiri.HTML(HTTParty.get(url, 'User-Agent' => 'ruby', :timeout => 15, :limit => 10))
        rescue HTTParty::UnsupportedURIScheme => ex
          dir = ex.message.split("'")[1]
          url = "http://" + pod_site.split("/")[2] + dir
          doc = Nokogiri.HTML(HTTParty.get(url, 'User-Agent' => 'ruby', :timeout => 15, :limit => 10))
        end
        name_fragment = name.split(" ")[0].to_s
        if name_fragment.downcase == "the" or name_fragment.downcase == "a"
          name_fragment = name.split(" ")[1].to_s unless name.split(" ")[1].to_s.nil?
        end
        doc_links = doc.css('a')
      
        # If a social url contains part of the name, grab that.  
        # If not, grab the first one you find within our conditions.  
        # Give Nokogiri some room to breathe with pessimistic StandardError handling.
        begin
          twitter_url = BusyBody.filter(doc_links, "twitter.com", name_fragment, "share|status")
          facebook_url = BusyBody.filter(doc_links, "facebook.com", name_fragment, "share|.event|placement=")
        ensure
          # Ensure that the urls get returned regardless of what else happened
          social_hash = {}
          social_hash['twitter'] = twitter_url
          social_hash['facebook'] = facebook_url
          return social_hash
        end
      end
    rescue StandardError => ex
      # Out of luck :(
    end
  end

  # If a social url contains part of the podcast name, grab that.  
  # If not, grab the first one you find within our conditions.  
  # Give Nokogiri some room to breathe with pessimistic StandardError handling.  
  def self.filter(doc_links, social_network, name_fragment, regex)
    begin
      begin       
        social_links = doc_links.find {|link| link['href'].to_s.match(/#{social_network}/i) and link['href'].to_s.match(/#{name_fragment}/i).to_s != "" unless link['href'].to_s.match(/#{regex}/i)}.attribute('href').to_s 
      rescue StandardError => ex
        if doc_links.find {|link| link['href'].to_s.match(/#{social_network}/i) unless link['href'].to_s.match(/#{regex}/i)}.nil?
          social_links = nil
        else       
          social_links = doc_links.find {|link| link['href'].to_s.match(/#{social_network}/i) unless link['href'].to_s.match(/#{regex}/i)}.attribute('href').to_s
        end
      end
    rescue StandardError => ex
      # Ensure that the urls get saved regardless of what else happens
    ensure
      social_links.to_s   
    end
  end
end