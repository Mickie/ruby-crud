
module Helper

  def name_Check?(aUserName,aClassVariableArray)
    result=""
    aClassVariableArray.each {|object| result="true" if (object[:name]==aUserName)}
    return result=="true"
  end

  def current_user(current_user_name,pin,aClassVariableArray)
    #select will return array
    aClassVariableArray.find {|x| x[:name] == current_user_name && x[:pin]==pin }
  end

  def pin_Check?(current_user_name,pin,aClassVariableArray)
    result=""
    aClassVariableArray.each {|object| result="true" if (object[:name]==current_user_name && object[:pin]==pin)}
    return result=="true"
  end

  def pin_error
    puts "pin Error"
  end

  def ask_for_options
    puts "type deposit to deposit
        type withdraw to withdraw
        type change to change PIN
        type exit to exit"

  end

  def options_handler(choice,user_account)

    until (choice=="deposit" || choice=="withdraw" ||choice=="change" ||choice=="exit" )
      ask_for_options
      choice=gets.chomp()
    end

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
        pin=gets.chomp().to_i
        if (user_account.check_pin(pin))
          puts "type the new PIN"
          new_pin=gets.chomp().to_i
          user_account.change_pin(new_pin)
          puts "you #{user_account.name} have successfully change with a New PIN"

        else
          pin_error

        end

      when "exit"
      exit

    end

  end

  def exit
    puts "Bye-Bye"
  end


end
