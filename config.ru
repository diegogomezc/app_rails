# esta especificando que ruta debe usar que controladores  y ellos
require "sinatra"
require "csv"


APP_ROOT = File.dirname(__FILE__)


require_relative "app/controllers/application_controller"
require_relative "app/controllers/students_controller"
require_relative "app/controllers/teachers_controller"

require_relative "app/models/base"
require_relative "app/models/students"
require_relative "app/models/teacher"
#este codigo eta diciendo que se encarge de studens con ese controlador
map("/students") { run StudentsController}
map("/teachers") { run  TeachersController }

