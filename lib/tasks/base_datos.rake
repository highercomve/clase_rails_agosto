namespace :base_datos do

  desc "Relativo a la DB"

  task upcase_all_names_user: :environment do
    
    puts "Normalizando todos los names en upcase"

    users = User.all
    users.each do |user|
      user.name.upcase!
      user.save!
    end
  end

  task create_password_all_users: :environment do

    users = User.all
    users.each do |u|
      u.password = '123456789' if u.password.nil?
      u.save
    end
  end

end
