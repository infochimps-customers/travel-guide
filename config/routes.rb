Travelguide::Application.routes.draw do
  get '(/data)' => 'application#data' 
  post '(/data)' => 'application#data'   
end
