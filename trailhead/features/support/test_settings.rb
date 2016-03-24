class TestSettings
  # web app url
  attr_accessor :web_app_url
  attr_accessor :web_app_url_index_key

  # portal
  attr_accessor :portal_url
  attr_accessor :user_name
  attr_accessor :password

  # test data info
  attr_accessor :last_assignment_created_time


  def initialize
    # default values
    @web_app_url = ""
    @portal_url = ""
    @user_name = ""
    @password = ""

    # web app url
    #--------------------------------------------
    # get url from command line if given
    if !ENV['url'].nil?
      @web_app_url = ENV['url']
      log("   got a url from command line: #{@web_app_url}")
    end

    # web app url deployment index key if applies
    @web_app_url_index_key = nil
    # check if url has index_key
    if @web_app_url.include?("index_key")
      @web_app_url_index_key = @web_app_url[@web_app_url.length-7..-1]
    end

    # test portal
    #-----------------------------------------------
    if !ENV['portal'].nil?
      @portal_url = ENV['url']
      log("   got a portal url from command line: #{@portal_url}")
    end

    # test data info
    #-----------------------------------------------
    @last_assignment_created_time = nil
  end
end