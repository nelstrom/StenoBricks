---
layout: false
---
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
  "viewBox"     => "0 0 1000 1000",
}) do
  xml.circle cx: 500, cy: 500, r: 200, style: "fill:green; stroke:black; stroke-width:10"
end
