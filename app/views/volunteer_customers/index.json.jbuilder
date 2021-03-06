json.array!(@volunteers) do |volunteer|
  json.extract! volunteer, :id, :name, :place
  json.title volunteer.name
  json.start volunteer.time
  json.end volunteer.time   
  json.url recruiter_volunteer_path(volunteer, format: :html) 
end