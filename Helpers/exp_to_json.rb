require './Helpers/scraper'

puts "What do you want to call this scrape?"
   
def getDirectory

    symTitle = gets.chomp.to_str
    
    $finalArticle = [symTitle => [Title: $postTitle, Subtitle: $postSubTitle, Copy: $postCopy]]


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