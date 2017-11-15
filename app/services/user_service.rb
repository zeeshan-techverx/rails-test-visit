class UserService
	
	def self.list
		users = User.all
	end

  def self.import_csv path
    import_count = {added: 0, updated: 0, total: 0}
    CSV.foreach(path, headers: true) do |row|
      user = User.find_or_initialize_by(name: row['name'] , number: row['number'])
      user.date = row['date']  
      user.description = row['description']
      exists?(import_count, user)
      user.save      
      import_count[:total] += 1
    end 
    import_count
  end

  def self.exists? import_count, user
    return import_count[:added] += 1 if user.new_record?
    import_count[:updated] += 1
  end

end