<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="8.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Arduino-clone">
<description>Arduino Clone pinheaders
By cl@xganon.com
http://www.xganon.com</description>
<packages>
<package name="NANO">
<pad name="TX0" x="5.08" y="-8.89" drill="0.8" shape="long"/>
<pad name="RX1" x="5.08" y="-6.35" drill="0.8" shape="long"/>
<pad name="RST1" x="5.08" y="-3.81" drill="0.8" shape="long"/>
<pad name="GND1" x="5.08" y="-1.27" drill="0.8" shape="long"/>
<pad name="D2" x="5.08" y="1.27" drill="0.8" shape="long"/>
<pad name="D3" x="5.08" y="3.81" drill="0.8" shape="long"/>
<pad name="D4" x="5.08" y="6.35" drill="0.8" shape="long"/>
<pad name="D5" x="5.08" y="8.89" drill="0.8" shape="long"/>
<pad name="D6" x="5.08" y="11.43" drill="0.8" shape="long"/>
<pad name="D7" x="5.08" y="13.97" drill="0.8" shape="long"/>
<pad name="D8" x="5.08" y="16.51" drill="0.8" shape="long"/>
<pad name="D9" x="5.08" y="19.05" drill="0.8" shape="long"/>
<pad name="RAW" x="-10.16" y="-8.89" drill="0.8" shape="long"/>
<pad name="GND" x="-10.16" y="-6.35" drill="0.8" shape="long"/>
<pad name="RST" x="-10.16" y="-3.81" drill="0.8" shape="long"/>
<pad name="A3" x="-10.16" y="11.43" drill="0.8" shape="long"/>
<pad name="A2" x="-10.16" y="13.97" drill="0.8" shape="long"/>
<pad name="A1" x="-10.16" y="16.51" drill="0.8" shape="long"/>
<pad name="A0" x="-10.16" y="19.05" drill="0.8" shape="long"/>
<pad name="D13" x="-10.16" y="26.67" drill="0.8" shape="long"/>
<pad name="D12" x="5.08" y="26.67" drill="0.8" shape="long"/>
<pad name="D11" x="5.08" y="24.13" drill="0.8" shape="long"/>
<pad name="D10" x="5.08" y="21.59" drill="0.8" shape="long"/>
<pad name="3.3V" x="-10.16" y="24.13" drill="0.8" shape="long" rot="R180"/>
<pad name="AREF" x="-10.16" y="21.59" drill="0.8" shape="long" rot="R180"/>
<pad name="5V" x="-10.16" y="-1.27" drill="0.8" shape="long"/>
<pad name="ICSP2" x="-5.08" y="-7.62" drill="0.8" rot="R90"/>
<pad name="ICSP4" x="-2.54" y="-7.62" drill="0.8" rot="R90"/>
<pad name="ICSP6" x="0" y="-7.62" drill="0.8" rot="R90"/>
<pad name="A4" x="-10.16" y="8.89" drill="0.8" shape="long" rot="R180"/>
<pad name="A5" x="-10.16" y="6.35" drill="0.8" shape="long" rot="R180"/>
<pad name="A6" x="-10.16" y="3.81" drill="0.8" shape="long" rot="R180"/>
<pad name="A7" x="-10.16" y="1.27" drill="0.8" shape="long" rot="R180"/>
<pad name="ICSP1" x="-5.08" y="-10.16" drill="0.8" rot="R90"/>
<pad name="ICSP3" x="-2.54" y="-10.16" drill="0.8" rot="R90"/>
<pad name="ICSP5" x="0" y="-10.16" drill="0.8" rot="R90"/>
</package>
</packages>
<symbols>
<symbol name="NANO">
<pin name="3.3V" x="-22.86" y="12.7" visible="pin" length="middle"/>
<pin name="AREF" x="-22.86" y="10.16" visible="pin" length="middle"/>
<pin name="ICSP1" x="-10.16" y="-27.94" visible="off" length="point" rot="R270"/>
<pin name="ICSP2" x="-10.16" y="-25.4" visible="off" length="point" rot="R270"/>
<pin name="ICSP3" x="-7.62" y="-27.94" visible="off" length="point" rot="R270"/>
<pin name="ICSP4" x="-7.62" y="-25.4" visible="off" length="point" rot="R270"/>
<pin name="TX0" x="10.16" y="-20.32" visible="pin" length="middle" rot="R180"/>
<pin name="RX1" x="10.16" y="-17.78" visible="pin" length="middle" rot="R180"/>
<pin name="RST1" x="10.16" y="-15.24" visible="pin" length="middle" rot="R180"/>
<pin name="GND2" x="10.16" y="-12.7" visible="pin" length="middle" rot="R180"/>
<pin name="D2" x="10.16" y="-10.16" visible="pin" length="middle" rot="R180"/>
<pin name="D3" x="10.16" y="-7.62" visible="pin" length="middle" rot="R180"/>
<pin name="D4" x="10.16" y="-5.08" visible="pin" length="middle" rot="R180"/>
<pin name="D5" x="10.16" y="-2.54" visible="pin" length="middle" rot="R180"/>
<pin name="D6" x="10.16" y="0" visible="pin" length="middle" rot="R180"/>
<pin name="D7" x="10.16" y="2.54" visible="pin" length="middle" rot="R180"/>
<pin name="D8" x="10.16" y="5.08" visible="pin" length="middle" rot="R180"/>
<pin name="D9" x="10.16" y="7.62" visible="pin" length="middle" rot="R180"/>
<pin name="RAW" x="-22.86" y="-20.32" visible="pin" length="middle"/>
<pin name="GND" x="-22.86" y="-17.78" visible="pin" length="middle"/>
<pin name="RST" x="-22.86" y="-15.24" visible="pin" length="middle"/>
<pin name="5.5V" x="-22.86" y="-12.7" visible="pin" length="middle"/>
<pin name="A3" x="-22.86" y="0" visible="pin" length="middle"/>
<pin name="A2" x="-22.86" y="2.54" visible="pin" length="middle"/>
<pin name="A1" x="-22.86" y="5.08" visible="pin" length="middle"/>
<pin name="A0" x="-22.86" y="7.62" visible="pin" length="middle"/>
<pin name="D13" x="-22.86" y="15.24" visible="pin" length="middle"/>
<pin name="D12" x="10.16" y="15.24" visible="pin" length="middle" rot="R180"/>
<pin name="D11" x="10.16" y="12.7" visible="pin" length="middle" rot="R180"/>
<pin name="D10" x="10.16" y="10.16" visible="pin" length="middle" rot="R180"/>
<pin name="A7" x="-22.86" y="-10.16" visible="pin" length="middle"/>
<pin name="A6" x="-22.86" y="-7.62" visible="pin" length="middle"/>
<pin name="A5" x="-22.86" y="-5.08" visible="pin" length="middle"/>
<pin name="A4" x="-22.86" y="-2.54" visible="pin" length="middle"/>
<pin name="ICSP5" x="-5.08" y="-27.94" visible="off" length="point" rot="R270"/>
<pin name="ICSP6" x="-5.08" y="-25.4" visible="off" length="point" rot="R270"/>
<wire x1="-17.78" y1="17.78" x2="-17.78" y2="-30.48" width="0.254" layer="94"/>
<wire x1="-17.78" y1="-30.48" x2="5.08" y2="-30.48" width="0.254" layer="94"/>
<wire x1="5.08" y1="-30.48" x2="5.08" y2="17.78" width="0.254" layer="94"/>
<wire x1="5.08" y1="17.78" x2="-17.78" y2="17.78" width="0.254" layer="94"/>
<text x="-12.7" y="20.32" size="1.778" layer="95">Arduino Nano</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="NANO">
<description>Arduino Nano</description>
<gates>
<gate name="G$1" symbol="NANO" x="7.62" y="2.54"/>
</gates>
<devices>
<device name="" package="NANO">
<connects>
<connect gate="G$1" pin="3.3V" pad="3.3V"/>
<connect gate="G$1" pin="5.5V" pad="5V"/>
<connect gate="G$1" pin="A0" pad="A0"/>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="A3" pad="A3"/>
<connect gate="G$1" pin="A4" pad="A4"/>
<connect gate="G$1" pin="A5" pad="A5"/>
<connect gate="G$1" pin="A6" pad="A6"/>
<connect gate="G$1" pin="A7" pad="A7"/>
<connect gate="G$1" pin="AREF" pad="AREF"/>
<connect gate="G$1" pin="D10" pad="D10"/>
<connect gate="G$1" pin="D11" pad="D11"/>
<connect gate="G$1" pin="D12" pad="D12"/>
<connect gate="G$1" pin="D13" pad="D13"/>
<connect gate="G$1" pin="D2" pad="D2"/>
<connect gate="G$1" pin="D3" pad="D3"/>
<connect gate="G$1" pin="D4" pad="D4"/>
<connect gate="G$1" pin="D5" pad="D5"/>
<connect gate="G$1" pin="D6" pad="D6"/>
<connect gate="G$1" pin="D7" pad="D7"/>
<connect gate="G$1" pin="D8" pad="D8"/>
<connect gate="G$1" pin="D9" pad="D9"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="GND2" pad="GND1"/>
<connect gate="G$1" pin="ICSP1" pad="ICSP1"/>
<connect gate="G$1" pin="ICSP2" pad="ICSP2"/>
<connect gate="G$1" pin="ICSP3" pad="ICSP3"/>
<connect gate="G$1" pin="ICSP4" pad="ICSP4"/>
<connect gate="G$1" pin="ICSP5" pad="ICSP5"/>
<connect gate="G$1" pin="ICSP6" pad="ICSP6"/>
<connect gate="G$1" pin="RAW" pad="RAW"/>
<connect gate="G$1" pin="RST" pad="RST"/>
<connect gate="G$1" pin="RST1" pad="RST1"/>
<connect gate="G$1" pin="RX1" pad="RX1"/>
<connect gate="G$1" pin="TX0" pad="TX0"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="st-microelectronics" urn="urn:adsk.eagle:library:368">
<description>&lt;b&gt;ST Microelectronics Devices&lt;/b&gt;&lt;p&gt;
Microcontrollers,  I2C components, linear devices&lt;p&gt;
http://www.st.com&lt;p&gt;
&lt;i&gt;Include st-microelectronics-2.lbr, st-microelectronics-3.lbr.&lt;p&gt;&lt;/i&gt;

&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DIL16" urn="urn:adsk.eagle:footprint:26704/1" library_version="1">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="10.16" y1="2.921" x2="-10.16" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="10.16" y1="2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="2.921" x2="-10.16" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="-10.16" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="1.016" x2="-10.16" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-10.541" y="-2.921" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-7.493" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="DIL16" urn="urn:adsk.eagle:package:26820/1" type="box" library_version="1">
<description>Dual In Line Package</description>
</package3d>
</packages3d>
<symbols>
<symbol name="L293D" urn="urn:adsk.eagle:symbol:26701/1" library_version="1">
<wire x1="-10.16" y1="20.32" x2="-10.16" y2="-20.32" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-20.32" x2="10.16" y2="-20.32" width="0.254" layer="94"/>
<wire x1="10.16" y1="-20.32" x2="10.16" y2="20.32" width="0.254" layer="94"/>
<wire x1="10.16" y1="20.32" x2="-10.16" y2="20.32" width="0.254" layer="94"/>
<text x="-10.16" y="21.336" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-22.86" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1-2EN" x="-15.24" y="17.78" length="middle" direction="in"/>
<pin name="1A" x="-15.24" y="12.7" length="middle" direction="in"/>
<pin name="1Y" x="-15.24" y="7.62" length="middle" direction="out"/>
<pin name="GND1" x="-15.24" y="2.54" length="middle" direction="pwr"/>
<pin name="GND2" x="-15.24" y="-2.54" length="middle" direction="pwr"/>
<pin name="2Y" x="-15.24" y="-7.62" length="middle" direction="out"/>
<pin name="2A" x="-15.24" y="-12.7" length="middle" direction="in"/>
<pin name="VCC2" x="-15.24" y="-17.78" length="middle" direction="pwr"/>
<pin name="VCC1" x="15.24" y="17.78" length="middle" direction="pwr" rot="R180"/>
<pin name="4A" x="15.24" y="12.7" length="middle" direction="in" rot="R180"/>
<pin name="4Y" x="15.24" y="7.62" length="middle" direction="out" rot="R180"/>
<pin name="GND3" x="15.24" y="2.54" length="middle" direction="pwr" rot="R180"/>
<pin name="GND4" x="15.24" y="-2.54" length="middle" direction="pwr" rot="R180"/>
<pin name="3Y" x="15.24" y="-7.62" length="middle" direction="out" rot="R180"/>
<pin name="3A" x="15.24" y="-12.7" length="middle" direction="in" rot="R180"/>
<pin name="3-4EN" x="15.24" y="-17.78" length="middle" direction="in" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="L293D" urn="urn:adsk.eagle:component:26880/1" prefix="IC" library_version="1">
<description>&lt;b&gt;PUSH-PULL 4 CHANNEL DRIVER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="L293D" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DIL16">
<connects>
<connect gate="G$1" pin="1-2EN" pad="1"/>
<connect gate="G$1" pin="1A" pad="2"/>
<connect gate="G$1" pin="1Y" pad="3"/>
<connect gate="G$1" pin="2A" pad="7"/>
<connect gate="G$1" pin="2Y" pad="6"/>
<connect gate="G$1" pin="3-4EN" pad="9"/>
<connect gate="G$1" pin="3A" pad="10"/>
<connect gate="G$1" pin="3Y" pad="11"/>
<connect gate="G$1" pin="4A" pad="15"/>
<connect gate="G$1" pin="4Y" pad="14"/>
<connect gate="G$1" pin="GND1" pad="4"/>
<connect gate="G$1" pin="GND2" pad="5"/>
<connect gate="G$1" pin="GND3" pad="13"/>
<connect gate="G$1" pin="GND4" pad="12"/>
<connect gate="G$1" pin="VCC1" pad="16"/>
<connect gate="G$1" pin="VCC2" pad="8"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:26820/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="L293D" constant="no"/>
<attribute name="OC_FARNELL" value="9589619" constant="no"/>
<attribute name="OC_NEWARK" value="56P8249" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-molex" urn="urn:adsk.eagle:library:165">
<description>&lt;b&gt;Molex Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="87758-4016" library_version="2">
<description>&lt;b&gt;2.00mm Pitch Milli-Grid??? Header, Through Hole, Vertical, 40 Circuits, 0.38??m Gold (Au) Selective Plating, Pocket Tray Packaging, Lead-Free&lt;/b&gt;&lt;p&gt;&lt;a href =http://www.molex.com/pdm_docs/sd/877584016_sd.pdf&gt;Datasheet &lt;/a&gt;</description>
<wire x1="-19.85" y1="-1.9" x2="19.85" y2="-1.9" width="0.2032" layer="21"/>
<wire x1="19.85" y1="-1.9" x2="19.85" y2="-0.4" width="0.2032" layer="21"/>
<wire x1="19.85" y1="0.4" x2="19.85" y2="1.9" width="0.2032" layer="21"/>
<wire x1="19.85" y1="1.9" x2="-19.85" y2="1.9" width="0.2032" layer="21"/>
<wire x1="-19.85" y1="1.9" x2="-19.85" y2="0.4" width="0.2032" layer="21"/>
<wire x1="-19.85" y1="-0.4" x2="-19.85" y2="-1.9" width="0.2032" layer="21"/>
<wire x1="-19.85" y1="0.4" x2="-19.85" y2="-0.4" width="0.2032" layer="21" curve="-129.184564"/>
<wire x1="19.85" y1="-0.4" x2="19.85" y2="0.4" width="0.2032" layer="21" curve="-129.184564"/>
<pad name="1" x="-19" y="-1" drill="0.9" diameter="1.27"/>
<pad name="2" x="-19" y="1" drill="0.9" diameter="1.27"/>
<pad name="3" x="-17" y="-1" drill="0.9" diameter="1.27"/>
<pad name="4" x="-17" y="1" drill="0.9" diameter="1.27"/>
<pad name="5" x="-15" y="-1" drill="0.9" diameter="1.27"/>
<pad name="6" x="-15" y="1" drill="0.9" diameter="1.27"/>
<pad name="7" x="-13" y="-1" drill="0.9" diameter="1.27"/>
<pad name="8" x="-13" y="1" drill="0.9" diameter="1.27"/>
<pad name="9" x="-11" y="-1" drill="0.9" diameter="1.27"/>
<pad name="10" x="-11" y="1" drill="0.9" diameter="1.27"/>
<pad name="11" x="-9" y="-1" drill="0.9" diameter="1.27"/>
<pad name="12" x="-9" y="1" drill="0.9" diameter="1.27"/>
<pad name="13" x="-7" y="-1" drill="0.9" diameter="1.27"/>
<pad name="14" x="-7" y="1" drill="0.9" diameter="1.27"/>
<pad name="15" x="-5" y="-1" drill="0.9" diameter="1.27"/>
<pad name="16" x="-5" y="1" drill="0.9" diameter="1.27"/>
<pad name="17" x="-3" y="-1" drill="0.9" diameter="1.27"/>
<pad name="18" x="-3" y="1" drill="0.9" diameter="1.27"/>
<pad name="19" x="-1" y="-1" drill="0.9" diameter="1.27"/>
<pad name="20" x="-1" y="1" drill="0.9" diameter="1.27"/>
<pad name="21" x="1" y="-1" drill="0.9" diameter="1.27"/>
<pad name="22" x="1" y="1" drill="0.9" diameter="1.27"/>
<pad name="23" x="3" y="-1" drill="0.9" diameter="1.27"/>
<pad name="24" x="3" y="1" drill="0.9" diameter="1.27"/>
<pad name="25" x="5" y="-1" drill="0.9" diameter="1.27"/>
<pad name="26" x="5" y="1" drill="0.9" diameter="1.27"/>
<pad name="27" x="7" y="-1" drill="0.9" diameter="1.27"/>
<pad name="28" x="7" y="1" drill="0.9" diameter="1.27"/>
<pad name="29" x="9" y="-1" drill="0.9" diameter="1.27"/>
<pad name="30" x="9" y="1" drill="0.9" diameter="1.27"/>
<pad name="31" x="11" y="-1" drill="0.9" diameter="1.27"/>
<pad name="32" x="11" y="1" drill="0.9" diameter="1.27"/>
<pad name="33" x="13" y="-1" drill="0.9" diameter="1.27"/>
<pad name="34" x="13" y="1" drill="0.9" diameter="1.27"/>
<pad name="35" x="15" y="-1" drill="0.9" diameter="1.27"/>
<pad name="36" x="15" y="1" drill="0.9" diameter="1.27"/>
<pad name="37" x="17" y="-1" drill="0.9" diameter="1.27"/>
<pad name="38" x="17" y="1" drill="0.9" diameter="1.27"/>
<pad name="39" x="19" y="-1" drill="0.9" diameter="1.27"/>
<pad name="40" x="19" y="1" drill="0.9" diameter="1.27"/>
<text x="-19.65" y="-1.75" size="0.3048" layer="21" font="vector">1</text>
<text x="-19.62" y="-3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-13.27" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-19.25" y1="-1.25" x2="-18.75" y2="-0.75" layer="51"/>
<rectangle x1="-19.25" y1="0.75" x2="-18.75" y2="1.25" layer="51"/>
<rectangle x1="-17.25" y1="-1.25" x2="-16.75" y2="-0.75" layer="51"/>
<rectangle x1="-17.25" y1="0.75" x2="-16.75" y2="1.25" layer="51"/>
<rectangle x1="-15.25" y1="-1.25" x2="-14.75" y2="-0.75" layer="51"/>
<rectangle x1="-15.25" y1="0.75" x2="-14.75" y2="1.25" layer="51"/>
<rectangle x1="-13.25" y1="-1.25" x2="-12.75" y2="-0.75" layer="51"/>
<rectangle x1="-13.25" y1="0.75" x2="-12.75" y2="1.25" layer="51"/>
<rectangle x1="-11.25" y1="-1.25" x2="-10.75" y2="-0.75" layer="51"/>
<rectangle x1="-11.25" y1="0.75" x2="-10.75" y2="1.25" layer="51"/>
<rectangle x1="-9.25" y1="-1.25" x2="-8.75" y2="-0.75" layer="51"/>
<rectangle x1="-9.25" y1="0.75" x2="-8.75" y2="1.25" layer="51"/>
<rectangle x1="-7.25" y1="-1.25" x2="-6.75" y2="-0.75" layer="51"/>
<rectangle x1="-7.25" y1="0.75" x2="-6.75" y2="1.25" layer="51"/>
<rectangle x1="-5.25" y1="-1.25" x2="-4.75" y2="-0.75" layer="51"/>
<rectangle x1="-5.25" y1="0.75" x2="-4.75" y2="1.25" layer="51"/>
<rectangle x1="-3.25" y1="-1.25" x2="-2.75" y2="-0.75" layer="51"/>
<rectangle x1="-3.25" y1="0.75" x2="-2.75" y2="1.25" layer="51"/>
<rectangle x1="-1.25" y1="-1.25" x2="-0.75" y2="-0.75" layer="51"/>
<rectangle x1="-1.25" y1="0.75" x2="-0.75" y2="1.25" layer="51"/>
<rectangle x1="0.75" y1="-1.25" x2="1.25" y2="-0.75" layer="51"/>
<rectangle x1="0.75" y1="0.75" x2="1.25" y2="1.25" layer="51"/>
<rectangle x1="2.75" y1="-1.25" x2="3.25" y2="-0.75" layer="51"/>
<rectangle x1="2.75" y1="0.75" x2="3.25" y2="1.25" layer="51"/>
<rectangle x1="4.75" y1="-1.25" x2="5.25" y2="-0.75" layer="51"/>
<rectangle x1="4.75" y1="0.75" x2="5.25" y2="1.25" layer="51"/>
<rectangle x1="6.75" y1="-1.25" x2="7.25" y2="-0.75" layer="51"/>
<rectangle x1="6.75" y1="0.75" x2="7.25" y2="1.25" layer="51"/>
<rectangle x1="8.75" y1="-1.25" x2="9.25" y2="-0.75" layer="51"/>
<rectangle x1="8.75" y1="0.75" x2="9.25" y2="1.25" layer="51"/>
<rectangle x1="10.75" y1="-1.25" x2="11.25" y2="-0.75" layer="51"/>
<rectangle x1="10.75" y1="0.75" x2="11.25" y2="1.25" layer="51"/>
<rectangle x1="12.75" y1="-1.25" x2="13.25" y2="-0.75" layer="51"/>
<rectangle x1="12.75" y1="0.75" x2="13.25" y2="1.25" layer="51"/>
<rectangle x1="14.75" y1="-1.25" x2="15.25" y2="-0.75" layer="51"/>
<rectangle x1="14.75" y1="0.75" x2="15.25" y2="1.25" layer="51"/>
<rectangle x1="16.75" y1="-1.25" x2="17.25" y2="-0.75" layer="51"/>
<rectangle x1="16.75" y1="0.75" x2="17.25" y2="1.25" layer="51"/>
<rectangle x1="18.75" y1="-1.25" x2="19.25" y2="-0.75" layer="51"/>
<rectangle x1="18.75" y1="0.75" x2="19.25" y2="1.25" layer="51"/>
</package>
<package name="87758-1616" library_version="2">
<description>&lt;b&gt;2.00mm Pitch Milli-Grid??? Header, Through Hole, Vertical, 16 Circuits, 0.38??m Gold (Au) Selective Plating, Pocket Tray Packaging, Lead-Free&lt;/b&gt;&lt;p&gt;&lt;a href =http://www.molex.com/pdm_docs/sd/877581616_sd.pdf&gt;Datasheet &lt;/a&gt;</description>
<wire x1="-7.85" y1="-1.9" x2="7.85" y2="-1.9" width="0.2032" layer="21"/>
<wire x1="7.85" y1="-1.9" x2="7.85" y2="-0.4" width="0.2032" layer="21"/>
<wire x1="7.85" y1="0.4" x2="7.85" y2="1.9" width="0.2032" layer="21"/>
<wire x1="7.85" y1="1.9" x2="-7.85" y2="1.9" width="0.2032" layer="21"/>
<wire x1="-7.85" y1="1.9" x2="-7.85" y2="0.4" width="0.2032" layer="21"/>
<wire x1="-7.85" y1="-0.4" x2="-7.85" y2="-1.9" width="0.2032" layer="21"/>
<wire x1="-7.85" y1="0.4" x2="-7.85" y2="-0.4" width="0.2032" layer="21" curve="-129.184564"/>
<wire x1="7.85" y1="-0.4" x2="7.85" y2="0.4" width="0.2032" layer="21" curve="-129.184564"/>
<pad name="1" x="-7" y="-1" drill="0.9" diameter="1.27"/>
<pad name="2" x="-7" y="1" drill="0.9" diameter="1.27"/>
<pad name="3" x="-5" y="-1" drill="0.9" diameter="1.27"/>
<pad name="4" x="-5" y="1" drill="0.9" diameter="1.27"/>
<pad name="5" x="-3" y="-1" drill="0.9" diameter="1.27"/>
<pad name="6" x="-3" y="1" drill="0.9" diameter="1.27"/>
<pad name="7" x="-1" y="-1" drill="0.9" diameter="1.27"/>
<pad name="8" x="-1" y="1" drill="0.9" diameter="1.27"/>
<pad name="9" x="1" y="-1" drill="0.9" diameter="1.27"/>
<pad name="10" x="1" y="1" drill="0.9" diameter="1.27"/>
<pad name="11" x="3" y="-1" drill="0.9" diameter="1.27"/>
<pad name="12" x="3" y="1" drill="0.9" diameter="1.27"/>
<pad name="13" x="5" y="-1" drill="0.9" diameter="1.27"/>
<pad name="14" x="5" y="1" drill="0.9" diameter="1.27"/>
<pad name="15" x="7" y="-1" drill="0.9" diameter="1.27"/>
<pad name="16" x="7" y="1" drill="0.9" diameter="1.27"/>
<text x="-7.65" y="-1.75" size="0.3048" layer="21" font="vector">1</text>
<text x="6.025" y="1.45" size="0.3048" layer="21" font="vector">16</text>
<text x="-7.62" y="-3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-7.25" y1="-1.25" x2="-6.75" y2="-0.75" layer="51"/>
<rectangle x1="-7.25" y1="0.75" x2="-6.75" y2="1.25" layer="51"/>
<rectangle x1="-5.25" y1="-1.25" x2="-4.75" y2="-0.75" layer="51"/>
<rectangle x1="-5.25" y1="0.75" x2="-4.75" y2="1.25" layer="51"/>
<rectangle x1="-3.25" y1="-1.25" x2="-2.75" y2="-0.75" layer="51"/>
<rectangle x1="-3.25" y1="0.75" x2="-2.75" y2="1.25" layer="51"/>
<rectangle x1="-1.25" y1="-1.25" x2="-0.75" y2="-0.75" layer="51"/>
<rectangle x1="-1.25" y1="0.75" x2="-0.75" y2="1.25" layer="51"/>
<rectangle x1="0.75" y1="-1.25" x2="1.25" y2="-0.75" layer="51"/>
<rectangle x1="0.75" y1="0.75" x2="1.25" y2="1.25" layer="51"/>
<rectangle x1="2.75" y1="-1.25" x2="3.25" y2="-0.75" layer="51"/>
<rectangle x1="2.75" y1="0.75" x2="3.25" y2="1.25" layer="51"/>
<rectangle x1="4.75" y1="-1.25" x2="5.25" y2="-0.75" layer="51"/>
<rectangle x1="4.75" y1="0.75" x2="5.25" y2="1.25" layer="51"/>
<rectangle x1="6.75" y1="-1.25" x2="7.25" y2="-0.75" layer="51"/>
<rectangle x1="6.75" y1="0.75" x2="7.25" y2="1.25" layer="51"/>
</package>
<package name="87758-0816" library_version="2">
<description>&lt;b&gt;2.00mm Pitch Milli-Grid??? Header, Through Hole, Vertical, 8 Circuits, 0.38??m Gold (Au) Selective Plating, Pocket Tray Packaging, Lead-Free&lt;/b&gt;&lt;p&gt;&lt;a href =http://www.molex.com/pdm_docs/sd/877580816_sd.pdf&gt;Datasheet &lt;/a&gt;</description>
<wire x1="-3.85" y1="-1.9" x2="3.85" y2="-1.9" width="0.2032" layer="21"/>
<wire x1="3.85" y1="-1.9" x2="3.85" y2="-0.4" width="0.2032" layer="21"/>
<wire x1="3.85" y1="0.4" x2="3.85" y2="1.9" width="0.2032" layer="21"/>
<wire x1="3.85" y1="1.9" x2="-3.85" y2="1.9" width="0.2032" layer="21"/>
<wire x1="-3.85" y1="1.9" x2="-3.85" y2="0.4" width="0.2032" layer="21"/>
<wire x1="-3.85" y1="-0.4" x2="-3.85" y2="-1.9" width="0.2032" layer="21"/>
<wire x1="-3.85" y1="0.4" x2="-3.85" y2="-0.4" width="0.2032" layer="21" curve="-129.184564"/>
<wire x1="3.85" y1="-0.4" x2="3.85" y2="0.4" width="0.2032" layer="21" curve="-129.184564"/>
<pad name="1" x="-3" y="-1" drill="0.9" diameter="1.27"/>
<pad name="2" x="-3" y="1" drill="0.9" diameter="1.27"/>
<pad name="3" x="-1" y="-1" drill="0.9" diameter="1.27"/>
<pad name="4" x="-1" y="1" drill="0.9" diameter="1.27"/>
<pad name="5" x="1" y="-1" drill="0.9" diameter="1.27"/>
<pad name="6" x="1" y="1" drill="0.9" diameter="1.27"/>
<pad name="7" x="3" y="-1" drill="0.9" diameter="1.27"/>
<pad name="8" x="3" y="1" drill="0.9" diameter="1.27"/>
<text x="-3.65" y="-1.75" size="0.3048" layer="21" font="vector">1</text>
<text x="-3.62" y="-3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.62" y="2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.25" y1="-1.25" x2="-2.75" y2="-0.75" layer="51"/>
<rectangle x1="-3.25" y1="0.75" x2="-2.75" y2="1.25" layer="51"/>
<rectangle x1="-1.25" y1="-1.25" x2="-0.75" y2="-0.75" layer="51"/>
<rectangle x1="-1.25" y1="0.75" x2="-0.75" y2="1.25" layer="51"/>
<rectangle x1="0.75" y1="-1.25" x2="1.25" y2="-0.75" layer="51"/>
<rectangle x1="0.75" y1="0.75" x2="1.25" y2="1.25" layer="51"/>
<rectangle x1="2.75" y1="-1.25" x2="3.25" y2="-0.75" layer="51"/>
<rectangle x1="2.75" y1="0.75" x2="3.25" y2="1.25" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="MV" library_version="2">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-0.762" y="1.397" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M" library_version="2">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="87758-4016" prefix="X" library_version="2">
<description>&lt;b&gt;40 Pin - 2mm Dual Row Single Wafer, Vertical T/H HDR&lt;/b&gt;&lt;p&gt;
Source: http://www.molex.com/pdm_docs/sd/877580616_sd.pdf</description>
<gates>
<gate name="-1" symbol="MV" x="-10.16" y="30.48" addlevel="always"/>
<gate name="-2" symbol="MV" x="10.16" y="30.48" addlevel="always"/>
<gate name="-3" symbol="M" x="-10.16" y="27.94" addlevel="always"/>
<gate name="-4" symbol="M" x="10.16" y="27.94" addlevel="always"/>
<gate name="-5" symbol="M" x="-10.16" y="25.4" addlevel="always"/>
<gate name="-6" symbol="M" x="10.16" y="25.4" addlevel="always"/>
<gate name="-7" symbol="M" x="-10.16" y="22.86" addlevel="always"/>
<gate name="-8" symbol="M" x="10.16" y="22.86" addlevel="always"/>
<gate name="-9" symbol="M" x="-10.16" y="20.32" addlevel="always"/>
<gate name="-10" symbol="M" x="10.16" y="20.32" addlevel="always"/>
<gate name="-11" symbol="M" x="-10.16" y="17.78" addlevel="always"/>
<gate name="-12" symbol="M" x="10.16" y="17.78" addlevel="always"/>
<gate name="-13" symbol="M" x="-10.16" y="15.24" addlevel="always"/>
<gate name="-14" symbol="M" x="10.16" y="15.24" addlevel="always"/>
<gate name="-15" symbol="M" x="-10.16" y="12.7" addlevel="always"/>
<gate name="-16" symbol="M" x="10.16" y="12.7" addlevel="always"/>
<gate name="-17" symbol="M" x="-10.16" y="10.16" addlevel="always"/>
<gate name="-18" symbol="M" x="10.16" y="10.16" addlevel="always"/>
<gate name="-19" symbol="M" x="-10.16" y="7.62" addlevel="always"/>
<gate name="-20" symbol="M" x="10.16" y="7.62" addlevel="always"/>
<gate name="-21" symbol="M" x="-10.16" y="5.08" addlevel="always"/>
<gate name="-22" symbol="M" x="10.16" y="5.08" addlevel="always"/>
<gate name="-23" symbol="M" x="-10.16" y="2.54" addlevel="always"/>
<gate name="-24" symbol="M" x="10.16" y="2.54" addlevel="always"/>
<gate name="-25" symbol="M" x="-10.16" y="0" addlevel="always"/>
<gate name="-26" symbol="M" x="10.16" y="0" addlevel="always"/>
<gate name="-27" symbol="M" x="-10.16" y="-2.54" addlevel="always"/>
<gate name="-28" symbol="M" x="10.16" y="-2.54" addlevel="always"/>
<gate name="-29" symbol="M" x="-10.16" y="-5.08" addlevel="always"/>
<gate name="-30" symbol="M" x="10.16" y="-5.08" addlevel="always"/>
<gate name="-31" symbol="M" x="-10.16" y="-7.62" addlevel="always"/>
<gate name="-32" symbol="M" x="10.16" y="-7.62" addlevel="always"/>
<gate name="-33" symbol="M" x="-10.16" y="-10.16" addlevel="always"/>
<gate name="-34" symbol="M" x="10.16" y="-10.16" addlevel="always"/>
<gate name="-35" symbol="M" x="-10.16" y="-12.7" addlevel="always"/>
<gate name="-36" symbol="M" x="10.16" y="-12.7" addlevel="always"/>
<gate name="-37" symbol="M" x="-10.16" y="-15.24" addlevel="always"/>
<gate name="-38" symbol="M" x="10.16" y="-15.24" addlevel="always"/>
<gate name="-39" symbol="M" x="-10.16" y="-17.78" addlevel="always"/>
<gate name="-40" symbol="M" x="10.16" y="-17.78" addlevel="always"/>
</gates>
<devices>
<device name="" package="87758-4016">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-11" pin="S" pad="11"/>
<connect gate="-12" pin="S" pad="12"/>
<connect gate="-13" pin="S" pad="13"/>
<connect gate="-14" pin="S" pad="14"/>
<connect gate="-15" pin="S" pad="15"/>
<connect gate="-16" pin="S" pad="16"/>
<connect gate="-17" pin="S" pad="17"/>
<connect gate="-18" pin="S" pad="18"/>
<connect gate="-19" pin="S" pad="19"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-20" pin="S" pad="20"/>
<connect gate="-21" pin="S" pad="21"/>
<connect gate="-22" pin="S" pad="22"/>
<connect gate="-23" pin="S" pad="23"/>
<connect gate="-24" pin="S" pad="24"/>
<connect gate="-25" pin="S" pad="25"/>
<connect gate="-26" pin="S" pad="26"/>
<connect gate="-27" pin="S" pad="27"/>
<connect gate="-28" pin="S" pad="28"/>
<connect gate="-29" pin="S" pad="29"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-30" pin="S" pad="30"/>
<connect gate="-31" pin="S" pad="31"/>
<connect gate="-32" pin="S" pad="32"/>
<connect gate="-33" pin="S" pad="33"/>
<connect gate="-34" pin="S" pad="34"/>
<connect gate="-35" pin="S" pad="35"/>
<connect gate="-36" pin="S" pad="36"/>
<connect gate="-37" pin="S" pad="37"/>
<connect gate="-38" pin="S" pad="38"/>
<connect gate="-39" pin="S" pad="39"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-40" pin="S" pad="40"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MPN" value="87758-4016" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="25M5691" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="87758-1616" prefix="X" library_version="2">
<description>&lt;b&gt;16 Pin - 2mm Dual Row Single Wafer, Vertical T/H HDR&lt;/b&gt;&lt;p&gt;
Source: http://www.molex.com/pdm_docs/sd/877580616_sd.pdf</description>
<gates>
<gate name="-1" symbol="MV" x="-7.62" y="7.62" addlevel="always"/>
<gate name="-2" symbol="MV" x="10.16" y="7.62" addlevel="always"/>
<gate name="-3" symbol="M" x="-7.62" y="5.08" addlevel="always"/>
<gate name="-4" symbol="M" x="10.16" y="5.08" addlevel="always"/>
<gate name="-5" symbol="M" x="-7.62" y="2.54" addlevel="always"/>
<gate name="-6" symbol="M" x="10.16" y="2.54" addlevel="always"/>
<gate name="-7" symbol="M" x="-7.62" y="0" addlevel="always"/>
<gate name="-8" symbol="M" x="10.16" y="0" addlevel="always"/>
<gate name="-9" symbol="M" x="-7.62" y="-2.54" addlevel="always"/>
<gate name="-10" symbol="M" x="10.16" y="-2.54" addlevel="always"/>
<gate name="-11" symbol="M" x="-7.62" y="-5.08" addlevel="always"/>
<gate name="-12" symbol="M" x="10.16" y="-5.08" addlevel="always"/>
<gate name="-13" symbol="M" x="-7.62" y="-7.62" addlevel="always"/>
<gate name="-14" symbol="M" x="10.16" y="-7.62" addlevel="always"/>
<gate name="-15" symbol="M" x="-7.62" y="-10.16" addlevel="always"/>
<gate name="-16" symbol="M" x="10.16" y="-10.16" addlevel="always"/>
</gates>
<devices>
<device name="" package="87758-1616">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-11" pin="S" pad="11"/>
<connect gate="-12" pin="S" pad="12"/>
<connect gate="-13" pin="S" pad="13"/>
<connect gate="-14" pin="S" pad="14"/>
<connect gate="-15" pin="S" pad="15"/>
<connect gate="-16" pin="S" pad="16"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MPN" value="87758-1616" constant="no"/>
<attribute name="OC_FARNELL" value="7472366" constant="no"/>
<attribute name="OC_NEWARK" value="59J1563" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="87758-0816" prefix="X" library_version="2">
<description>&lt;b&gt;8 Pin - 2mm Dual Row Single Wafer, Vertical T/H HDR&lt;/b&gt;&lt;p&gt;
Source: http://www.molex.com/pdm_docs/sd/877580616_sd.pdf</description>
<gates>
<gate name="-1" symbol="MV" x="-10.16" y="30.48" addlevel="always"/>
<gate name="-2" symbol="MV" x="10.16" y="30.48" addlevel="always"/>
<gate name="-3" symbol="M" x="-10.16" y="27.94" addlevel="always"/>
<gate name="-4" symbol="M" x="10.16" y="27.94" addlevel="always"/>
<gate name="-5" symbol="M" x="-10.16" y="25.4" addlevel="always"/>
<gate name="-6" symbol="M" x="10.16" y="25.4" addlevel="always"/>
<gate name="-7" symbol="M" x="-10.16" y="22.86" addlevel="always"/>
<gate name="-8" symbol="M" x="10.16" y="22.86" addlevel="always"/>
</gates>
<devices>
<device name="" package="87758-0816">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MPN" value="87758-0816" constant="no"/>
<attribute name="OC_FARNELL" value="7472331" constant="no"/>
<attribute name="OC_NEWARK" value="59J1556" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-garry" urn="urn:adsk.eagle:library:147">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;a href="www.mpe-connector.de"&gt;Menufacturer&lt;/a&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="332-02" urn="urn:adsk.eagle:footprint:6784/1" library_version="1">
<description>&lt;b&gt;2 Pin - 2mm Dual Row&lt;/b&gt;&lt;p&gt;
Source: www.mpe-connector.de / garry_shortform_2012.pdf</description>
<wire x1="-0.85" y1="-1.9" x2="0.85" y2="-1.9" width="0.2032" layer="21"/>
<wire x1="0.85" y1="-1.9" x2="0.85" y2="-0.4" width="0.2032" layer="21"/>
<wire x1="0.85" y1="0.4" x2="0.85" y2="1.9" width="0.2032" layer="21"/>
<wire x1="0.85" y1="1.9" x2="-0.85" y2="1.9" width="0.2032" layer="21"/>
<wire x1="-0.85" y1="1.9" x2="-0.85" y2="0.4" width="0.2032" layer="21"/>
<wire x1="-0.85" y1="-0.4" x2="-0.85" y2="-1.9" width="0.2032" layer="21"/>
<wire x1="-0.85" y1="0.4" x2="-0.85" y2="-0.4" width="0.2032" layer="21" curve="-129.185"/>
<wire x1="0.85" y1="-0.4" x2="0.85" y2="0.4" width="0.2032" layer="21" curve="-129.185"/>
<pad name="1" x="0" y="-1" drill="0.9" diameter="1.27"/>
<pad name="2" x="0" y="1" drill="0.9" diameter="1.27"/>
<text x="-0.65" y="-1.75" size="0.3048" layer="21" font="vector">1</text>
<text x="-0.62" y="-3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.62" y="2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.25" y1="-1.25" x2="0.25" y2="-0.75" layer="51"/>
<rectangle x1="-0.25" y1="0.75" x2="0.25" y2="1.25" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="332-02" urn="urn:adsk.eagle:package:6810/1" type="box" library_version="1">
<description>2 Pin - 2mm Dual Row
Source: www.mpe-connector.de / garry_shortform_2012.pdf</description>
</package3d>
</packages3d>
<symbols>
<symbol name="MV" urn="urn:adsk.eagle:symbol:6783/1" library_version="1">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-0.762" y="1.397" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="332-02" urn="urn:adsk.eagle:component:6832/1" prefix="X" library_version="1">
<description>&lt;b&gt;2 Pin - 2mm Dual Row&lt;/b&gt;&lt;p&gt;
Source: www.mpe-connector.de / garry_shortform_2012.pdf</description>
<gates>
<gate name="-1" symbol="MV" x="-10.16" y="0" addlevel="always"/>
<gate name="-2" symbol="MV" x="10.16" y="0" addlevel="always"/>
</gates>
<devices>
<device name="" package="332-02">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:6810/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$1" library="Arduino-clone" deviceset="NANO" device=""/>
<part name="IC1" library="st-microelectronics" library_urn="urn:adsk.eagle:library:368" deviceset="L293D" device="" package3d_urn="urn:adsk.eagle:package:26820/1"/>
<part name="PIN" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="87758-4016" device=""/>
<part name="X1" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="87758-1616" device=""/>
<part name="X2" library="con-garry" library_urn="urn:adsk.eagle:library:147" deviceset="332-02" device="" package3d_urn="urn:adsk.eagle:package:6810/1"/>
<part name="X3" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="87758-0816" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="30.48" y="50.8"/>
<instance part="IC1" gate="G$1" x="78.74" y="48.26"/>
<instance part="PIN" gate="-1" x="-43.18" y="81.28"/>
<instance part="PIN" gate="-2" x="-22.86" y="81.28"/>
<instance part="PIN" gate="-3" x="-43.18" y="78.74"/>
<instance part="PIN" gate="-4" x="-22.86" y="78.74"/>
<instance part="PIN" gate="-5" x="-43.18" y="76.2"/>
<instance part="PIN" gate="-6" x="-22.86" y="76.2"/>
<instance part="PIN" gate="-7" x="-43.18" y="73.66"/>
<instance part="PIN" gate="-8" x="-22.86" y="73.66"/>
<instance part="PIN" gate="-9" x="-43.18" y="71.12"/>
<instance part="PIN" gate="-10" x="-22.86" y="71.12"/>
<instance part="PIN" gate="-11" x="-43.18" y="68.58"/>
<instance part="PIN" gate="-12" x="-22.86" y="68.58"/>
<instance part="PIN" gate="-13" x="-43.18" y="66.04"/>
<instance part="PIN" gate="-14" x="-22.86" y="66.04"/>
<instance part="PIN" gate="-15" x="-43.18" y="63.5"/>
<instance part="PIN" gate="-16" x="-22.86" y="63.5"/>
<instance part="PIN" gate="-17" x="-43.18" y="60.96"/>
<instance part="PIN" gate="-18" x="-22.86" y="60.96"/>
<instance part="PIN" gate="-19" x="-43.18" y="58.42"/>
<instance part="PIN" gate="-20" x="-22.86" y="58.42"/>
<instance part="PIN" gate="-21" x="-43.18" y="55.88"/>
<instance part="PIN" gate="-22" x="-22.86" y="55.88"/>
<instance part="PIN" gate="-23" x="-43.18" y="53.34"/>
<instance part="PIN" gate="-24" x="-22.86" y="53.34"/>
<instance part="PIN" gate="-25" x="-43.18" y="50.8"/>
<instance part="PIN" gate="-26" x="-22.86" y="50.8"/>
<instance part="PIN" gate="-27" x="-43.18" y="48.26"/>
<instance part="PIN" gate="-28" x="-22.86" y="48.26"/>
<instance part="PIN" gate="-29" x="-43.18" y="45.72"/>
<instance part="PIN" gate="-30" x="-22.86" y="45.72"/>
<instance part="PIN" gate="-31" x="-43.18" y="43.18"/>
<instance part="PIN" gate="-32" x="-22.86" y="43.18"/>
<instance part="PIN" gate="-33" x="-43.18" y="40.64"/>
<instance part="PIN" gate="-34" x="-22.86" y="40.64"/>
<instance part="PIN" gate="-35" x="-43.18" y="38.1"/>
<instance part="PIN" gate="-36" x="-22.86" y="38.1"/>
<instance part="PIN" gate="-37" x="-43.18" y="35.56"/>
<instance part="PIN" gate="-38" x="-22.86" y="35.56"/>
<instance part="PIN" gate="-39" x="-43.18" y="33.02"/>
<instance part="PIN" gate="-40" x="-22.86" y="33.02"/>
<instance part="X1" gate="-1" x="10.16" y="104.14"/>
<instance part="X1" gate="-2" x="27.94" y="104.14"/>
<instance part="X1" gate="-3" x="10.16" y="101.6"/>
<instance part="X1" gate="-4" x="27.94" y="101.6"/>
<instance part="X1" gate="-5" x="10.16" y="99.06"/>
<instance part="X1" gate="-6" x="27.94" y="99.06"/>
<instance part="X1" gate="-7" x="10.16" y="96.52"/>
<instance part="X1" gate="-8" x="27.94" y="96.52"/>
<instance part="X1" gate="-9" x="10.16" y="93.98"/>
<instance part="X1" gate="-10" x="27.94" y="93.98"/>
<instance part="X1" gate="-11" x="10.16" y="91.44"/>
<instance part="X1" gate="-12" x="27.94" y="91.44"/>
<instance part="X1" gate="-13" x="10.16" y="88.9"/>
<instance part="X1" gate="-14" x="27.94" y="88.9"/>
<instance part="X1" gate="-15" x="10.16" y="86.36"/>
<instance part="X1" gate="-16" x="27.94" y="86.36"/>
<instance part="X2" gate="-1" x="55.88" y="104.14"/>
<instance part="X2" gate="-2" x="76.2" y="104.14"/>
<instance part="X3" gate="-1" x="53.34" y="93.98"/>
<instance part="X3" gate="-2" x="73.66" y="93.98"/>
<instance part="X3" gate="-3" x="53.34" y="91.44"/>
<instance part="X3" gate="-4" x="73.66" y="91.44"/>
<instance part="X3" gate="-5" x="53.34" y="88.9"/>
<instance part="X3" gate="-6" x="73.66" y="88.9"/>
<instance part="X3" gate="-7" x="53.34" y="86.36"/>
<instance part="X3" gate="-8" x="73.66" y="86.36"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="GND"/>
<wire x1="7.62" y1="33.02" x2="0" y2="33.02" width="0.1524" layer="91"/>
<label x="-5.08" y="33.02" size="1.778" layer="95"/>
</segment>
<segment>
<label x="55.88" y="50.8" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="GND1"/>
<wire x1="63.5" y1="50.8" x2="55.88" y2="50.8" width="0.1524" layer="91"/>
<junction x="63.5" y="50.8"/>
</segment>
<segment>
<pinref part="X1" gate="-1" pin="S"/>
<wire x1="7.62" y1="104.14" x2="5.08" y2="104.14" width="0.1524" layer="91"/>
<label x="2.54" y="104.14" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-3" pin="S"/>
<wire x1="7.62" y1="101.6" x2="5.08" y2="101.6" width="0.1524" layer="91"/>
<label x="2.54" y="101.6" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-5" pin="S"/>
<wire x1="7.62" y1="99.06" x2="5.08" y2="99.06" width="0.1524" layer="91"/>
<label x="2.54" y="99.06" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-7" pin="S"/>
<wire x1="7.62" y1="96.52" x2="5.08" y2="96.52" width="0.1524" layer="91"/>
<label x="2.54" y="96.52" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-9" pin="S"/>
<wire x1="7.62" y1="93.98" x2="2.54" y2="93.98" width="0.1524" layer="91"/>
<label x="2.54" y="93.98" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-11" pin="S"/>
<wire x1="7.62" y1="91.44" x2="2.54" y2="91.44" width="0.1524" layer="91"/>
<label x="2.54" y="91.44" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-13" pin="S"/>
<wire x1="7.62" y1="88.9" x2="2.54" y2="88.9" width="0.1524" layer="91"/>
<label x="2.54" y="88.9" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-15" pin="S"/>
<wire x1="7.62" y1="86.36" x2="2.54" y2="86.36" width="0.1524" layer="91"/>
<label x="2.54" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X3" gate="-1" pin="S"/>
<wire x1="50.8" y1="93.98" x2="45.72" y2="93.98" width="0.1524" layer="91"/>
<label x="45.72" y="93.98" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X3" gate="-3" pin="S"/>
<wire x1="50.8" y1="91.44" x2="45.72" y2="91.44" width="0.1524" layer="91"/>
<label x="45.72" y="91.44" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X3" gate="-5" pin="S"/>
<wire x1="50.8" y1="88.9" x2="45.72" y2="88.9" width="0.1524" layer="91"/>
<label x="45.72" y="88.9" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X3" gate="-7" pin="S"/>
<wire x1="50.8" y1="86.36" x2="45.72" y2="86.36" width="0.1524" layer="91"/>
<label x="45.72" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PIN" gate="-6" pin="S"/>
<wire x1="-25.4" y1="76.2" x2="-27.94" y2="76.2" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="X2" gate="-1" pin="S"/>
<wire x1="53.34" y1="104.14" x2="50.8" y2="104.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="5V" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="5.5V"/>
<wire x1="7.62" y1="38.1" x2="0" y2="38.1" width="0.1524" layer="91"/>
<label x="-5.08" y="38.1" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="1-2EN"/>
<wire x1="63.5" y1="66.04" x2="55.88" y2="66.04" width="0.1524" layer="91"/>
<label x="55.88" y="66.04" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="VCC1"/>
<wire x1="93.98" y1="66.04" x2="99.06" y2="66.04" width="0.1524" layer="91"/>
<label x="96.52" y="66.04" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="3-4EN"/>
<wire x1="93.98" y1="30.48" x2="99.06" y2="30.48" width="0.1524" layer="91"/>
<label x="99.06" y="30.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="SCK" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D13"/>
<wire x1="7.62" y1="66.04" x2="2.54" y2="66.04" width="0.1524" layer="91"/>
<label x="-2.54" y="66.04" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PIN" gate="-23" pin="S"/>
<wire x1="-45.72" y1="53.34" x2="-50.8" y2="53.34" width="0.1524" layer="91"/>
<label x="-58.42" y="53.34" size="1.778" layer="95"/>
</segment>
</net>
<net name="MOSI" class="0">
<segment>
<pinref part="PIN" gate="-19" pin="S"/>
<label x="-58.42" y="58.42" size="1.778" layer="95"/>
<wire x1="-45.72" y1="58.42" x2="-53.34" y2="58.42" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="D11"/>
<wire x1="40.64" y1="63.5" x2="45.72" y2="63.5" width="0.1524" layer="91"/>
<label x="45.72" y="63.5" size="1.778" layer="95"/>
</segment>
</net>
<net name="SS" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D10"/>
<wire x1="40.64" y1="60.96" x2="48.26" y2="60.96" width="0.1524" layer="91"/>
<label x="45.72" y="60.96" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PIN" gate="-24" pin="S"/>
<wire x1="-25.4" y1="53.34" x2="-27.94" y2="53.34" width="0.1524" layer="91"/>
<label x="-27.94" y="53.34" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="MISO" class="0">
<segment>
<pinref part="PIN" gate="-21" pin="S"/>
<wire x1="-45.72" y1="55.88" x2="-50.8" y2="55.88" width="0.1524" layer="91"/>
<label x="-58.42" y="55.88" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="D12"/>
<wire x1="40.64" y1="66.04" x2="45.72" y2="66.04" width="0.1524" layer="91"/>
<label x="45.72" y="66.04" size="1.778" layer="95"/>
</segment>
</net>
<net name="GPIO23" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D8"/>
<wire x1="40.64" y1="55.88" x2="45.72" y2="55.88" width="0.1524" layer="91"/>
<label x="45.72" y="55.88" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="PIN" gate="-16" pin="S"/>
<wire x1="-25.4" y1="63.5" x2="-27.94" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PWM1" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D9"/>
<wire x1="40.64" y1="58.42" x2="48.26" y2="58.42" width="0.1524" layer="91"/>
<label x="45.72" y="58.42" size="1.778" layer="95"/>
</segment>
<segment>
<label x="55.88" y="35.56" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="2A"/>
<wire x1="63.5" y1="35.56" x2="55.88" y2="35.56" width="0.1524" layer="91"/>
<junction x="63.5" y="35.56"/>
</segment>
</net>
<net name="PWM4" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D3"/>
<wire x1="40.64" y1="43.18" x2="48.26" y2="43.18" width="0.1524" layer="91"/>
<label x="45.72" y="43.18" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="3A"/>
<wire x1="93.98" y1="35.56" x2="99.06" y2="35.56" width="0.1524" layer="91"/>
<label x="96.52" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="PWM3" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D5"/>
<wire x1="40.64" y1="48.26" x2="48.26" y2="48.26" width="0.1524" layer="91"/>
<label x="45.72" y="48.26" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="4A"/>
<wire x1="93.98" y1="60.96" x2="96.52" y2="60.96" width="0.1524" layer="91"/>
<label x="96.52" y="60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="PWM2" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="D6"/>
<wire x1="40.64" y1="50.8" x2="48.26" y2="50.8" width="0.1524" layer="91"/>
<label x="45.72" y="50.8" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="1A"/>
<wire x1="63.5" y1="60.96" x2="55.88" y2="60.96" width="0.1524" layer="91"/>
<label x="55.88" y="60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="A0" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="A0"/>
<wire x1="7.62" y1="58.42" x2="2.54" y2="58.42" width="0.1524" layer="91"/>
<label x="2.54" y="58.42" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-2" pin="S"/>
<wire x1="25.4" y1="104.14" x2="22.86" y2="104.14" width="0.1524" layer="91"/>
<label x="20.32" y="104.14" size="1.778" layer="95"/>
</segment>
</net>
<net name="A1" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="A1"/>
<wire x1="7.62" y1="55.88" x2="5.08" y2="55.88" width="0.1524" layer="91"/>
<label x="2.54" y="55.88" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-4" pin="S"/>
<wire x1="25.4" y1="101.6" x2="22.86" y2="101.6" width="0.1524" layer="91"/>
<label x="20.32" y="101.6" size="1.778" layer="95"/>
</segment>
</net>
<net name="A7" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="A7"/>
<wire x1="7.62" y1="40.64" x2="5.08" y2="40.64" width="0.1524" layer="91"/>
<label x="2.54" y="40.64" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-16" pin="S"/>
<wire x1="25.4" y1="86.36" x2="22.86" y2="86.36" width="0.1524" layer="91"/>
<label x="20.32" y="86.36" size="1.778" layer="95"/>
</segment>
</net>
<net name="A6" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="A6"/>
<wire x1="7.62" y1="43.18" x2="5.08" y2="43.18" width="0.1524" layer="91"/>
<label x="2.54" y="43.18" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-14" pin="S"/>
<wire x1="25.4" y1="88.9" x2="22.86" y2="88.9" width="0.1524" layer="91"/>
<label x="20.32" y="88.9" size="1.778" layer="95"/>
</segment>
</net>
<net name="A5" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="A5"/>
<wire x1="7.62" y1="45.72" x2="5.08" y2="45.72" width="0.1524" layer="91"/>
<label x="2.54" y="45.72" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-12" pin="S"/>
<wire x1="25.4" y1="91.44" x2="22.86" y2="91.44" width="0.1524" layer="91"/>
<label x="20.32" y="91.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="A4" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="A4"/>
<wire x1="7.62" y1="48.26" x2="5.08" y2="48.26" width="0.1524" layer="91"/>
<label x="2.54" y="48.26" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-10" pin="S"/>
<wire x1="25.4" y1="93.98" x2="22.86" y2="93.98" width="0.1524" layer="91"/>
<label x="20.32" y="93.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="A3" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="A3"/>
<wire x1="7.62" y1="50.8" x2="5.08" y2="50.8" width="0.1524" layer="91"/>
<label x="2.54" y="50.8" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-8" pin="S"/>
<wire x1="25.4" y1="96.52" x2="22.86" y2="96.52" width="0.1524" layer="91"/>
<label x="20.32" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="A2" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="A2"/>
<wire x1="7.62" y1="53.34" x2="5.08" y2="53.34" width="0.1524" layer="91"/>
<label x="2.54" y="53.34" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X1" gate="-6" pin="S"/>
<wire x1="25.4" y1="99.06" x2="22.86" y2="99.06" width="0.1524" layer="91"/>
<label x="20.32" y="99.06" size="1.778" layer="95"/>
</segment>
</net>
<net name="12V" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="VCC2"/>
<wire x1="63.5" y1="30.48" x2="55.88" y2="30.48" width="0.1524" layer="91"/>
<label x="55.88" y="30.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X2" gate="-2" pin="S"/>
<wire x1="73.66" y1="104.14" x2="86.36" y2="104.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PWM3O" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="4Y"/>
<wire x1="93.98" y1="55.88" x2="99.06" y2="55.88" width="0.1524" layer="91"/>
<label x="96.52" y="55.88" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X3" gate="-6" pin="S"/>
<wire x1="71.12" y1="88.9" x2="83.82" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PWM4O" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="3Y"/>
<wire x1="93.98" y1="40.64" x2="99.06" y2="40.64" width="0.1524" layer="91"/>
<label x="96.52" y="40.64" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X3" gate="-8" pin="S"/>
<wire x1="71.12" y1="86.36" x2="83.82" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PWM2O" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="1Y"/>
<wire x1="63.5" y1="55.88" x2="55.88" y2="55.88" width="0.1524" layer="91"/>
<label x="55.88" y="55.88" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X3" gate="-4" pin="S"/>
<wire x1="71.12" y1="91.44" x2="83.82" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PWM1O" class="0">
<segment>
<label x="55.88" y="40.64" size="1.778" layer="95"/>
<pinref part="IC1" gate="G$1" pin="2Y"/>
<junction x="63.5" y="40.64"/>
</segment>
<segment>
<pinref part="X3" gate="-2" pin="S"/>
<wire x1="71.12" y1="93.98" x2="83.82" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="204,1,63.5,45.72,IC1,GND2,,,,"/>
<approved hash="204,1,93.98,50.8,IC1,GND3,,,,"/>
<approved hash="204,1,93.98,45.72,IC1,GND4,,,,"/>
</errors>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
