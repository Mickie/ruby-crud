#show user the account balance if pin is right
#prevent user from over withdraw from their account
#enable user to withdraw or to deposit
#enable a authority person to set up account for users
#enable user to change their password
#add CheckingAccount and SavingAccount

class Account
  attr_accessor :name,:balance,:pin
  @@user={mickie:10000,yanqing:5000}


    def initialize(name,balance=100)
        @name=name
        @balance=balance
        @@user[name]=balance
     end



    def withdraw(amount)
      @amount=amount
      until @amount<=@balance
        puts "amount exceeds balance ,re-type the amount you want to withdraw"
        @amount=gets.chomp.to_i
      end
      @balance -= @amount
      puts "Withdrew #{@amount}. New balance: $#{@balance}."

    end


    def deposit(amount)
      @balance+=amount
      puts "deposit #{amount}. New balance : $#{@balance}."
    end


  def self.amount(name)
     @@user[name]
  end

  def self.Check_Name(name)
         @name=name
    while !(@@user.include?(@name))
        puts "please enter another name"
        @name=gets.chomp().to_sym
    end
    @name
  end



  private

  def self.pin
    @pin="1234"

  end

end

def pin_error
  puts "Access denied: incorrect PIN."
end

def Check_PIN(pin_number)

  pin_number==Account.pin
end



#checking_account=Account.new("mickie",100000)
#checking_account.display_balance(123)
puts "your name please"
name=gets.chomp().to_sym
#get the user name that exists
valid_name=Account.Check_Name(name)

puts "your PIN number please"
pin_number=gets.chomp()


def questions
  puts "type deposit to deposit
        type withdraw to withdraw
        type change to change PIN
        type exit to exit"
end

def exit
 puts "Bye-Bye"
end

def option_handler(anUser,balance)
  questions
  choice=gets.chomp()
  until (choice=="deposit" || choice=="withdraw" ||choice=="change" ||choice=="exit" )
    questions
    choice=gets.chomp()
  end
  user_account=Account.new(anUser,balance)
  case (choice)
    when "deposit"
        puts "type the amount you want to deposit"
        amount=gets.chomp().to_i
        user_account.deposit(amount)

    when "withdraw"
        puts "type the amount you want to withdraw"
        amount=gets.chomp().to_i
        user_account.withdraw(amount)


    when "change"
      puts "type your Curent PIN again"
      pin=gets.chomp()
      if (Check_PIN(pin))
           puts "type the new PIN"
           user_account.pin=gets.chomp()
          puts "you #{user_account.name} have successfully change with a New PIN #{user_account.pin} with a balance of #{user_account.balance}"
      else
         pin_error
      end
      #put the pin first if right then put a new pin number
      #else log off

    when "exit"   then exit

  end
end
if (Check_PIN(pin_number))

  theBalance=Account.amount(valid_name)
  puts ("the current balance you have is #{theBalance}")
  option_handler(valid_name,theBalance)
else
 pin_error
end
