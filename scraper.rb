puts "Hi! Welcome to Substack Scraper v: 1.0."
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
    
    private
    
    def actArticle
        parser.css("article.post")
    end
    
    scraper = Scraper.new
    postTitle = scraper.get_title
    postSubTitle = scraper.get_subtitle
    
    #Need to write output
    puts "What do you want to call this scrape?"
    symTitle = gets.chomp.to_str
    
    $finalArticle = [symTitle => [Title: postTitle, Subtitle: postSubTitle]]

    # puts "What do you want to call this article?"
    # entry = gets.chomp.to_sym
    # title = postTitle
    # subtitle = postSubTitle
    # $finalArticle[title] = subtitle
    # # the_data = JSON.load_file('_data.json')

    # # $finalArticle.each do | entry, title, subtitle| 
    # #     puts "#{entry} #{title}: #{subtitle}" 
    # # end
    
    
    # # [ 
    # #    "Entry" 
    # #         [
    # #             postTitle, 
    # #         ],
    # #     "Title"
    # #         [
    # #             postTitle,
    # #         ],
    # #     "Subtitle"
    # #         [
    # #             postSubTitle,
    # #         ],
    # #     ], 
    # # ]

    

    
 
    
    
        
    
            
    
end

def getDirectory

    dirEX = Dir.exists?("Output")

    case dirEX
    when dirEx = false
        FileUtils.mkdir_p('Output')
        FileUtils.cd('Output') {
            File.write("_data.json", $finalArticle.to_json)
            puts '1st sitch'
        }
        
    when dirEx = true
        FileUtils.cd('Output') {
            File.write("_data.json", $finalArticle.to_json)
            puts '2nd sitch'
        }
    else
        puts "error in write stage"
    end
    
    # if dirEx = false
    #     FileUtils.mkdir_p './Output'
        
    # else
    #     Dir.chdir("Output") do
    #         File.write("_article.yaml", $finalArticle.to_j)
    #     end

    # end

end

getDirectory()