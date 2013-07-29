


class Computer
  @@users=Hash.new
  def self.get_users
    puts @@users
  end

  def initialize(username,password)
    @username=username
    @password=password
    @files={}
    @@users[username] = password
  end

  def create(filename)
    @time=Time.now
    @files[filename]=@time
    puts"a new file with the #{filename} has been created by #{@username} at#{@time}"
  end

  def get_files
   puts @files
  end
end

user_1=Computer.new("mickie","8888")
user_2=Computer.new("nnn","6666")
user_1.create("book1")
user_2.create("book2")
user_2.create("book3")
user_2.get_files
Computer.get_users