module Jekyll
  module Piesync
    def date_to_string_short(date)
      date.strftime("%d %B")
    end
    def short_post_content(post_content)
      post_content.split('\n\n').count
    end
  end
end

Liquid::Template.register_filter(Jekyll::Piesync)