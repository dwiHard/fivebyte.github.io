## Driver Install

Firefox

```
WebDriver driver = new FirefoxDriver();
```

Chrome

```
WebDriver driver = new ChromeDriver();
```

Safari

```
WebDriver driver = new SafariDriver();
```

## Selenium Locators

Locator by id

```
driver.findElement(By.id("inputUsername")).sendKeys("value");
```

Locator by name

```
driver.findElement(By.name("inputPassword")).sendKeys("value");
```

Locator by class name

```
driver.findElement(By.className("signInBtn")).sendKeys("value");
```

Locator by xpath

```
driver.findElement(By.xpath("//input[@placeholder='Name']")).sendKeys("value");
```

## Extentions
* [Selectorhub Mozilla](https://addons.mozilla.org/en-US/firefox/addon/selectorshub/)
* [Selectorshub Chrome](https://chrome.google.com/webstore/detail/selectorshub/ndgimibanhlabgdgjcpbbndiehljcpfh)