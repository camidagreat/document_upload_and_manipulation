@first_names = []
@last_names = []
@full_names = []

# Opens a file and separates out the names, adding them to the above arrays
File.open("/Users/luke/desktop/coding-exercise/test-data-10-exp-5.list") do |f|
  f.each_line do |line|
    if line.include? ","
      @last_names << line.split(" ")[0].chop
      @first_names << line.split(" ")[1]
      @full_names << [line.split(" ")[1] + " " + line.split(" ")[0].chop]
    end
  end
end

#counts the top 10 most common objects in an array
def top_10_counter(name_set)
  @ranked_names = name_set.each_with_object(Hash.new(0)) { |n,h| h[n] += 1 }
  @top_10_names = @ranked_names.sort_by{|k, v| v}.reverse.first(10)
end


def unique_in_set(name_set)
  name_set.uniq.count.to_s
end


def question1
  puts "Answer to Question 1"
  puts "there are " +  unique_in_set(@full_names) + " unique full names."
  puts "there are " +  unique_in_set(@first_names) + " unique first names."
  puts "there are " +  unique_in_set(@last_names) + " unique last names."
end

def question2
  puts "\nAnswer to Question 2"
  puts "The ten most common first names are:"

  top_10_counter(@first_names)
end

def question3
  puts "\nAnswer to Question 3"
  puts "The ten most common last names are:"

  top_10_counter(@last_names)
end

def question4
  puts "\nAnswer to Question 4\n"

  @unique_full_names = []
  @unique_first_names = []
  @unique_last_names = []

  #Checks the full names  for unique ones
  @full_names.each do |name|
    if @unique_first_names.include? (name[0].split(" ").first)
      puts name[0].to_s + "      // " + "Not unique.  We've seen " + name[0].split(" ").first.to_s
    elsif @unique_last_names.include? (name[0].split(" ").last)
      puts name[0].to_s + "      // " + "Not unique.  We've seen " + name[0].split(" ").last.to_s
    elsif @unique_full_names.count == 25
      break
    else
      puts name[0].to_s + "      // " + "Unique!  We havent seen " + name[0].split(" ").first.to_s + " or " + name[0].split(" ").last.to_s + " yet"
      @unique_first_names << name[0].split(" ").first
      @unique_last_names << name[0].split(" ").last
      @unique_full_names << name
    end
  end

  #creates new unique full names from the unique first and last names
  puts "\nThe 25 formulated names are:"
  @made_up_names = []

  @unique_first_names.each do |first_name|
    @unique_last_names.each do |last_name|
      if @unique_full_names.include? [first_name + " " + last_name]
        break
      elsif @made_up_names.count == 25
        break
      else
        @made_up_names << (first_name.to_s + " " + last_name.to_s)
      end
    end
  end
end

puts question1
puts question2
puts question3
puts question4