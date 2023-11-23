---
outline: deep
---

## Filter Null dan Empty data

contoh filter data null dan empty di java 8 menggunakan Stream.filter(). filter() adalah method yang ada di class Stream. 
untuk kasus kali ini saya akan menggunakan sample data seperti ini

```
"Google", "Yahoo", "Reddit", null, ""
```

### Filter String null

untuk menghilangkan semua null bisa ikuti code berikut:

::: code-group
```java [without variable]
    List<String> data = new ArrayList<>(Arrays.asList("Google", "Yahoo", "Reddit", null, ""));
    data.stream()
      .filter(Objects::nonNull) // [!code focus]
      .forEach(System.out::println);
```
```java [with variable]
    List<String> data = new ArrayList<>(Arrays.asList("Google", "Yahoo", "Reddit", null, ""));
    List<String> data2 = data.stream() // [!code ++]
      .filter(Objects::nonNull)
      .collect(Collectors.toList()); // [!code ++]
    System.out.println(data2);
```
:::

::: details result
[Google, Yahoo, Reddit, ]
:::

### Filter null dan String null

untuk menghilangkan semua null dan string kosong bisa ikuti code berikut:

::: code-group
```java [without variable]
    List<String> data = new ArrayList<>(Arrays.asList("Google", "Yahoo", "Reddit", null, ""));
    data.stream()
      .filter(Objects::nonNull) // [!code focus]
      .filter(s -> !s.isEmpty()) // [!code focus]
      .forEach(System.out::println);

```

```java [with variable]
    List<String> data = new ArrayList<>(Arrays.asList("Google", "Yahoo", "Reddit", null, ""));
    List<String> data3 = data.stream()  // [!code ++]
      .filter(Objects::nonNull)
      .filter(s -> !s.isEmpty())
      .collect(Collectors.toList());  // [!code ++]
    System.out.println(data3);
```
:::

::: details result
Google
Yahoo
Reddit
:::

### Filter dan collect
untuk melakukan filter String di bawah dari 6 bisa ikuti code berikut

```java
    List<String> data = new ArrayList<>(Arrays.asList("Google", "Yahoo", "Reddit", null, ""));
    List<String> data3 = data.stream()
      .filter(Objects::nonNull) // [!code focus]
      .filter(s -> !s.isEmpty()) // [!code focus] 
      .filter(s -> s.length() >= 6) // [!code focus]
      .collect(Collectors.toList());  // [!code focus]
    System.out.println(data3);
```

::: details result
[Google, Reddit]
:::

### Filter number

untuk melakukan filter Number bisa ikuti code berikut

```java
    List<String> numbers = Arrays.asList("1", "2", "3", "4", "5", "6");
    System.out.println("original list: " + numbers);

    List<Integer> even = numbers.stream()
        .map(s -> Integer.valueOf(s)) // [!code focus]
        .filter(number -> number % 2 == 0) // [!code focus]
        .collect(Collectors.toList());

    System.out.println("processed list, only even numbers: " + even);
```

::: details result
original list: [1, 2, 3, 4, 5, 6]
processed list, only even numbers: [2, 4, 6]
:::

