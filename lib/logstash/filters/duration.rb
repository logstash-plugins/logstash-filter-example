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
      days = @iso[/([0-9]+)D/, 1].to_i
      hours = @iso[/([0-9]+)H/, 1].to_i
      minutes = @iso[/([0-9]+)M/, 1].to_i
      seconds = @iso[/([0-9]+)S/, 1].to_i
      duration = total_seconds(days, hours, minutes, seconds)
      event.set("duration", duration)
    end

    filter_matched(event)
  end # def filter

  private
  def total_seconds(days=0, hours=0, minutes=0, seconds=0)
    days*86400 + hours*3600 + minutes*60 + seconds
  end # def total_seconds

end # class LogStash::Filters::Duration
