#!/usr/bin/env ruby
require 'minitest/unit'

$LOAD_PATH << './'
require 'browsers.rb'

class MyTestCase <  MiniTest::Unit::TestCase
  Useragents = [
    ['Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)','msie','6.0'],
    ['Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; bgft)','msie','7.0'],
    
    ['Mozilla/5.0 (Linux; U; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.2.149.27 Safari/525.13','chrome','0.2.149.27'],
    ['ELinks/0.12~pre2.dfsg0-1ubuntu1-lite (textmode; Debian; Linux 2.6.32-4-jolicloud i686; 143x37-2)','elinks','0.12'],
    ['Links (2.1pre15; Linux 2.4.26-vc4 i586; x)','links ','2.1'],
    ['Lynx/2.8.5dev.16 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.6b','lynx', '2.8.5dev'],
    ['Midori/0.2.2 (X11; Linux i686; U; en-us) WebKit/531.2+','midori','0.2.2'],
    ['Mozilla/5.0 (X11; U; Linux i686; en-us) AppleWebKit/531.2+ (KHTML, like Gecko) Safari/531.2+ Epiphany/2.29.5','epiphany','2.29.5'],
    ['Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.4.1) Gecko/20031114 Epiphany/1.0.4','epiphany','1.0.4'],
    ['Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8) Gecko/20051111 Firefox/1.5 BAVM/1.0.0','firefox','1.5'],
    ['Mozilla/5.0 (X11; Linux i686 (x86_64); rv:2.0b4pre) Gecko/20100812 Minefield/4.0b4pre','minefield (firefox beta)','4.0'],
    ['Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)','msie','8.0'],
    ['Mozilla/5.0 (compatible; Konqueror/2.1.1; X11)','konqueror','2.1.1'],
    ['Mozilla/5.0 (compatible; Konqueror/3.5; GNU/kFreeBSD) KHTML/3.5.9 (like Gecko) (Debian)','konqueror','3.5'],
    ['Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9b5) Gecko/2008032620 Firefox/3.0b5','firefox','3.0'],
    ['Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.13) Gecko/20060410 Firefox/1.0.8','firefox','1.0.8'],
    ['Mozilla/5.0 (X11; U; OpenBSD i386; en-US; rv:1.8.1.19) Gecko/20090701 Galeon/2.0.7','galeon','2.0.7'],
    ['Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9pre) Gecko/2008060901 SeaMonkey/2.0a1pre','seamonkey','2.0'],
    ['Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Avant Browser;','msie'], #avant
    ['Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.5) Gecko/20031016 K-Meleon/0.8.2','k-meleon','0.8.2'],
    ['Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.125 Safari/533.4','chrome','5.0.375.125'],
    ['Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US) AppleWebKit/532.0 (KHTML, like Gecko) Chrome/3.0.198.0 Safari/532.0','chrome','3.0.198.0'],
    
    #safari
    ['Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Version/3.1 Safari/525.17','safari','3.1.1'],
    ['Mozilla/5.0 (iPod; U; CPU iPhone OS 2_2_1 like Mac OS X; en-us) AppleWebKit/525.18.1 (KHTML, like Gecko) Version/3.1.1 Mobile/5H11a Safari/525.20','safari','3.1.1'],
    ['Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/531.21.8 (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10','safari','4.0.4'],
    ['Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_7; en-us) AppleWebKit/525.28.3 (KHTML, like Gecko) Version/3.2.3 Safari/525.28.3','safari','3.2.3'],
    ['Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.19 (KHTML, like Gecko) Version/3.1.2 Safari/525.21','safari','3.1.2'],
    ['Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.17','safari','3.1.1'],
    ['Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_2; en-us) AppleWebKit/525.13 (KHTML, like Gecko) Version/3.1 Safari/525.13','safari','3.1'],
    ['Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-gb) AppleWebKit/523.10.6 (KHTML, like Gecko) Version/3.0.4 Safari/523.10.6','safari','3.0.4'],
    ['Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/522.11.1 (KHTML, like Gecko) Version/3.0.3 Safari/522.12.1','safari','3.0.3'],
    ['Mozilla/5.0 (Windows; U; Windows NT 5.1; bg) AppleWebKit/522.13.1 (KHTML, like Gecko) Version/3.0.2 Safari/522.13.1','safari','3.0.2'],
    ['Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/417.3 (KHTML, like Gecko) Safari/417.2','safari','2.0'],
    ['Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412 (KHTML, like Gecko) Safari/412','safari','2.0'],
    ['Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/106.2 (KHTML, like Gecko) Safari/100.1','safari','1.0'],
    #opera
    ['Opera/9.80 (Windows NT 6.1; U; en) Presto/2.5.24 Version/10.54','opera','10.54'],
    ['Opera/9.80 (S60; SymbOS; Opera Mobi/499; U; ru) Presto/2.4.18 Version/10.00','opera','10.00'],
    ['Opera/9.80 (Windows NT 5.1; U; en) Presto/2.5.22 Version/10.50','opera','10.50'],
    ['Opera/9.80 (X11; Linux x86_64; U; Linux Mint; en) Presto/2.2.15 Version/10.10','opera','10.10'],
    ['Opera/10.00 (X11; Linux i686 ; U; en) Presto/2.2.0','opera','10.00'],
    ['Opera/9.62 (Windows NT 5.1; U; en) Presto/2.1.1','opera','9.62'],
    ['Opera/9.00 (Windows NT 4.0; U; en)','opera','9.00'],
    ['Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; en) Opera 9.0','opera','9.0'],
    ['Mozilla/4.0 (compatible; MSIE 6.0; Windows CE; PPC; 480x640) Opera 8.60 [en]','opera','8.60'],
    ['Opera/8.5 (Macintosh; PPC Mac OS X; U; en)','opera','8.5'],
    ['Mozilla/4.0 (compatible; MSIE 6.0; Mac_PowerPC Mac OS X; en) Opera 8.0','opera','8.0'],
    ['Mozilla/5.0 (X11; Linux i386; U) Opera 7.60 [en-GB]','opera','7.60'],
    ['Mozilla/4.0 (compatible; MSIE 5.0; Windows 95) Opera 6.01 [en]','opera','6.01'],
    #  ['Mozilla/4.76 [en] (X11; U; FreeBSD 4.4-STABLE i386)','netscape']
    #['PATHWORKS Mosaic/1.0 libwww/2.15_Spyglass','mosaic'], old browser
    #['mothra/Jul-10-17:33:30-EDT-2006','mothra'],old browser

    #netscape
   ['Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.7.5) Gecko/20050519 Netscape/8.0.1','netscape','8.0.1'],
   ['Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.2) Gecko/20040804 Netscape/7.2 (ax)','netscape','7.2'],
   ['Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:0.9.4.1) Gecko/20020508 Netscape6/6.2.3','netscape','6.2.3']
  ]

  def test_1
    puts "Browser name test"
    Useragents.each do |x|
      a= Browsers.new(x[0])
      a.detect
      assert_equal(x[1],a.browsername)
#      assert_match(x[1],a.browsername)
    end
  end

  def test_2
    puts "Browser version test"
    Useragents.each do |x|
      if !x[2].nil?
        a= Browsers.new(x[0])
        a.detect
        #    assert_equal(a.browser_version, x[2])
        assert_match(x[2],a.browser_version)
      end
    end

  end


end

MiniTest::Unit.autorun

