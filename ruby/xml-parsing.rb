#! /usr/bin/ruby -w

require "rexml/document"

include REXML

xml = '
<inventory title="OmniCorp Store #45x10^3">
  <section name="health">
    <item upc="123456789" stock="12">
      <name>Invisibility Cream</name>
      <price>14.50</price>
      <description>Makes you invisible</description>
    </item>
    <item upc="445322344" stock="18">
      <name>Levitation Salve</name>
      <price>23.99</price>
      <description>Levitate yourself for up to 3 hours per application</description>
    </item>
  </section>
  <section name="food">
    <item upc="485672034" stock="653">
      <name>Blork and Freen Instameal</name>
      <price>4.95</price>
      <description>A tasty meal in a tablet; just add water</description>
    </item>
    <item upc="132957764" stock="44">
      <name>Grob winglets</name>
      <price>3.56</price>
      <description>Tender winglets of Grob. Just add water</description>
    </item>
  </section>
</inventory>'

doc = Document.new(xml)
doc.elements.each("inventory/section") { |element| puts element.attributes["name"] }
# -> health
# -> food
doc.elements.each("*/section/item") { |element| puts element.attributes["upc"] }
# -> 123456789
# -> 445322344
# -> 485672034
# -> 132957764
root = doc.root
puts root.attributes["title"]
# -> OmniCorp Store #45x10^3
puts root.elements["section/item[@stock='44']"].attributes["upc"]
# -> 132957764
puts root.elements["section"].attributes["name"] 
# -> health (returns the first encountered matching element) 
puts root.elements[1].attributes["name"] 
# -> health (returns the FIRST child element) 


xml2 = '
<?xml version="1.0" encoding="UTF-8"?>
<vars>
  <var type="1" id="1">
    <init>0</init>
    <val>0</val>
    <ts>20170107 09:22:49</ts>
  </var>
  <var type="1" id="2">
    <init>0</init>
    <val>0</val>
    <ts>20170107 09:22:49</ts>
  </var>
</vars>'

root2 = Document.new(xml2).root
puts root2
puts root2.elements['var[@id="2"]']
puts root2.elements['var[@id="2"]'].elements['init']
puts root2.elements['var[@id="2"]'].elements['init'].text

# Elk websocket event
xml3 = "
<Event seqnum='13' sid='uuid:296'>
  <control>_19</control>
  <action>2</action>
  <node/>
  <eventInfo>
    <ae type='3' area='2' val='0'/>
  </eventInfo>
</Event>"


root3 = Document.new(xml3).root
puts root3
puts root3.elements['control']
puts root3.elements['control'].text
puts root3.elements['action'].text

aa = 'control'
bb = '_19'
if root3.elements[aa].text == bb
   puts("#{aa} == #{bb}")
end

aa = 'action'
bb = '2'
if root3.elements[aa].text == bb
   puts("#{aa} == #{bb}")
end
aa = 'eventInfo/ae[@type="3"][@area="2"][@val="0"]'
bb = ''
if root3.elements[aa].text == bb
   puts("#{aa} == #{bb}")
end
