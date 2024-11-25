---
outline: deep
---

### Hashing MD5 dengan apache commons
```pom
<dependency>
    <groupId>commons-codec</groupId>
    <artifactId>commons-codec</artifactId>
    <version>1.17.1</version>
</dependency>
```

```java
String hash = DigestUtils.md5Hex("secret");
```

reference https://commons.apache.org/
