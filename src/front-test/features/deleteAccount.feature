@automationexercise @Smoke @deleteAccount
Feature: Eliminación de cuenta de la pagina automationexercise
    #este scenario corre ok solo si ya existe una cuenta previamente
    Scenario: Elimination of an existing account
        Given El usuario esta en la pagina de automationexercise
        When El usuario selecciona el boton "delete account"
        Then El usuario visualiza el mensaje "Account Deleted!"

