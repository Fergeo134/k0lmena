import { expect } from '@playwright/test';
import { Given, When, Then } from '@cucumber/cucumber';
import { BASEURL } from '../config';
import { pages } from '../hooks/hook';
import { validateFirstLocator } from '../utils/validations';
import {
  botonSignupLogin,
  nombre,
  apellido,
  tempMail,
  performanceText,
  password,
  diaNac,
  mesNac,
  yearNac,
  direccion,
  pais,
  estado,
  ciudad,
  cp,
  celular,
  numTarj,
  cvcTarj
} from '../locators/exampleLocators';
import {
  getByPlaceholderAndClickIt,
  getByPlaceholderAndFillIt,
  getByText,
  getElementByRoleAndClickIt,
  getTextboxAndFill,
  getByLocator,
  getAltByText,
  getByTestId,
  getByLocatorAndFillIt
} from '../utils/interactions';

Given("El usuario esta en la pagina de automationexercise", async () => {
  for (const page of pages) {
    console.log(`Ejecutando prueba en navegador: ${page.context().browser()?.browserType().name()}`);
    await page.goto(BASEURL);
  }
});

When('El usuario clickea en el boton de signupLogin', async function () {
  for (const page of pages) {
    await page.getByText(botonSignupLogin).click()
  }
});

When('El usuario clickea en el campo nombre e inserta el nombre a utilizar', async function () {
  for (const page of pages) {
    await getByPlaceholderAndFillIt(page, 'Name', nombre)
  }
});

When('El usuario clickea en el campo Email Address e inserta la direccion', async function () {
  for (const page of pages) {
    await page.locator('[data-qa="signup-email"]').fill(tempMail);
  }
});


When('El usuario clickea el boton Signup', async function () {
  for (const page of pages) {
    await page.locator('[data-qa="signup-button"]').click();
  }
});

Then('El usuario se encuentra en la pagina para la carga de informacion de la cuenta', async function () {
  for (const page of pages) {
    expect(validateFirstLocator(page, "div", performanceText)).toBeTruthy();
  }
});


Given("El usuario esta en la pagina de signup de automationexercise", async () => {
  for (const page of pages) {
    await expect(page).toHaveURL('https://www.automationexercise.com/signup');
  }
});

When('El usuario selecciona la opcion mr', async function () {
  for (const page of pages) {
    await getByLocator(page, '#id_gender1')
    
  }
});

/*When('El usuario ingresa una password', async function () {*/
When('El usuario ingresa sus datos', async function () {
  for (const page of pages) {
    await getByLocatorAndFillIt(page, '[data-qa="password"]', password);
    await page.locator('#days').selectOption(diaNac);
    await page.locator('#months').selectOption(mesNac);
    await page.locator('#years').selectOption(yearNac);
    await getByLocatorAndFillIt(page, '[data-qa="first_name"]', nombre);
    await getByLocatorAndFillIt(page, '[data-qa="last_name"]', apellido);
    await getByLocatorAndFillIt(page, '[data-qa="address"]', direccion);
    await page.locator('#country').selectOption(pais);
    await getByLocatorAndFillIt(page, '[data-qa="state"]', estado);
    await getByLocatorAndFillIt(page, '[data-qa="city"]', ciudad);
    await getByLocatorAndFillIt(page, '[data-qa="zipcode"]', cp);
    await getByLocatorAndFillIt(page, '[data-qa="mobile_number"]', celular);
  }
});

/*
When('El usuario inserta la fecha de nacimiento', async function () {
  for (const page of pages) {
    await page.locator('#days').selectOption(diaNac);
    await page.locator('#months').selectOption(mesNac);
    await page.locator('#years').selectOption(yearNac);
      }
});

When('El usuario insterta el nombre', async function () {
  for (const page of pages) {
    await getByLocatorAndFillIt(page, '[data-qa="first_name"]', nombre);
  }
});
When('El usuario inserta apellido', async function () {
  for (const page of pages) {
    await getByLocatorAndFillIt(page, '[data-qa="last_name"]', apellido);
  }
});

When('El usuario inserta direccion', async function () {
  for (const page of pages) {
    await getByLocatorAndFillIt(page, '[data-qa="address"]', direccion);
  }
});


When('El usuario inserta el pais', async function () {
  for (const page of pages) {
    await page.locator('#country').selectOption(pais);
  }
});


When('El usuario inserta el estado', async function () {
  for (const page of pages) {
    await getByLocatorAndFillIt(page, '[data-qa="state"]', estado);
  }
});

When('El usuario inserta la ciudad', async function () {
  for (const page of pages) {
    await getByLocatorAndFillIt(page, '[data-qa="city"]', ciudad);
  }
});

When('El usuario inserta el codigo postal', async function () {
  for (const page of pages) {
    await getByLocatorAndFillIt(page, '[data-qa="zipcode"]', cp);
  }
});

When('El usuario inserta el numero de celular', async function () {
  for (const page of pages) {
    await getByLocatorAndFillIt(page, '[data-qa="mobile_number"]', celular);
  }
});
*/

When('El usuario selecciona el boton de crear cuenta', async function () {
  for (const page of pages) {
    await getByLocator(page, '[data-qa="create-account"]');
  }
});

When('El usuario visualiza el mensaje "ACCOUNT CREATED!"', async function () {
  for (const page of pages) {
    await expect(validateFirstLocator(page, "div", "ACCOUNT CREATED!")).toBeTruthy();
  }
});


When('El usuario selecciona el boton "continuar"', async function () {
  for (const page of pages) {
    await page.locator('[data-qa="continue-button"]').click();
  }
});

Then('El usuario vuelve a la pagina de inicio', async function () {
  for (const page of pages) {
    await expect(page).toHaveURL(BASEURL);
  }
});

Then('El usuario visualiza el mensaje "Email Address already exist!"', async function () {
  for (const page of pages) {
    await expect(validateFirstLocator(page, "div", "Email Address already exist!")).toBeTruthy();
  }
});
Then('El usuario visualiza el mensaje "Your email or password is incorrect!"', async function () {
  for (const page of pages) {
    await expect(validateFirstLocator(page, "div", "Your email or password is incorrect!")).toBeTruthy();
  }
});

When('El usuario clickea en el campo de login Email Address e inserta {string}', async function (email) {
  for (const page of pages) {
    await page.locator('[data-qa="login-email"]').fill(email);
  }
});

When('El usuario clickea en el campo de login password e inserta la contraseña {string}', async function (password) {
  for (const page of pages) {
    await getByLocatorAndFillIt(page, '[data-qa="login-password"]', password);
  }
});

When('El usuario clickea el boton Login', async function () {
  for (const page of pages) {
    await page.locator('[data-qa="login-button"]').click();
  }
});

When('El usuario selecciona el boton "delete account"', async function () {
  for (const page of pages) {
    await page.getByText("delete account").click()
  }
});

Then('El usuario visualiza el mensaje "Account Deleted!"', async function () {
  for (const page of pages) {
    await expect(validateFirstLocator(page, "div", "Account Deleted!")).toBeTruthy();
  }
});


When('El usuario clickea el boton "view product" para el producto con ID {string}', async function (productId) {
  for (const page of pages) {
    const viewProductLink = page.locator(`a[href="/product_details/${productId}"]`);
    await viewProductLink.click();
  }
});

When('El usuario selecciona cantidad e inserta {string}', async function (Cantidad) {
  for (const page of pages) {
    await page.locator('#quantity').fill(Cantidad);
  }
});

When('El usuario selecciona el boton "add to cart"', async function () {
  for (const page of pages) {
    await page.getByText("add to cart").click()
  }
});

Then('El usuario visualiza el mensaje "Your product has been added to cart."', async function () {
  for (const page of pages) {
    await expect(validateFirstLocator(page, "div", "Your product has been added to cart.")).toBeTruthy();
  }
});


When('El usuario clickea el boton "view cart"', async function () {
  for (const page of pages) {
    await page.getByText("view cart").click()
  }
});

When("El usuario es transportado a la pagina view_cart", async () => {
  for (const page of pages) {
    await expect(page).toHaveURL('https://www.automationexercise.com/view_cart');
  }
});

When('El usuario clickea el boton "Proceed To Checkout"', async function () {
  for (const page of pages) {
    await page.getByText("Proceed To Checkout").click()
  }
});

When('El usuario clickea el boton "Place Order"', async function () {
  for (const page of pages) {
    await page.getByText("Place Order").click()
  }
});

When('El usuario inserta los datos de la tarjeta', async function () {
  for (const page of pages) {
    await getByLocatorAndFillIt(page, '[data-qa="name-on-card"]', nombre);
    await getByLocatorAndFillIt(page, '[data-qa="card-number"]', numTarj);
    await getByLocatorAndFillIt(page, '[data-qa="cvc"]', cvcTarj);
    await getByLocatorAndFillIt(page, '[data-qa="expiry-month"]', '06');
    await getByLocatorAndFillIt(page, '[data-qa="expiry-year"]', '2030');
  }
});


When('El usuario clickea el boton "Pay and confirm order"', async function () {
  for (const page of pages) {
    await page.getByText("Pay and confirm order").click()
  }
});



Then('El usuario visualiza el mensaje "Order Placed!"', async function () {
  for (const page of pages) {
    await expect(validateFirstLocator(page, "div", "Order Placed!")).toBeTruthy();
  }
});

