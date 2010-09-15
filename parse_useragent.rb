class Browsers
  @slice_increment
  class << self
    attr_accessor  :slice_increment
  end
  attr_accessor :useragent, :browsername, :safebrowser, :dombrowser,:browser_working_name, :uaType, :browser_version

  BrowserTypes = [
    [ 'opera', true, 'op', 'bro' ],
    [ 'msie', true, 'ie', 'bro' ],
    # webkit before gecko because some webkit ua strings say: like gecko
    [ 'webkit', true, 'webkit', 'bro' ],
    # konq will be using webkit soon
    [ 'konqueror', true, 'konq', 'bro' ],
    # covers Netscape 6-7, K-Meleon, Most linux versions, uses moz array below
    [ 'gecko', true, 'moz', 'bro' ],
    [ 'netpositive', false, 'netp', 'bbro' ],# beos browser
    [ 'lynx', false, 'lynx', 'bbro' ], # command line browser
    [ 'elinks ', false, 'elinks', 'bbro' ], # new version of links
    [ 'elinks', false, 'elinks', 'bbro' ], # alternate id for it
    [ 'links2', false, 'links2', 'bbro' ], # alternate links version
    [ 'links ', false, 'links', 'bbro' ], # old name for links
    [ 'links', false, 'links', 'bbro' ], # alternate id for it
    [ 'w3m', false, 'w3m', 'bbro' ], # open source browser, more features than lynx/links
    [ 'webtv', false, 'webtv', 'bbro' ],# junk ms webtv
    [ 'amaya', false, 'amaya', 'bbro' ],# w3c browser
    [ 'dillo', false, 'dillo', 'bbro' ],# linux browser, basic table support
    [ 'ibrowse', false, 'ibrowse', 'bbro' ],# amiga browser
    [ 'icab', false, 'icab', 'bro' ],# mac browser
    [ 'crazy browser', true, 'ie', 'bro' ],# uses ie rendering engine

    # search engine spider bots:
    [ 'googlebot', false, 'google', 'bot' ],# google
    [ 'mediapartners-google', false, 'adsense', 'bot' ],# google adsense
    [ 'yahoo-verticalcrawler', false, 'yahoo', 'bot' ],# old yahoo bot
    [ 'yahoo! slurp', false, 'yahoo', 'bot' ], # new yahoo bot
    [ 'yahoo-mm', false, 'yahoomm', 'bot' ], # gets Yahoo-MMCrawler and Yahoo-MMAudVid bots
    [ 'inktomi', false, 'inktomi', 'bot' ], # inktomi bot
    [ 'slurp', false, 'inktomi', 'bot' ], # inktomi bot
    [ 'fast-webcrawler', false, 'fast', 'bot' ],# Fast AllTheWeb
    [ 'msnbot', false, 'msn', 'bot' ],# msn search
    [ 'ask jeeves', false, 'ask', 'bot' ], #jeeves/teoma
    [ 'teoma', false, 'ask', 'bot' ],#jeeves teoma
    [ 'scooter', false, 'scooter', 'bot' ],# altavista
    [ 'openbot', false, 'openbot', 'bot' ],# openbot, from taiwan
    [ 'ia_archiver', false, 'ia_archiver', 'bot' ],# ia archiver
    [ 'zyborg', false, 'looksmart', 'bot' ],# looksmart
    [ 'almaden', false, 'ibm', 'bot' ],# ibm almaden web crawler
    [ 'baiduspider', false, 'baidu', 'bot' ],# Baiduspider asian search spider
    [ 'psbot', false, 'psbot', 'bot' ],# psbot image crawler
    [ 'gigabot', false, 'gigabot', 'bot' ],# gigabot crawler
    [ 'naverbot', false, 'naverbot', 'bot' ],# naverbot crawler, bad bot, block
    [ 'surveybot', false, 'surveybot', 'bot' ],#
    [ 'boitho.com-dc', false, 'boitho', 'bot' ],#norwegian search engine
    [ 'objectssearch', false, 'objectsearch', 'bot' ],# open source search engine
    [ 'answerbus', false, 'answerbus', 'bot' ],# http://www.answerbus.com/, web questions
    [ 'sohu-search', false, 'sohu', 'bot' ],# chinese media company, search component
    [ 'iltrovatore-setaccio', false, 'il-set', 'bot' ],

    # various http utility libaries
    [ 'w3c_validator', false, 'w3c', 'lib' ], # uses libperl, make first
    [ 'wdg_validator', false, 'wdg', 'lib' ], #
    [ 'libwww-perl', false, 'libwww-perl', 'lib' ],
    [ 'jakarta commons-httpclient', false, 'jakarta', 'lib' ],
    [ 'python-urllib', false, 'python-urllib', 'lib' ],

    # download apps
    [ 'getright', false, 'getright', 'dow' ],
    [ 'wget', false, 'wget', 'dow' ],# open source downloader, obeys robots.txt

    #// netscape 4 and earlier tests, put last so spiders don't get caught
    [ 'mozilla/4.', false, 'ns', 'bbro' ],
    [ 'mozilla/3.', false, 'ns', 'bbro' ],
    [ 'mozilla/2.', false, 'ns', 'bbro' ]
  ]

  MozTypes = ['bonecho', 'camino', 'epiphany', 'firebird', 'flock', 'galeon', 'iceape', 'icecat', 'k-meleon', 'minimo', 'multizilla', 'phoenix', 'songbird', 'swiftfox', 'seamonkey', 'shiretoko', 'iceweasel', 'firefox', 'minefield', 'netscape6', 'netscape', 'rv' ]
  WebkitTypes = [ 'arora', 'chrome', 'epiphany', 'gtklauncher', 'konqueror', 'midori', 'omniweb', 'safari', 'uzbl', 'applewebkit', 'webkit' ]

  SafariSpecialCases = {
    "1.0" =>   ["85.5", "85.6", "85.7","100.1"],
    "1,0.3" => ["85.8.1", "85.8", "85"],
    "1.2" =>   ["125", "125.1"],
    "1.2.2" => ["85.8", "125.7", "125.8"],
    "1.2.3" => ["100", "125.9"],
    "1.2.4" => ["125", "125.11", "125.12", "125.12_Adobe", "125.5.5"],
    "1.3" =>   ["312", "312.3.1"],
    "1.3.1" => ["312.3.3", "312.3.1", "312.3", "125.8", "125.9"],
    "1.3.2" => ["312.3.3", "312.5", "312.6", "312.5_Adobe"],
    "2.0" =>   ["412", "412.2.2", "412.2_Adobe","417.2"],
    "2.0.1" => ["412.5", "412.6", "412.5_Adobe"],
    "2.0.2" => ["416.13", "416.12", "312", "416.13_Adobe", "416.12_Adobe", "412.5"],
    "2.0.3" => ["417.9.3", "417.8_Adobe", "417.9.2", "417.8", "412.2"],
    "2.0.4" => ["419.3"],
    "3.0" =>   ["523.13", "522.11.3", "523.12.9", "523.6.1", "522.11.1", "522.11", "522.8.3", "522.7"],
    "3.0.1" => ["522.12.2"],
    "3.0.2" => ["522.13.1", "522.12"],
    "3.0.3" => ["522.15.5", "523.6", "522.12.1"],
    "3.0.4" => ["523.11", "523.12.2", "523.10", "523.10.6", "523.15", "523.12"],
    "3.1"  => ["525.13"],
    "3.1.1" => ["525.17", "525.18", "525.20"],
    "3.1.2" => ["525.21"],
    "3.2.1" => ["525.27.1"]
  }


  def initialize(original)
    @useragent=original.downcase
    @browsername='unknown'
  end

  
  def detect
    b_success=false
    BrowserTypes.each do |x|
      if  @useragent.include? (x[0])
        @browsername=x[0]
        @safebrowser = true
        @dombrowser = x[1]# hardcoded dom support from array
				@browser_working_name = x[2]; # working name for browser
				@uaType = x[3]; # sets whether bot or browser

        case @browser_working_name
        when 'ns'
          @safebrowser = true
          @browser_version = getitemversion('mozilla')
        when 'moz'
        	# this will return alpha and beta version numbers, if present
          moz_rv_full = getitemversion('rv' );
          # this slices them back off for math comparisons
          moz_rv = moz_rv_full[0,3]
          
          moz_number=nil
          moz_type=nil
          MozTypes.each do |mt|
            if  @useragent.include? (mt)
              moz_type=mt
              moz_number=getitemversion(moz_type)
               moz_type=moz_type=='netscape6'?'netscape':moz_type
              moz_type=moz_type=='minefield'?'minefield (firefox beta)':moz_type
             
              break
            end
          end
          if !moz_rv
            moz_rv=moz_number.to_f
            moz_rv_full = moz_number;
          end
          moz_type=moz_type=='rv'?'mozilla':moz_type
          @browser_version=moz_number
          get_set_count( 'set', 0 )
          moz_release_date = getitemversion('gecko' );
          @safebrowser = false if ( ( moz_release_date.to_i < 20020400 ) || ( moz_rv.to_i < 1 ) )
          
          @browsername= moz_type
        when 'ie'
          @browser_version=getitemversion(@browsername, true, 'trident/')

          # construct the proper real number if it's in compat mode and msie 8.0/9.0
          if ( @browser_version.include?('7.') ) && ( @useragent.include?('trident/5') )

            # note that 7.0 becomes 9 when adding 1, but if it's 7.1 it will be 9.1
            true_ie_number = @browser_version + 2

						elseif ( @browser_version.include?('7.') ) && (@useragent.include?('trident/4') )

            # note that 7.0 becomes 8 when adding 1, but if it's 7.1 it will be 8.1
            true_ie_number = @browser_version + 1
          end

          #the 9 series is finally standards compatible, html 5 etc, so worth a new id
          if @browser_version.to_i >=9
            ie_version = 'ie9x'
            #7/8 were not yet quite to standards levels but getting there
            elseif  @browser_version.to_i >=7
            ie_version = 'ie7x'
            # then test for IE 5x mac, that's the most problematic IE out there
            elseif @useragent.include?('mac')
            ie_version = 'ieMac'
            # ie 5/6 are both very weak in standards compliance
            elseif  @browser_version.to_i >=5
            ie_version = 'ie5x'
            elseif  (@browser_version.to_i > 3) && (@browser_version.to_i < 5)
            @dombrowser = false
            ie_version = 'ie4'
            # this depends on what you're using the script for, make sure this fits your needs
            @safebrowser = true
          else
            ie_version = 'old'
            @dombrowser = false
            @safebrowser = false
          end

        when 'op'
          @browser_version=getitemversion(@browsername)
          if @browser_version.include?('9.') && @useragent.include?('version/')
            get_set_count( 'set', 0 )
            @browser_version = getitemversion('version/');
          end
          @safebrowser = false if @browser_version.to_f < 5
       

        when 'webkit'
          webkit_type_number=nil
          @browser_version=getitemversion(@browsername)
          WebkitTypes.each do |wt|
            if  @useragent.include?(wt)
              webkit_type = wt
              get_set_count( 'set', 2 ) if webkit_type == 'omniweb'
            
              webkit_type_number = getitemversion(webkit_type)
              @browsername=wt
              # epiphany hack
              if ( wt == 'gtklauncher' )
                @browsername = 'epiphany'
              else
                @browsername = wt
              end
              break
            end

          end
       
          @browser_version=webkit_type_number
          if @browsername=='safari'
            
            SafariSpecialCases.each do |k, v|

              if @useragent.include?('version') && webkit_type_number.to_f>525.27
                @browser_version=getitemversion('version')
                break
              end

              v.each do |num|
                if @browser_version == num
                  @browser_version=k
                  break
                end
              end
              engine_id = @useragent[/applewebkit\/([0-9.]+)/, 1]
              case @browser_version
              when "85.8"
                case engine_id
                when '125.2'     then @browser_version='1.2.2'
                end
              when "125"
                case engine_id
                when '125.5.5'   then @browser_version='1.2.4'
                when '124'       then @browser_version='1.2'
                when '312.5.2'   then @browser_version='1.3.1'
                when '312.1'     then @browser_version='1.3'
                end
              when '412.5'
                case engine_id
                when '416.12'    then @browser_version='2.0.2'
                end
              when '416.13'
                case engine_id
                when '417.9'     then @browser_version='2.0.3'
                end
              when '412.2'
                case engine_id
                when '412.6'     then @browser_version='2.0'
                end
              when '312.3.1'
                case engine_id
                when '312.1'     then @browser_version='1.3'
                when '312.5.1'   then @browser_version='1.3.1'
                end
              when "125.8"
                case engine_id
                when '312.5.1'   then @browser_version='1.3.1'
                when '125.2'     then @browser_version='1.2.2'
                end
              when "125.9"
                case engine_id
                when '125.4'     then @browser_version='1.2.3'
                when '125.5'     then @browser_version='1.2.3'
                when '312.5.1'   then @browser_version='1.3.1'
                end
              when "312"
                case engine_id
                when '416.11'    then @browser_version='2.0.2'
                end
              when "312.3.3"
                case engine_id
                when '312.8'     then @browser_version='1.3.2'
                end
              when "419.3"
                case engine_id
                when "420"       then @browser_version='3.0'
                end
              end
             
            end
            
          end
          
        else
          @browser_version=getitemversion(@browsername)
        end
        b_success = true
        break
      end

    end

    if !b_success

    end
    
  end


  def getitemversion(searchstring, breaklast=nil, extrasearch=nil)
    # 12 is the longest that will be required, handles release dates: 20020323; 0.8.0+
    substring_length = 15
    start_pos = 0; # set $start_pos to 0 for first iteration
    #initialize browser number, will return '' if not found
    string_working_number = ''
    a=(0..4)
    for i in a
      if @useragent.index(searchstring,start_pos)
        start_pos=@useragent.index(searchstring,start_pos) + searchstring.length
        if (!breaklast) || (extrasearch  && @useragent.include?(extrasearch))
          break
        end
      else
        break
      end
    end
    
    start_pos += get_set_count('get')

    string_working_number = @useragent[start_pos, substring_length]
    fin=string_working_number.index(/[(\s|(|)|;|\/)]/i).to_i
    #    puts fin
    #    puts '/////'
    if fin!=0
      string_working_number = string_working_number[0, fin]
      #      puts string_working_number
      #      puts '1------'
    else
      string_working_number = string_working_number[0, string_working_number.length]
      #      puts string_working_number
      #      puts '2------'
    end
    

    if !is_numeric?(string_working_number[0,1])
      string_working_number = ''
    end
    return string_working_number

  end

  def get_set_count( pv_type, pv_value=nil )

    #self.class.slice_increment
    #    static slice_increment
    return_value = nil
    case  pv_type
    when 'get'
			# set if unset, ie, first use. note that empty and isset are not good tests here
			if self.class.slice_increment.nil?
				self.class.slice_increment = 1
      end
			return_value = self.class.slice_increment
			self.class.slice_increment = 1 # reset to default
			return return_value

		when 'set'
			self.class.slice_increment = pv_value
    end
  end


  def is_numeric?(i)
    i.to_i.to_s == i || i.to_f.to_s == i
  end

end


#a = Browsers.new('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; User-agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; http://bsalsa.com) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618)')