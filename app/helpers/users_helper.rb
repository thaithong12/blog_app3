module UsersHelper
    def most_activities
      hash_query = Book.where(status: 1).group(:user_id).count
      # tra ve hash id , count
      hash_query = Hash[hash_query.sort_by{ |_, v| -v }]
      array_id  = hash_query.keys.to_a
      array_object = []
      for i in (0...5)
         array_object.push User.find_by id: array_id[i]
      end
      @most_actives = array_object
    end
    
end
