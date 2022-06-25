# frozen_string_literal: true

class SiteTree
  def match(folders, sites)
    all_parent_child = []
    folders.delete_if { |folder| folder[:name] == 'ROOT' }
    sites.each do |site|
      parent_child = []
      parent_child << site[:name]
      follow_parent(folders, site, parent_child)
      all_parent_child << parent_child
    end

    all_parent_child
  end

  private

  def follow_parent(parents, child, parent_child)
    parents.each do |current_parent|
      next unless current_parent[:id].to_i == child[:parent_id].to_i

      parent_child.unshift(current_parent[:name])
      parents.delete(current_parent)
      follow_parent(parents, current_parent, parent_child)
    end

    parent_child
  end
end
