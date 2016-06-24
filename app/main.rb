require_relative '../db/config'
# p Legislator.find(10)



# p "#{Legislator.where(state: 'NY').first} #{Legislator.where(state: 'NY').}"

# { 'abc' => 'asdas' }
# { :asdas => 'dasdas' }
# { asdsa: 'dasda' }


# userinput = gets.chomp
# puts "Senators: "
# Legislator.where(state: 'NY', title: 'Sen').order(:lastname).each {
# 	|row|
# 	puts "#{row.firstname} #{row.lastname} (#{row.party})"
# }
# puts ""

# puts "Representatives: "
# Legislator.where(state: 'NY', title: 'Rep').order(:lastname).each {
# 	|x|
# 	puts "#{x.firstname} #{x.lastname} (#{x.party})"
# }




malesenators = Legislator.where(gender: 'M', title: 'Sen' ).count.to_f / Legislator.count.to_f
malereprentatives = Legislator.where(gender: 'M', title: 'Rep' ).count.to_f / Legislator.count.to_f

puts "Male Senators: #{Legislator.where(gender: 'M', title: 'Sen').count} (#{malesenators.round(2)*100}%)"
puts "Male Representatives: #{Legislator.where(gender: 'M', title: 'Rep').count} (#{malereprentatives.round(2)*100}%)"



Legislator.where(in_office: true).group(:state).order('count(*) desc').pluck(:state).each do |state|
	senator_count = Legislator.where(state: state, title: 'Sen').count
	rep_count = Legislator.where(state: state, title: 'Rep').count
	puts "#{state} #{senator_count} Senators #{rep_count} Representative(s)"
end	








puts "Senators: #{Legislator.where(title: 'Sen').count} "
puts "Senators: #{Legislator.where(title: 'Rep').count} "


Legislator.destroy_all(in_office: false)




