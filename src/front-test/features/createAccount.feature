@automationexercise @Smoke @createAccount
Feature: Creación de cuenta en la pagina automationexercise
    
    
    Background: the user navigates up to the loading page
    
        Given El usuario esta en la pagina de automationexercise
        When El usuario clickea en el boton de signupLogin
        And El usuario clickea en el campo nombre e inserta el nombre a utilizar
        And El usuario clickea en el campo Email Address e inserta la direccion
        And El usuario clickea el boton Signup
        Then El usuario se encuentra en la pagina para la carga de informacion de la cuenta



    #este scenario solo corre ok si no existe la cuenta previamente   
    Scenario: User navigates to automationexercise and selects login
        Then El usuario se encuentra en la pagina para la carga de informacion de la cuenta

    Scenario: User loads the information of the account
        Given El usuario esta en la pagina de signup de automationexercise 
        When El usuario selecciona la opcion mr
        And El usuario ingresa una password
        And El usuario inserta la fecha de nacimiento
        And El usuario insterta el nombre
        And El usuario inserta apellido
        And El usuario inserta direccion
        And El usuario inserta el pais
        And El usuario inserta el estado
        And El usuario inserta la ciudad
        And El usuario inserta el codigo postal
        And El usuario inserta el numero de celular
        And El usuario selecciona el boton de crear cuenta
        And El usuario visualiza el mensaje "ACCOUNT CREATED!"
        And El usuario selecciona el boton "continuar" 
        Then El usuario vuelve a la pagina de inicio

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



