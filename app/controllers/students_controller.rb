class Studens_controller < ApplicationController

  set :views, File.join(APP_ROOT, 'app','views','Students')
# controlador GET student
  get "/" do
    @Student = Student.all
    erb :index
  end

# get de student /id
  get "/:id" do
    id= params[:id].to_i
    @Student = Student.all[id]
    erb :show
  end
end
