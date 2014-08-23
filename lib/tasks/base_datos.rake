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

end
