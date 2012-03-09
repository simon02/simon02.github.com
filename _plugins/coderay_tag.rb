module Jekyll

    require 'coderay'

    class CodeBlock < Liquid::Block

        def initialize(tag_name, lang, tokens)
            @lang = lang.strip.downcase.to_sym
            super
        end

        def render(context)
          # <div> tags makes sure Markdown skips the rendered content
          # replace them with tags based on renderer (ex <notextile> for textile)
          "<div>#{CodeRay.scan(super.strip, @lang).div(:tab_width => 2, :css => :class)}</div>"
        end
    end

end

Liquid::Template.register_tag('code', Jekyll::CodeBlock)