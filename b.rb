arr_dict = {}

arr_dict[0] = {}

IO.foreach("a.txt", encoding:"utf-8") {|line|
  s, n, t = line.strip.split("\t")
  k_w = arr_dict[s.length]
  if k_w.nil?
    k_w = {}
    arr_dict[s.length] = k_w
  end

  words = k_w[s]
  if words.nil?
    words = []
    k_w[s] = words
  end
  words.push(n)
  #arr.push([s, n, t])
}

arr_dict.keys.sort.each {|len|
  puts "const map#{len} = {"
  k_w = arr_dict[len]

  k_w.keys.sort.each {|k|
    words = k_w[k].map{|a|"\"#{a}\""}.join(",")
    puts "#{k}: [#{words}],"
    #puts words.join("|")
  }
  
  puts "};"
  puts ""
}
