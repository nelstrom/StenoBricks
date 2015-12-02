xml.instruct!
xml.declare! *[
  :DOCTYPE,
  :svg,
  :PUBLIC,
  "-//W3C//DTD SVG 1.1//EN",
  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"
]

bounds ||= DiagramBounds.new

xml.svg({
  "xmlns"       => "http://www.w3.org/2000/svg",
  "xmlns:xlink" => "http://www.w3.org/1999/xlink",
  "xmlns:ev"    => "http://www.w3.org/2001/xml-events",
  "version"     => "1.1",
  "baseProfile" => "full",
  "viewBox"     => bounds.view_box,
}) do

  xml.style :type => "text/css" do
    xml.cdata! File.read('source/stylesheets/diagram.css')
  end

  xml.title current_page.data.title || "Diagram"

  xml.symbol(:id => 'vertical-rule') do
    xml.path(:d => 'M0 0 V 10000')
  end

  (50..(bounds.width-50)).step(50).each do |xpos|
    xml.use(
      'xlink:href' => '#vertical-rule',
      :transform => "translate(#{xpos})",
      :class => 'rule-line'
    )
  end

  xml.symbol(:id => 'horizontal-rule') do
    xml.path(:d => 'M0 0 H 10000')
  end

  (0..bounds.height).step(50).each do |ypos|
    xml.use(
      'xlink:href' => '#horizontal-rule',
      :transform => "translate(0 #{ypos})",
      :class => 'rule-line'
    )
  end

  StenoBrickKit::symbols.each do |s|
    xml.symbol(:id => s[:id]) do
      xml.path(:d => s[:points].map(&:strip).join(' '))
    end
  end

  StenoBrickKit::span_key_symbols.each do |s|
    xml.symbol(:id => s[:id]) do
      xml.path(:d => s[:points].map(&:strip).join(' '))
    end
  end

  xml.g(:transform => "translate(#{Dimensions::HORIZONTAL_UNIT} #{bounds.extra_height})") do
    StenoBrickKit::buttons.each do |button|
      xml.use(
        "xlink:href" => button[:symbol],
        :x => button[:offset] * Dimensions::HORIZONTAL_UNIT,
        :y => 100,
        :class => "stroked #{button[:shade]}Fill"
      )
    end

    StenoBrickKit::labels.each do |label|
      add = -25
      if (label[:right] - label[:left]) == 2
        add = add + Dimensions::HORIZONTAL_UNIT/4
      end

      xml.text(:class => 'buttonLabel', :y => 160, :x => (add + label[:left] * Dimensions::HORIZONTAL_UNIT/2)) do
        xml.tspan(label[:label])
      end
    end

    xml << yield

  end
end
