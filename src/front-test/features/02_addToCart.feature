@automationexercise @Smoke @addToCart
Feature: 02 Validación de cuentas en la pagina automationexercise
    
      #este caso solo funciona si el usuario ya tiene una cuenta preexistente y esta logueado
      #este paso carga producto al carrito, puede hacerse con Scenario Overlay para que cargue mas de un producto
      Scenario Outline: User adds products to carts
      Given El usuario esta en la pagina de automationexercise
      When El usuario clickea el boton "view product" para el producto con ID "<Producto>"
      And El usuario selecciona cantidad e inserta "<Cantidad>"
      And El usuario selecciona el boton "add to cart"
      Then El usuario visualiza el mensaje "Your product has been added to cart."

      Examples:
      |Producto                     |Cantidad         |
      |2                            |5                |
      |1                            |4                |
      |3                            |3                |
      |4                            |2                |

      #este scenario se utiliza para hacer el checkout
      Scenario: User checks out
      Given El usuario visualiza el mensaje "Your product has been added to cart."
      When El usuario clickea el boton "view cart"
      And El usuario es transportado a la pagina view_cart
      And El usuario clickea el boton "Proceed To Checkout"
      And El usuario clickea el boton "Place Order"
      And El usuario inserta los datos de la tarjeta
      And El usuario clickea el boton "Pay and confirm order"
      Then El usuario visualiza el mensaje "Order Placed!"
     