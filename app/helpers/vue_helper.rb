module VueHelper
  def enable_vue_support
    content_for(:vue) do
      html = ''
      html << stylesheet_link_tag('//unpkg.com/element-ui/lib/theme-chalk/index.css')
      html << javascript_include_tag('//unpkg.com/vue/dist/vue.js')
      html << javascript_include_tag('//unpkg.com/element-ui/lib/index.js')
      html.html_safe
    end
  end

  def hello
  	html = 'hello'.html_safe
  end
end