module Jekyll
  module ToStringFilter
    def to_string(input)
      input.gsub(/<.+?>/,'')
    end
  end
end

Liquid::Template.register_filter(Jekyll::ToStringFilter)