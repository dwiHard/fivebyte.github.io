---
outline: deep
---

## Menggunakan ForEach Java

### Melakukan print semua data collections

::: code-group
```java [code 1]
 List<String> alphabets = new ArrayList<>(Arrays.asList("aa", "bbb", "cat", "dog"));
 alphabets.forEach(s -> System.out.println(s)); // [!code focus]
```

```java [code 2]
 List<String> alphabets = new ArrayList<>(Arrays.asList("aa", "bbb", "cat", "dog"));
 alphabets.forEach(System.out::println); // [!code focus]
```
```java [code 3]
 List<String> alphabets = new ArrayList<>(Arrays.asList("aa", "bbb", "cat", "dog"));
 alphabets.forEach(s -> System.out.print(s + ",")); // [!code focus]
```
:::

### Menggunakan filter dan forEach

<b>case code 1</b>: mengambil data dengan awalan "d"<br>
<b>case code 2</b>: mengambil data yang jumlah katanya lebih dari 2

::: code-group

```java [code 1]
    List<String> alphabets = new ArrayList<>(Arrays.asList("aa", "bbb", "cat", "dog"));
    alphabets.stream()
        .filter(s -> s.startsWith("d")) // [!code focus]
        .forEach(System.out::println); // [!code focus]
```
```java [code 2]
    List<String> alphabets = new ArrayList<>(Arrays.asList("aa", "bbb", "cat", "dog"));
    alphabets.stream()
        .filter(s -> s.length() > 2) // [!code focus]
        .forEach(System.out::println); // [!code focus]
```
:::

### Menggunakan map dan forEach
menghitung jumlah kata
```java
    List<String> alphabets = new ArrayList<>(Arrays.asList("aa", "bbb", "cat", "dog"));
    alphabets.stream()
        .mapToInt(s -> s.length()) // [!code focus]
        .forEach(System.out::println); // [!code focus]
```

### Ambil data foreach ke list
::: code-group
```java [case]
List<String> itemsList = new ArrayList<>(); 
for (int i = 0; i < itemsArray.length(); i++) { 
    itemsList.add(itemsArray.getString(i)); 
}
```
```java [basic]
List<String> itemsList = new ArrayList<>();
itemsArray.forEach(item -> itemsList.add(item.toString()));
```
```java [clean code]
List<String> itemsList = new ArrayList<>();
itemsArray.forEach(itemsList::add);
```
```java [condition]
List<String> itemsList = new ArrayList<>();
itemsArray.forEach(item -> {
    if (item instanceof String) {
        itemsList.add((String) item);
    }
});
```
:::
