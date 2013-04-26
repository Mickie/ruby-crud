#this is the sample for user to add,update,show,delete the data, and multi-tasks only if user want to stop

class Movies

        def self.getMovies

          puts @@movies
        end

        @@movies={movie1:78,movie2:89,movie3:35,movie4:66}

        def initialize(title,rating)
                @title=title
                @rating=rating
                @@movies[title]=rating

        end

        def self.check_blank_and_existing(action)
          #add--not empty,cannot be existed
          #update-not empty, must be existed
          #delete-not empty, must be existed
          @title=gets.chomp.downcase().to_sym

          if action=="add"#handle request of add

              while (@@movies.include?@title) || @title.empty?

                if @@movies.include?@title
                  puts"this is existing #{@title},try another name"
                  @title=gets.chomp.downcase().to_sym
                else
                  puts" you don't enter anything, please re-enter the movie name you want to add"
                  @title=gets.chomp.downcase().to_sym
                end
              end

          else#handle update and delete
                while !(@@movies.include?@title) || @title.empty?

                  if @title.empty?
                    puts" you don't enter anything, please re-enter the movie name you want to #{action}"
                    @title=gets.chomp.downcase().to_sym
                  else

                    puts"movie #{@title} is not existing ,try another name"
                    @title=gets.chomp.downcase().to_sym
                  end
                end

          end
          @title
        end




        def self.add
           puts"enter the movie name you want to add "
              #return a valid title
              @title= check_blank_and_existing("add")
              puts "enter the rating you want to update with movie name #{@title}"
              @rating=gets.chomp.to_i
              @@movies[@title]=@rating
              puts "you are successfully added the movie #{@title} with the rating of #{@rating}"

        end

        def self.update
           puts"enter the movie name you want to update the rating"
           #return a valid title
           @title=check_blank_and_existing("update")

                puts "enter the rating you would like to update the movie #{@title}"
                @rating=gets.chomp.to_i
                @@movies[@title]=@rating
                puts "the movie #{@title} has been updated succefully with a new rating #{@rating}"

        end

        def self.show
          @@movies.each do|movie,rating|

            puts"movie: #{movie}    raing: #{rating}"
          end
        end


        def self.delete
            puts "enter the movie name that you want to delete"

            #return a valid title
            @title=check_blank_and_existing("delete")

            @@movies.delete(@title)
            puts "you have successfully delete the movie #{@title}"
        end

        def self.exit

            puts "bye bye"
        end

end


#--------------code body-------------


#return a valid choice value
def choice_IfValid(choice)
  @choice=choice
  while  @choice.empty? || (@choice!="add" && @choice !="update" && @choice!="display" &&@choice !="delete" &&@choice != "exit")
    if @choice.empty?
      puts "you don't type anything right?
                  type add if you want to add
                type update if you want to update
                type display if you want to show
                 type delete if you want to delete"
      @choice = gets.chomp.downcase()
    else
      puts "I don't understand what you are saying, try again"
      @choice = gets.chomp.downcase()
    end
  end
  @choice #must have a return value
end

def ask_for_choice_option
  puts "anything else?
        type add to add
        type update to update
        type display to show
        type delete to delete
        type exit to exit"

end


def choice_action(choice)
  case choice
    when "add" then Movies.add
    when "update" then Movies.update
    when "display" then Movies.show
    when "delete" then Movies.delete
  end
end




puts "type add to add
      type update to update
      type display to show
      type delete to delete
      type exit to exit"
choice=gets.chomp.downcase()
choice = choice_IfValid(choice)

until choice=="exit"
    choice_action(choice)
    ask_for_choice_option
    choice=gets.chomp.downcase()
    choice = choice_IfValid(choice)
end

Movies.exit
Movies.getMovies