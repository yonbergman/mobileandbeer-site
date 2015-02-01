module Jekyll
  module OctopodFilters
    # Escapes  some text for CDATA
    def cdata_escape(input)
      input.gsub(/<!\[CDATA\[/, '&lt;![CDATA[').gsub(/\]\]>/, ']]&gt;')
    end

    # Replaces relative urls with full urls
    #
    #   {{ "about.html" | expand_urls }}             => "/about.html"
    #   {{ "about.html" | expand_urls:site.url }}  => "http://example.com/about.html"
    def expand_urls(input, url='')
      url ||= '/'
      input.gsub /(\s+(href|src)\s*=\s*["|']{1})(\/[^\"'>]*)/ do
        $1+url+$3
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::OctopodFilters)
