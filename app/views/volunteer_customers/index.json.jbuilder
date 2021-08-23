json.array!(@volunteers) do |volunteer|
  json.extract! volunteer, index.json.jbuilder  
  json.start volunteer.start_date   
  json.end volunteer.end_date   
  json.url volunteer_url(event, format: :html) 
end