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

  xml.style do
    xml.cdata! File.read('source/stylesheets/diagram.css')
  end

  xml.title current_page.data.title || "Diagram"
  xml.description current_page.data.description

  xml << yield
end
