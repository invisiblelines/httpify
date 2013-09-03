require "spec_helper"

module Httpify

  describe "a String" do

    it "should respond to httpify" do
      expect("google.com").to respond_to(:httpify)
    end
    
    it "should return the string prefixed with http://" do
      expect("www.google.com".httpify).to eql("http://www.google.com")
    end
  
    context "an httpified attribute starting http://" do
    
      it "should not alter the string" do
        expect("http://www.google.com".httpify).to eql("http://www.google.com")
      end
    
    end
  
    context "an httpified attribute starting https://" do
    
      it "should not alter the string" do
        expect("https://www.google.com".httpify).to eql("https://www.google.com")
      end
    
    end

    context "options" do

      it "should prefix the string with https" do
        expect("www.google.com".httpify(:https => true)).to eql("https://www.google.com")
      end

      it "should add a trailing slash" do
        expect("www.google.com".httpify("trailing_slash" => true)).to eql("http://www.google.com/")
      end

    end

  end

  describe "A class with Httpify included" do
  
    subject { Link.new }

    it "has a class method #httpify" do
      expect(Link).to respond_to(:httpify)
    end
  
    context "an httpified attribute that is nil" do
      its(:url) { should be_nil }
    end
  
    context "an httpified attribute that is blank" do
      before do
        subject.url = ''
      end

      its(:url) { should be_blank }
    end

    context "a httpified attribute that is a String" do
      before do
        subject.url = 'www.google.com'
      end

      its(:url) { should eql("http://www.google.com") }
    end

    context "options" do

      context "accepts options for :https" do
        before do
          Link.httpify :url, :https => true
        end

        subject do
          link     = Link.new
          link.url = "www.google.com"

          link
        end

        its(:url) { should eql("https://www.google.com") }
      end

      context "accepts options for :trailing_slash" do
        before do
          Link.httpify :url, :trailing_slash => true
        end

        subject do
          link     = Link.new
          link.url = "www.google.com"

          link
        end

        its(:url) { should eql("http://www.google.com/") }
      end
    end

    context "multiple attributes" do

      before do
        Link.httpify :url, :source
      end

      subject do
        link        = Link.new
        link.url    = "www.google.com"
        link.source = "news.ycombinator.com"

        link
      end

      its(:url)    { should eql("http://www.google.com") }
      its(:source) { should eql("http://news.ycombinator.com") }
    end
  
  end
  
end