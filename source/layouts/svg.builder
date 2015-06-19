xml.instruct!
xml.declare! *[
  :DOCTYPE,
  :svg,
  :PUBLIC,
  "-//W3C//DTD SVG 1.1//EN",
  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"
]

xml.svg({
  "xmlns"       => "http://www.w3.org/2000/svg",
  "xmlns:xlink" => "http://www.w3.org/1999/xlink",
  "xmlns:ev"    => "http://www.w3.org/2001/xml-events",
  "version"     => "1.1",
  "baseProfile" => "full",
  "viewBox"     => (current_page.data.viewBox || "0 0 1000 1000"),
}) do

  xml.style :type => "text/css" do
    xml.cdata! File.read('source/stylesheets/diagram.css')
  end

  xml.title current_page.data.title || "Diagram"

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

  xml.g(:transform => "translate(#{Dimensions::HORIZONTAL_UNIT})") do
    StenoBrickKit::buttons.each do |button|
      xml.use(
        "xlink:href" => button[:symbol],
        :x => button[:offset] * Dimensions::HORIZONTAL_UNIT,
        :y => 50,
        :class => "stroked #{button[:fill]}Fill"
      )
    end

    StenoBrickKit::labels.each do |label|
      add = -25
      if label[:width] == 2
        add = add + Dimensions::HORIZONTAL_UNIT/4
      end

      xml.text(:class => 'buttonLabel', :y => 115, :x => (add + label[:xPosition] * Dimensions::HORIZONTAL_UNIT/2)) do
        xml.tspan(label[:text])
      end
    end

    xml << yield

  end
end
