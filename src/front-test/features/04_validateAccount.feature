@automationexercise @Smoke @validateAccount
Feature: 04_Validación de cuentas en la pagina automationexercise
    
      #este caso no valida la existencia de la cuenta en si, sino que valida que la cuenta no tenga esa contraseña particular.
       Scenario Outline: validation of existing accounts 
       Given El usuario esta en la pagina de automationexercise
       When El usuario clickea en el boton de signupLogin
       And El usuario clickea en el campo de login Email Address e inserta "<email>"
       And El usuario clickea en el campo de login password e inserta la contraseña "<password>"
       And El usuario clickea el boton Login
       Then El usuario visualiza el mensaje "Your email or password is incorrect!"

        Examples:
        |     <email>               |      <password>       |
        |     test@mail.com         |      123456789        |
        |     prueba@mail.com       |      AWEqwesad123     |
        |     pepito1@gmail.com.ar  |      QWERTY123456     |
        |     juanito@hotmail.com   |      asdfgqwerty1     |
        |     holaDino@test.com     |      DinoTrueno27     |
        |     selip98320@bizmud.com |      passtest         |
