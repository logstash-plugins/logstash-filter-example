require "logstash/devutils/rspec/spec_helper"
require "logstash/filters/example"

describe LogStash::Filters::Example do
  describe "Set to Hello World" do
    config <<-CONFIG
      filter {
        example {
          message => "Hello World"
        }
      }
    CONFIG

    sample("message" => "some text") do
      insist { subject }.include?("message")
      insist { subject["message"] } == "Hello World"
    end
  end
end
