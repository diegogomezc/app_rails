module Storage
    class Base
        #{iteradorm mostrar nombre = *** }METAPROGRAMING
def initialize(params = {} )
    params.each do |key,value|
      instance_variable_set("@#{key}",value) #crea get y le asigna un valor
       self.class.send(:define_method,key) do
        instance_variable_get("@#{key}")
     end
   end
end


  def save
     headers =self.class.file_headers
     colletion =self.class.all

     colletion << self

    CSV.open(self.class.file_path,'w') do |csv|
      csv << headers
        colletion.each do |record|
            values =headers.map do |header|
                record.send(header)
            end
            csv << values
        end
    end
  end


  def self.file_headers
    CSV.open(file_path, &:readline)
  end


  def self.all
#instanciar
# file.map { |item|new(*item) }
CSV.foreach(file_path, headers:true).map{ |item| new(item)}
  end
        
        def self.file_path
        
            File.join(APP_ROOT, 'db',"#{table_name}.csv")
        end

        def  self.teble_name
            raise("NotImplementedError")
        end
    end
end

