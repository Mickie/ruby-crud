name = "Andrew"
name_2 = "Joe"
def name.add_last_name(name)
  @thename=name
  puts"#{@thename} Burgess"
  @thename ="hello"
  puts @thename

end

 name.add_last_name(name) # "Andrew Burgess"
