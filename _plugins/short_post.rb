module Jekyll
  module PiesyncFilters
    def date_to_string_short(date)
      date.strftime("%d %B")
    end

    def short_post_content(post_content)
      # check if the post has 
      # <!-- more -->
      # and split there. Otherwise split on 5 paragraphs
      return excerpt  post_content if has_excerpt post_content
      paragraphs = post_content.split(/^$/)
      size = 0
      p = []
      paragraphs.each do |pp|
        p << pp
        size += 1 if pp.match('<p>')
        break if size >= 5
      end
      p.join
    end

    # Used on the blog index to split posts on the <!--more--> marker
    def excerpt(input)
      if input.index(/<!--\s*more\s*-->/i)
        input.split(/<!--\s*more\s*-->/i)[0]
      else
        input
      end
    end

    # Checks for excerpts (helpful for template conditionals)
    def has_excerpt(input)
      input =~ /<!--\s*more\s*-->/i ? true : false
    end

    # Summary could be used on the Archive pages to return the first block of content from a post.
    def summary(input)
      if input.index(/\n\n/)
        input.split(/\n\n/)[0]
      else
        input
      end
    end

    # Returns a title cased string based on John Gruber's title case http://daringfireball.net/2008/08/title_case_update
    def titlecase(input)
      input.titlecase
    end
  end
end

Liquid::Template.register_filter(Jekyll::PiesyncFilters)

class String
  def titlecase
    small_words = %w(a an and as at but by en for if in of on or the to v v. via vs vs.)

    x = split(" ").map do |word|
      # note: word could contain non-word characters!
      # downcase all small_words, capitalize the rest
      small_words.include?(word.gsub(/\W/, "").downcase) ? word.downcase! : word.smart_capitalize!
      word
    end
    # capitalize first and last words
    x.first.to_s.smart_capitalize!
    x.last.to_s.smart_capitalize!
    # small words are capitalized after colon, period, exclamation mark, question mark
    x.join(" ").gsub(/(:|\.|!|\?)\s?(\W*#{small_words.join("|")}\W*)\s/) { "#{$1} #{$2.smart_capitalize} " }
  end

  def titlecase!
    replace(titlecase)
  end

  def smart_capitalize
    # ignore any leading crazy characters and capitalize the first real character
    if self =~ /^['"\(\[']*([a-z])/
      i = index($1)
      x = self[i,self.length]
      # word with capitals and periods mid-word are left alone
      self[i,1] = self[i,1].upcase unless x =~ /[A-Z]/ or x =~ /\.\w+/
    end
    self
  end

  def smart_capitalize!
    replace(smart_capitalize)
  end
end