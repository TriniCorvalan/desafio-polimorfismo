# Catálogo y sistema de pago

## Manejo de productos

Se crea el modelo Product con los atributos necesarios. Product será la clase base que luego heredarán los productos digitales y físicos.

```console
$ rails g model Product name description stock price sku
```

Luego se crean los modelos DigitalProduct y PhysicalProduct

```console
$ rails g model DigitalProduct
```
```console
$ rails g model PhysicalProduct
```

Se crea el modelo Image que tendrá relación polimórfica

```console
$ rails g model Image name image:references{polymorphic}
```

se revisan y corren las migraciones con `rails db:migrate`

Luego, se especifica la relación de herencia en los modelos DigitalProduct y PhysicalProduct. 

```ruby
#app/models/digital_product.rb
class DigitalProduct < Product
end

#app/models/physical_product.rb
class PhysicalProduct < Product
end
```

Para poder aplicar lo anterior, es necesario decirle a rails que cargue el modelo Product en Digital y PhysicalProduct. Para esto  se crea  un initialiazer en config/initializers llamado product_loading.rb que contiene lo siguiente:

```ruby
# config/initializers/product_loading.rb
autoload :DigitalProduct, 'product'
autoload :PhysicalProduct, 'product'
```

Para agregar las imágenes se instala Active Storage en la consola con `$ rails active_storage:install` y se corre la migracion  con `rails db:migrate`

Se agregan las relaciones de imagen en los modelos

```ruby
#app/models/digital_product.rb
class DigitalProduct < Product
  has_one_attached :image
end

#app/models/physical_product.rb
class PhysicalProduct < Product
  has_many_attached :images
end
```

Y están lista las relaciones de productos, se puede probar en la consola para revisar que estén integradas correctamente