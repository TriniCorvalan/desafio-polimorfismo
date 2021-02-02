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

Pero ¿cómo aplicamos esto en rails? siguiendo la recomendación de [devblast.com](https://devblast.com/b/sti-keeping-subclasses-file) se debe crear el modelo base con los atributos y métodos necesarios, luego se crean las subclases como modelos (sin repetir los atrubutos de la clase base). siguiendo el ejemplo dado esto sería:

```console
  $ rails g model Animal atributos:tipo
  $ rails g model Dog
  $ rails g model Cat
  ...
  $ rails db:migrate
```

Luego se editan los modelos agregando la herencia correspondiente.

```ruby 
# app/models/animal.rb 
class Animal < ActiveRecord::Base 
  def create(params)
    self.new(params)
  end
end

class Dog < Animal; end
class Cat < Animal; end
class Bird < Animal; end
```

Luego es necesario crear un initializer llamado animal_loading.rb que contenga lo siguiente:

```ruby
# config/initializers/animal_loading.rb
autoload :Dog, 'animal'
autoload :Cat, 'animal'
autoload :Bird, 'animal'
```

