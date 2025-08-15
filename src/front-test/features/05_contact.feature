@automationexercise @Smoke @contact
Feature: 05 Formulario de contacto
    
      #este caso no valida la existencia de la cuenta en si, sino que valida que la cuenta no tenga esa contraseña particular.
       Scenario: Validation of the "contact us" function 
       Given El usuario esta en la pagina de automationexercise
       When El usuario clickea en el boton de Contact Us
       And El usuario clickea en el campo name e inserta su nombre
       And El usuario clickea en el campo Email e inserta el mismo
       And El usuario inserta un motivo del mensaje en el campo subject
       And El usuario inserta un mensaje
       And El usuario carga un archivo 
       And El usuario selecciona el boton Submit
       And El usuario selecciona el boton ok del pop up
       Then El usuario visualiza el mensaje "Success! Your details have been submitted successfully"


