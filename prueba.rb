# Refactorización del siguiente código:
=begin

class Person
    def initialize(first, last, age, type) 
        @first_name = first
        @last_name = last
        @age = age
        @type = type
    end

    def birthday @age += 1 # Se elimina el método por no ser utilizado actualmente en el código
    end

    def talk
        if @type == "Student"
            puts "Aquí es la clase de programación con Ruby?" elsif @type == "Teacher"
            puts "Bienvenidos a la clase de programación con Ruby!" elsif @type == "Parent"
            puts "Aquí es la reunión de apoderados?" 
        end
    end

    def introduce
        if @type == "Student"
            puts "Hola profesor. Mi nombre es #{@first_name} #{@last_name}." elsif @type == "Teacher"
            puts "Hola alumnos. Mi nombre es #{@first_name} #{@last_name}." elsif @type == "Parent"
            puts "Hola. Soy uno de los apoderados. Mi nombre es #{@first_name}
        #{@last_name}."
        end 
    end
end


#################################################################################################################

# REQUERIMIENTOS

# 1. Identificar las posibles subclases que aparecen en el código a refactorizar. 
    Cada una de ella contendrá los métodos correspondientes, talk e introduce.

# 2. A partir de la refactorización del código se debe generar herencia de ancestros
    aplicando la sintaxis de Ruby, esto para las subclases

# 3. El método introduce al imprimir el mensaje muestra el nombre y apellido
    haciendo uso de interpolación de variables de instancia

# 4. Al generar las instancias de cada objeto, se muestra un mensaje en función del método que sea invocado

# def birthday @age += 1 #### Se elimina el método por no ser utilizado actualmente en el código
=end

# CODIGO REFACTORIZADO

class Person # Clase Madre
    attr_accessor :first_name, :last_name # Se elimina "age" por ser variables que no se utilizan en ninguna parte del código  y "type" para optimizar con subclases
    # Método Constructor
    def initialize(first, last)
        @first_name = first
        @last_name = last
    end
end

class Student < Person # Subclase de la Clase Person
    def talk
        puts "Aquí es la clase de programación con Ruby?"
    end
    def introduce
        puts "Hola profesor. Mi nombre es #{@first_name} #{@last_name}."
    end
end
            
class Parent < Person # Subclase de la Clase Person
    def talk
        puts "Aquí es la reunión de apoderados?"
    end
    def introduce
        puts "Hola. Soy uno de los apoderados. Mi nombre es #{@first_name} #{@last_name}."
    end
end

class Teacher < Person # Subclase de la Clase Person
    def talk
        puts "Aquí es la clase de programación con Ruby?"
    end
    def introduce
        puts "Hola alumnos. Mi nombre es #{@first_name} #{@last_name}." 
    end
end

# INSTANCIA DE CLASE
student = Student.new("Olivia", "Pérez")
parent = Parent.new("Marcial", "Pérez")
teacher = Teacher.new("Alicia", "Venegas")

student.talk
student.introduce
puts # Salto de línea
parent.talk
parent.introduce
puts # Salto de línea
teacher.talk
teacher.introduce
puts # Salto de línea