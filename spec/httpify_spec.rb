require "spec_helper"

module Httpify

  describe "a String" do

    it "should respond to httpify" do
      "google.com".should respond_to(:httpify)
    end
    
    it "should return the string prefixed with http://" do
      "www.google.com".httpify.should == "http://www.google.com"
    end
  
    context "an httpified attribute starting http://" do
    
      it "should not alter the string" do
        "http://www.google.com".httpify.should == "http://www.google.com"
      end
    
    end
  
    context "an httpified attribute starting https://" do
    
      it "should not alter the string" do
        "https://www.google.com".httpify.should == "https://www.google.com"
      end
    
    end

    context "options" do

      it "should prefix the string with https" do
        "www.google.com".httpify(:https => true).should == "https://www.google.com"
      end

      it "should add a trailing slash" do
        "www.google.com".httpify("trailing_slash" => true).should == "http://www.google.com/"
      end

    end

  end

  describe "A class with Httpify included" do
  
    subject { Link.new }
  
    context "an httpified attribute that is nil" do
    
      # it "should return nil" do
      #   @link.url = nil
      #   @link.url.should be_nil
      # end
      its(:url) { should be_nil }
    
    end
  
    context "an httpified attribute that is blank" do
    
      # it "should return blank" do
      #   @link.url = ""
      #   @link.url.should == ""
      # end
      its(:url) { should be_blank }
    
    end

    context "a httpified attribute that is a String" do

      # it "should return the httpified version" do
      #   @link.url = "www.google.com"
      #   @link.url.should == "http://www.google.com"
      # end
      its(:url) { should == "http://www.google.com" }

    end

    context "options" do

      before do
        Link.httpify :url, :https => true
      end

      it "should account for options" do
        @link            = Link.new
        @link.url        = "www.google.com"
        @link.url.should == "https://www.google.com"
      end
    end

    context "multiple attributes" do

      before do
        Link.httpify :url, :source
      end

      it "should allow multiple attributes to be specified" do
        @link               = Link.new
        @link.url           = "www.google.com"
        @link.source        = "news.ycombinator.com"
        @link.url.should    == "http://www.google.com"
        @link.source.should == "http://news.ycombinator.com"
      end

    end
  
  end
  
end