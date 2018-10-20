module PostsHelper
    #def tags_links(all_tags) 
        #all_tags.split(",").map{|tag| link_to tag.strip, tag_path(tag_strip) }.join(", ")
    #end

    def tag_cloud(all_tags, classes)
        max = all_tags.short_by(&:count).last 
        all_tags.each do |tag| 
            index = tag.count.to_f / max.count * (classes.size-1)
            yield(tag, classes[index.round])
        end
    end
end
