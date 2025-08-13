import { Page } from "@playwright/test";
import { LocatorType } from "./types";

export const getElementByRole = async (
  page: Page,
  roleType: LocatorType,
  name: string
) => {
 return page.getByRole(roleType, { name: name }).click();
};

export const getElementByText = async (
  page: Page,
  text: string,
  exact?: boolean
) => {
  page.getByText(text, { exact: exact });
};

export const getElementByRoleAndClickIt = async (
  page: Page,
  roleType: LocatorType,
  name: string
) => {
  page.getByRole(roleType, { name }).click();
};

export const getElementAndCheckIt = async (page: Page) => {
  page.getByRole("checkbox").check();
};

export const getTextboxAndClear = async (page: Page) => {
  page.getByRole("textbox").clear();
};

export const getTextboxAndFill = async (
  page: Page,
  roleType: LocatorType,
  value: string
) => {
  page.getByRole(roleType).fill(value);
};

export const getAttributeByName = async (
  page: Page,
  name: string,
  options: any
) => {
  page.getAttribute(name, options);
};

export const getAltByText = async (page: Page, altText: string) => {
  page.getByAltText(altText).click();
};

export const getByLabelAndFillIt = async (page: Page, label: string, keyword) => {
  page.getByLabel(label, { exact: true }).fill(keyword);
};

export const getByPlaceholderAndFillIt = async (
  page: Page,
  placeholder: string,
  value: string
) => {
  page.getByPlaceholder(placeholder).fill(value);
};

export const getByPlaceholderAndClickIt = async (
  page: Page,
  placeholder: string,
) => {
  page.getByPlaceholder(placeholder).click();
};

export const getByTestId = async (page: Page, testId: string) => {
  page.getByTestId(testId);
};

export const getByText = async (page: Page, text: string, exact?: boolean) => {
  page.getByText(text, { exact: exact });
};

export const getByTitle = async (page: Page, title: string) => {
  page.getByTitle(title);
};

export const getInputValue = async (page: Page) => {
  page.getByRole("textbox").inputValue();
};

export const getCheckboxValue = async (page: Page) => {
  page.getByRole("checkbox").isChecked();
};

export const findLocator = async (page: Page, locator: LocatorType) => {
  return await page.locator(locator);
}

export const pressKey = async (page: Page, key: string) => {
  await page.keyboard.press(key);
}

export const getByLocator = async (page: Page, locator: LocatorType) => {
  await page.locator(locator).click();
}

export const getByLocatorAndFillIt = async (page: Page, locator: LocatorType, value: string) => {
  await page.locator(locator).fill(value);
};

