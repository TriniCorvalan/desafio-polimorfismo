# Polimorfismo

"El principio de polimorfismo consiste en que dos objetos, de distina clase, pueden responder al mismo método de forma distinta."

Una forma de ocupar la herencia y el polimorfismo es a través de módulos. Para desarrollar el ejemplo dado podemos crear un módulo que agrupara las clases relacionadas con el reino animal. Tendremos una clase `Animal` que tendrá el método `create` que creará un objeto de la misma clase. Luego tendremos las clases `Dog`, `Cat`, etc. que heredarán de Animal el método create y cada una de las subclases creará un objeto de ella misma, ya que se ocupa la intrucción `self`.

```ruby
  module AnimalKigndom
    class Animal
       def create(params)
        self.new(params)
       end
    end

    class Dog < Animal
    end

    class Cat < Animal
    end

    class Bird < Animal
    end

  end

```
