module RenderAsCSV
  def self.included(base)
    base.alias_method_chain :render, :csv
  end

  def render_with_csv(options = nil, extra_options = {}, &block)
    return render_without_csv(options, extra_options, &block) unless options.is_a?(Hash) and options[:csv]
    data = options.delete(:csv)
    style = options.delete(:style) || :default
    type = options.delete(:type) || :csv
    send_data Array(data).to_comma(style), options.merge(:type => type)
  end
end
