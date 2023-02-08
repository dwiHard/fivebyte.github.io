<div align="center">
  <a href="https://www.selenium.dev/documentation/">
    <img src="https://github.com/dwiHard/five_byte.github.io/blob/master/images/selenium.png" alt="Logo" width="150" height="100">
  </a>

<h3 align="center">README-Selenium</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://www.selenium.dev/documentation/"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/cheatsheet/selenium.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io#my-repository---">Awesome My README</a>
  </p>
</div>


### Daftar isi
* [Driver Install](#driver-install)
* [Selenium Locators](#selenium-locators)
* [Extentions](#extentions)



### Driver Install
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

### Selenium Locators
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

### Extentions
* [Selectorhub Mozilla](https://addons.mozilla.org/en-US/firefox/addon/selectorshub/)
* [Selectorshub Chrome](https://chrome.google.com/webstore/detail/selectorshub/ndgimibanhlabgdgjcpbbndiehljcpfh)