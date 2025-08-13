@automationexercise @Smoke @deleteAccount
Feature: eliminacion de cuenta de pagina automationexercise
    #este scenario corre ok solo si ya existe una cuenta previamente
    Scenario: Elimination of an existing account
        Given El usuario esta en la pagina de automationexercise
        When El usuario selecciona el boton "delete account"
        Then El usuario visualiza el mensaje "Account Deleted!"




#   #este scenario corre ok solo si ya existe una cuenta previamente
#   Scenario: Elimination of an existing account
#       Given El usuario esta en la pagina de automationexercise
#       When El usuario clickea en el boton de signupLogin
#       And El usuario clickea en el campo de login Email Address e inserta la direccion
#       And El usuario clickea en el campo de login password e inserta la contraseña
#       And El usuario clickea el boton Login
#       And El usuario esta en la pagina de automationexercise
#       And El usuario selecciona el boton "delete account"
#       Then El usuario visualiza el mensaje "Account Deleted!"


#este scenario corre ok solo si el email ya existe
#   Scenario: User already exists
#        Given El mail ingresado ya tiene una cuenta existente
#        Then El usuario visualiza el mensaje "Email Address already exist!"



