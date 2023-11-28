---
outline: deep
---

## Stream Collect menggunakan java 8

### Stream to List
```java
    List<String> alphabets = Arrays.asList("aa", "bbb", "cat", "dog");
    List<String> data = alphabets.stream()
        .filter(s -> s.startsWith("c"))
        .collect(Collectors.toList());
    System.out.println(data);
```

### Stream to Set
```java
    List<String> alphabets = Arrays.asList("aa", "bbb", "cat", "dog");
    Set<String> data = alphabets.stream()
        .filter(s -> s.startsWith("a"))
        .collect(Collectors.toSet());
    System.out.println(data);
```

### Stream to Map
```java
    List<String> alphabets = Arrays.asList("aa", "bbb", "cat", "dog");
    Map<String, Integer> data = alphabets.stream()
        .collect(Collectors.toMap(Function.identity(), String::length));
    System.out.println(data);
```

## Stream to ArrayList
```java
    List<String> alphabets = Arrays.asList("aa", "bbb", "cat", "dog");
    ArrayList<String> data = alphabets.stream()
        .filter(s -> s.length() > 2)
        .collect(Collectors.toCollection(ArrayList::new));
    System.out.println(data);
```
