class Apod
  
  def self.get_posts
    response = HTTParty.get("https://api.nasa.gov/planetary/apod?api_key=#{ENV['NASA_API_KEY']}&count=50")
  end


end