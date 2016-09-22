# encoding: utf-8
require 'spec_helper'
require "logstash/filters/duration"

describe LogStash::Filters::Duration do
  describe "Parse duration in ISO format" do
    let(:config) do <<-CONFIG
      filter {
        duration {
          iso => "P1DT2H3M4S"
        }
      }
    CONFIG
    end

    sample("iso" => "P1DT2H3M4S") do
      expect(subject.get("duration")).to eq(93_784)
    end
  end
end
