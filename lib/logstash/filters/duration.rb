# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"

class LogStash::Filters::Duration < LogStash::Filters::Base

  config_name "duration"

  config :iso, :validate => :string, :default => "", :required => true

  public
  def register
  end # def register

  public
  def filter(event)

    if @iso
      # TODO parse duration in ISO format
    end

    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Duration
