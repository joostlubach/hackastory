class StatsController < ApplicationController

  def show
    unlocks = Unlock.all
    aspects = Aspect.all

    @data = {}

    unlocks_data = {}
    unlocks.each do |unlock|
      unlocks_data[unlock.aspect.aspect] ||= 0
      unlocks_data[unlock.aspect.aspect] += 1
    end
    @data[:unlocks] = unlocks_data.map do |key, value|
      { :key => key, :y => value }
    end

    badges_data = {}
    aspects.each do |aspect|
      next unless aspect.badge
      badges_data[aspect.badge] ||= 0
      badges_data[aspect.badge] += 1
    end
    @data[:badges] = badges_data.map do |key, value|
      { :key => key, :y => value }
    end

    @data[:stories] = {
      :broken => Story.where{popular_on_nos == false}.all.select(&:unlocked).count
    }
  end

end