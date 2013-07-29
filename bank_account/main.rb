require ("./refactored_bank_account.rb")
require ("./modules.rb")
include Helper
puts "your name please"
name=gets.chomp()
name_check_result=name_Check?(name,Account.users)
until (name_check_result==true)
  puts ("name Error,user does not exist")
  name=gets.chomp()
  name_check_result=name_Check?(name,Account.users)
end

#if name valid, then go to the associated account
current_user_name=name
puts "your pin number please"
pin=gets.chomp().to_i
pin_check_result=pin_Check?(current_user_name,pin,Account.users)
until (pin_check_result==true)
    puts ("pin Error, try again")
    pin=gets.chomp().to_i
    pin_check_result=pin_Check?(current_user_name,pin,Account.users)
end
current_user_pin=pin
current_user_account=current_user(current_user_name,current_user_pin,Account.users)
#diaplay the balance of the current user
puts "welcome #{current_user_name}, your current balance is #{current_user_account[:balance]}"
#ask for options
current_user=Account.new(current_user_name,current_user_account[:balance],current_user_pin)
expired_user=current_user_account.dup
puts Account.users
ask_for_options
choice=gets.chomp()
options_handler(choice,current_user,expired_user)
#if does not have changes

puts Account.users





