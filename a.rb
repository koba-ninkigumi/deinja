
IO.foreach("Inflections.java", encoding:"utf-8") {|rawline|
  line = rawline.strip

  next if !line.start_with?("new Inflection")

  m = line.match(/"(.+?)", "(.+?)", (\w+)/)
  search_value = m[1]
  new_value = m[2]
  type = m[3]

  # new Inflection(".*[い|ゆ|行|征|逝|往](かせる)", "く", CAUSATIVE),
  if search_value.start_with?('.*[')
    m = search_value.match(/\[(.+?)\]\((.+?)\)/)
    m[1].split("|").each {|s|
      puts [s + m[2], new_value, type].join("\t")
    }
  elsif search_value.start_with?('.*(')
    # ".*(来よう)", "来る"
    m = search_value.match(/\((.+?)\)/)
    puts [m[1], new_value, type].join("\t")
  else
    # m = line.match(/"(.+?)", "(.+?)", (\w+)/)
    search_value = m[1]
    new_value = m[2]
    type = m[3]
    puts [m[1], m[2], m[3]].join("\t")
  end
}

puts "const maps = [map0, map1, map2, map3, map4, map5, map6, map7, map8, map9];"