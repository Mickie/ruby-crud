#a=[{:name=>"user1",:balance=>1000},{:name=>"user2",:balance=>2000}]
#puts a[0]
#a.push({:name=>"user3",:balance=>3000})
#puts a


class Account

  attr_accessor :name,:balance
  @@userArray=[]

  def self.users
    @@userArray

  end
  def initialize(name,balance)
    @name=name
    @balance=balance
    @user={}
    @user[:name]=name
    @user[:balance]=balance
    @@userArray.push(@user)
  end
end

a=Account.new("user1",1000)
b=Account.new("user2",2000)
puts Account.users
puts a.name

def check
result=""
Account.users.each do |x|

  result="true" if (x[:name]=="user2")

end
  return result=="true"
end
puts check
