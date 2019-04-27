module Storage
    class Base
        def self.all
            file.map do |item|     #file.map { |item|new(*item)forma mas corta una solo linea  }
            Student.new(*item)
            end
        end
        
        def self.file
            File.open(file_path).map {|line| line.split(',')}
        end
        
        def self.file_path
        
            File.join(APP_ROOT, 'db',"#{table_name}.txt")
        end

        def  self.teble_name
            raise("NotImplementedError")
        end
    end
end

