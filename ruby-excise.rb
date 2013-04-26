class Movies
        #add
        #update
        #show
        #destroy
        def self.getMovies

          puts @@movies
        end

        @@movies={movie1:78,movie2:89,movie3:35,movie4:66}

        def initialize(title,rating)
                @title=title
                @rating=rating
                @@movies[title]=rating

        end

        def self.add
           puts"enter the movie name you want to add "
           @title=gets.chomp.downcase().to_sym


          #check blank?
          #check existing
         while (@@movies.include?@title) || @title.empty?

              if @@movies.include?@title
                  puts"this is existing #{@title},try another name"
                  @title=gets.chomp.downcase().to_sym
              else
                  puts" you don't enter anything, please re-enter the movie name you want to add"
                  @title=gets.chomp.downcase().to_sym
              end
          end

              puts "enter the rating you want to update with movie name #{@title}"
              @rating=gets.chomp.to_i
              @@movies[@title]=@rating
              puts "you are successfully added the movie #{@title} with the rating of #{@rating}"

        end

        def self.update
           puts"enter the movie name you want to update the rating"
           @title=gets.chomp.downcase().to_sym
           #check blank?
           #check exsiting
           while !(@@movies.include?@title) || @title.empty?

             if @title.empty?
               puts" you don't enter anything, please re-enter the movie name you want to add"
               @title=gets.chomp.downcase().to_sym
             else

               puts"movie #{@title} is not existing ,try another name"
               @title=gets.chomp.downcase().to_sym
             end
           end

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
            @title=gets.chomp.downcase().to_sym
            #check blank? existing
            while !(@@movies.include?@title) || @title.empty?

              if @title.empty?
                puts" you don't enter anything, please re-enter the movie name you want to add"
                @title=gets.chomp.downcase().to_sym

              else
                puts"movie #{@title} is not existing ,try another name"
                @title=gets.chomp.downcase().to_sym
              end
            end

            @@movies.delete(@title)
          puts "you have successfully delete the movie #{@title}"


        end

end

class Helper

    def self.IfEmpty(choice)
        while choice.empty?
        puts "you don't type anything right?
        type add if you want to add
        type update if you want to update
        type display if you want to show
        type delete if you want to delete"
        choice=gets.chomp.downcase()
        end

    end

end
#Movies.getMovies
#Movies.update
#Movies.getMovies
puts "type add if you want to add
      type update if you want to update
      type display if you want to show
      type delete if you want to delete"
choice=gets.chomp.downcase()

#check empty? and properly
while choice.empty? || (choice!="add" && choice !="update" && choice!="display" &&choice !="delete")

  if choice.empty?
  puts "you don't type anything right?
        type add if you want to add
        type update if you want to update
        type display if you want to show
        type delete if you want to delete"
  choice=gets.chomp.downcase()
  else
    puts "I don't understand what you are saying, try again"
    choice=gets.chomp.downcase()
  end
end



case choice
  when "add" then Movies.add
  when "update" then Movies.update
  when "display" then Movies.show
  when "delete" then Movies.delete

end

Movies.getMovies