@automationexercise @Smoke @EndAccount
Feature: logout log in y eliminación de cuenta de la pagina automationexercise
    #este scenario corre ok solo si ya existe una cuenta previamente

    Scenario: Loging off from a logged in account
        Given El usuario esta en la pagina de automationexercise
        When El usuario selecciona el boton "Logout"
        Then El usuario visualiza el boton signupLogin

    Scenario: User Logs in
        Given El usuario esta en la pagina de automationexercise
        When El usuario clickea en el boton de signupLogin
        And El usuario clickea en el campo de login Email Address e inserta el mail  
        And El usuario clickea en el campo de login password e inserta la contraseña  
        And El usuario clickea el boton Login
        Then El usuario es transportado a la pagina login


    Scenario: Elimination of an existing account
        Given El usuario va a la pagina home
        When El usuario selecciona el boton "delete account"
        Then El usuario visualiza el mensaje "Account Deleted!"

