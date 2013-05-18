namespace :admin do
  desc "manage admin users"
  task :create => :environment do
    begin
      user = User.new
      user.role = User::ADMIN
      puts "login email address:"
      user.email = STDIN.gets.chomp
      system 'stty -echo' # will not be echoed
      trap("INT") do # in case of sigint
          system 'stty echo'
          exit
      end
      puts "login password:"
      user.password = STDIN.gets.chomp
      puts "confirm login password:"
      user.password_confirmation = STDIN.gets.chomp
      system 'stty echo'
      user.save!
    rescue
      user.errors.full_messages.each do |message|
        puts message
      end
      retry
    end
  end
end

