class Apod
  def self.get_posts(num)
    response = HTTParty.get("https://api.nasa.gov/planetary/apod?api_key=#{ENV["NASA_API_KEY"]}&count=#{num}")
    filteredResponse = []
    response.each do |entry|
      if entry.fetch("media_type") == "image"
        filteredResponse.push(entry)
      end
    end
    return filteredResponse
  end
end
