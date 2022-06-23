class ParseTree
  def match(folders, site)
    res = []
    site.each do |site|
      folder_site = []
      folder_site << site[:name]
      get_folder(folders[:data][:site_tree][:folders], site, folder_site)
      res << folder_site
    end

    res
  end

  def get_folder(parent, child, folder_site)
    p "start get_folder ================"
    p parent, child, folder_site
    parent.each do |pa|
      if pa[:id].to_i == child[:parent_id].to_i
        folder_site.unshift(pa[:name])
        parent.delete(pa)
        get_folder(parent, pa, folder_site)
      end
    end

    return folder_site
  end
end