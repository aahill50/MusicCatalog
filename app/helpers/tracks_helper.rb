module TracksHelper
	def ugly_lyrics(lyrics)
		lyrics = lyrics.split("\n")

		ugly_lyrics = ""
		lyrics.each do |line|
			if line == "\r"
				ugly_lyrics += "\r\n"
			else
				ugly_lyrics += "♫ " + h(line) + "\n" 
			end
		end

		"<pre>#{ugly_lyrics.html_safe}</pre>".html_safe
	end
end
