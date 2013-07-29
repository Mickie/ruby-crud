require ("./modules.rb")
class Account
  attr_accessor :name,:balance
#  include Account_Helper
      #should have users information

    @@userArray=[]

  def self.users
    @@userArray
  end

  def initialize(name,balance,pin)
    @name=name
    @balance=balance
    @pin=pin
    @user={}
    @user[:name]=@name
    @user[:balance]=@balance
    @user[:pin]=@pin
    @@userArray <<@user

  end

  def deposit(amount)
    @balance+=amount
    @user[:balance]=@balance
    puts("the new balance for username #{@name} is #{@balance}")
  end

  def withdraw(amount)
    @amount=amount
    until @amount<=@balance
      puts "amount exceeds balance ,re-type the amount you want to withdraw"
      @amount=gets.chomp.to_i
    end
    @balance -= @amount
    @user[:balance]=@balance
    puts "Withdrew #{@amount}. New balance: $#{@balance}."
  end

  def change_pin(number)
    @pin=number
    @user[:pin]=@pin
  end

  def check_pin(number)
    @pin==number
  end


  private




end

#add some user data
user_1=Account.new("mickie",10000,1234)
user_2=Account.new("yanqing",50000,4567)
user_3=Account.new("user3",1000,8907)
puts Account.users








