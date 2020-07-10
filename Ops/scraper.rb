puts "Hi! Welcome to Substack Scraper v: 0.0.2"
puts "What Substack post url are you trying to scrape?"

$subURL = gets.chomp.to_str

class Scraper

attr_accessor :parser

    
    def initialize   
        document = HTTParty.get($subURL)
        @parser ||= Nokogiri::HTML(document)
    end
    
    def get_title
        actArticle.css("h1.post-title").children.map { |title| title.text }.compact
    end
    
    def get_subtitle
        actArticle.css(".subtitle").children.map { |subtitle| subtitle.text }.compact
    end

    def get_copy
        actArticle.css(".body").css("p").children.map { |copy| copy.text }.compact
    end

    private
    
    def actArticle
        parser.css("article.post")
    end
    
    scraper = Scraper.new
    $postTitle = scraper.get_title
    $postSubTitle = scraper.get_subtitle
    $postCopy = scraper.get_copy
    
    # Need to write output
        # Now handled by exp_to_json.rb        
    
end

