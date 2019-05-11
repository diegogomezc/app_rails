class StudentsController < ApplicationController

  set :views, File.join(APP_ROOT, 'app','views','Students')
# controlador GET student
  get "/" do
    @Student = Student.all
    erb :index
  end

  get '/new' do
    erb :new
  end

# get de student /id
  get "/:id" do
    id= params[:id].to_i
    @Student = Student.all[id]
    erb :show
  end
 
  post '/'do
    student = Student.new(student_params)

    student.save
    redirect '/students'
  end

  def student_params
    params[:student]
  end

end
