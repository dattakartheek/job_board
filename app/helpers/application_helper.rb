module ApplicationHelper

  def all_regions
    Region.all.map{|region| [region.name, region.id] }
  end
end
