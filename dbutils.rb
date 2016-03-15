require 'mongo'

module DbUtils
	# a helper method to turn a string ID
	# representation into a BSON::ObjectId
	def object_id val
		begin
			BSON::ObjectId.from_string(val)
		rescue BSON::ObjectId::Invalid
			nil
		end
	end
	
	def document_by_id id
		id = object_id(id) if String === id
		if id.nil?
			{}
		else
			document = settings.mongo_db.find(:_id => id).to_a.first
			(document || {})
		end
	end
	
	def update_by_id(id, update)
		id = object_id(id) if String === id
		if id.nil?
			{}.to_json
		else
			document = settings.mongo_db.find_one_and_update(
				{:_id => id}, 
				{'$set' => update}, 
				:return_document => :after)
			document
		end
	end
  
  def get_reservations_by_month(start_month, end_month)
      documents = settings.mongo_db.find({
		  :status => {:$ne => "deleted"}, 
		  :pickup_month => {:$gte => start_month, :$lte => end_month}}).to_a
      (documents || {}).to_json
  end
  
  def get_all_reservations
  	documents = settings.mongo_db.find()
	(documents || {}).to_json
  end
end