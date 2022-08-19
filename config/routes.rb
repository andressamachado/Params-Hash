Rails.application.routes.draw do
  # SENDING DATA IN THE URL:

  get "/blog", to: "blog#index"
  # ==> QUERY PARAMETER
  # ==> http://localhost:3000/blog?test=1
  # at this point we dont have anything to receive the parameters, neither in its controller nor in the route.
  # test=1 is ignored.
  # in the server log we can see the hash is there even though : 
  
  # Started GET "/blog?test=1" for ::1 at 2022-08-19 16:59:07 -0400
  # Processing by BlogController#index as HTML
  #   Parameters: {"test"=>"1"} 
  #   Rendering layout layouts/application.html.erb
  #   Rendering blog/index.html.erb within layouts/application
  #   Rendered blog/index.html.erb within layouts/application (Duration: 0.1ms | Allocations: 18)
  #   Rendered layout layouts/application.html.erb (Duration: 26.9ms | Allocations: 2476)
  #   Completed 200 OK in 32ms (Views: 31.6ms | ActiveRecord: 0.0ms | Allocations: 2761)

  # index.html.erb view from blog displays only the header "Index View"


  # ==> http://localhost:3000/blog?test=1
  # now we added to the controller: 
  #   @test = params[:test]
  # and to view: 
  #   <%= @test %> 

  # now we are accessing the hash key and pulling out the value to be displayed 
  # index.html.erb view from blog displays "Index View  1"




  get "/blog/:id", to: "blog#show"
  # ==> ROUTE PARAMETER
  # ==> http://localhost:3000/blog/1
  # the : tells rails that what is passed in that section is to be taken and saved to the params hash
  # as the value of the key "id"
  # now, with that path, everything that is passed after the .../blog/ will be taken by rails and saved in the hash

  # Started GET "/blog/testingwithsillystring" for ::1 at 2022-08-19 17:39:21 -0400
  # Processing by BlogController#show as HTML
  #   Parameters: {"id"=>"testingwithsillystring"}
  #   Rendering layout layouts/application.html.erb
  #   Rendering blog/show.html.erb within layouts/application
  #   Rendered blog/show.html.erb within layouts/application (Duration: 0.1ms | Allocations: 18)
  #   Rendered layout layouts/application.html.erb (Duration: 4.5ms | Allocations: 2483)
  #   Completed 200 OK in 6ms (Views: 4.9ms | Allocations: 2764)

  # show.html.erb view from blog displays only the header "Show View"


  # ==> http://localhost:3000/blog/hashvalueforidkey
  # now we added to the controller: 
  #   @id = params[:id]
  # and to the view:
  #   <%= @id %>

  # now we are saving wherever is being placed after the .../blog/ as the value for the key "id" in the params hash
  # and displaying it. 

  # Started GET "/blog/hashvalueforidkey" for ::1 at 2022-08-19 17:52:16 -0400
  # Processing by BlogController#show as HTML
  #   Parameters: {"id"=>"hashvalueforidkey"}
  #   Rendering layout layouts/application.html.erb
  #   Rendering blog/show.html.erb within layouts/application
  #   Rendered blog/show.html.erb within layouts/application (Duration: 0.1ms | Allocations: 19)
  #   Rendered layout layouts/application.html.erb (Duration: 3.4ms | Allocations: 2472)
  #   Completed 200 OK in 5ms (Views: 4.0ms | Allocations: 2770)

  # show.html.erb view from blog displays "Show View  hashvalueforidkey"


  # ==> http://localhost:3000/blog/hashvalueforidkey?test=1
  # Started GET "/blog/hashvalueforidkey?test=1" for ::1 at 2022-08-19 18:02:49 -0400
  # Processing by BlogController#show as HTML
  #   Parameters: {"test"=>"1", "id"=>"hashvalueforidkey"}



  
  # SENDING DATA IN A FORM
  post "/blog", to: "blog#create"
  # ==> http://localhost:3000/blog, filled the form, and submitted

  # Started POST "/blog" for ::1 at 2022-08-19 18:17:33 -0400
  #Processing by BlogController#create as TURBO_STREAM
  #  Parameters: {"authenticity_token"=>"[FILTERED]", "title"=>"Post Title", "body"=>"Post Body", "commit"=>"Create Post"}
  #  Redirected to http://localhost:3000/blog
  #  Completed 302 Found in 4ms (Allocations: 1096)
end
