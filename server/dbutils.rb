require 'mongo'

module DB_Utils
	# a helper method to turn a string ID
	# representation into a BSON::ObjectId
	def object_id val
		begin
			BSON::ObjectId.from_string(val)
		rescue BSON::ObjectId::Invalid
			nil
		end
	end
	
	def reservations_get_by_id id
		id = object_id(id) if String === id
		if id.nil?
			{}
		else
			document = settings.reservations.find(:_id => id).to_a.first
			(document || {})
		end
	end
	
	def reservations_update_by_id(id, update)
		id = object_id(id) if String === id
		if id.nil?
			{}.to_json
		else
			document = settings.reservations.find_one_and_update(
				{:_id => id}, 
				{'$set' => update}, 
				:return_document => :after)
			document
		end
	end
	
	def reservations_update_transaction(id, payment_result, req_data)
		
		# Update status of reservation
		status = case payment_result.resultCode
		when "A"
			"payment-accepted"
		when "D"
			"payment-declined"
		when "E"
			"payment-failed"
		end
		
		card_num_length = req_data["cc"]["cardNumber"].length
		transaction_info = {
			:status => payment_result.result,
			:amount => payment_result.authAmount,
			:cardHolder => req_data["cc"]["fullName"],
			:cardNumber => req_data["cc"]["cardNumber"][card_num_length - 4, card_num_length],
			:refNum => payment_result.refNum,
			:avsResult => payment_result.avsResult,
			:authorization => payment_result.authCode,
			:cvv2Result => payment_result.cardCodeResult
		}
		
		reservations_update_by_id(id, {
			:status => status,
			:transaction => transaction_info
		})
	end
  
  def reservations_insert reservation
  	settings.reservations.insert_one reservation
  end
  
  def reservations_get_by_month(start_month, end_month)
      documents = settings.reservations.find({
		  :status => {:$ne => "deleted"}, 
		  :pickup_month => {:$gte => start_month, :$lte => end_month}}).to_a
      (documents || {}).to_json
  end
  
  def reservations_get_by_date(year, month, day)
  	documents = settings.reservations.find({
		:status => {:$ne => "deleted"},
		:pickup_year => year,
		:pickup_month => month,
		:pickup_day => day
	}).to_a
	
	(documents || {}).to_json
  end
  
  def reservations_get_all
  	documents = settings.reservations.find().to_a
	(documents || {}).to_json
  end
  
  # Employees
  def employees_add_one(type, name, email, phone)
  	settings.employees.insert_one({
		:type => type,
		:name => name,
		:email => email,
		:phone => phone
	})
  end
  
  def employees_get_all
  	documents = settings.employees.find().to_a
	(documents || {}).to_json
  end
end