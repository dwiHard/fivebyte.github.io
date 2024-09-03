---
outline: deep
---

## Stream Map menggunakan java 8

### Map menghitung kata
```java
List<String> names = Arrays.asList("Alice", "Bob", "Charlie");
List<Integer> nameLengths = names.stream()
                                 .map(String::length)
                                 .collect(Collectors.toList());

System.out.println(nameLengths); // Output: [5, 3, 7]
```

### Map filter 
```java
Map<String, Integer> map = new HashMap<>();
map.put("Alice", 30);
map.put("Bob", 25);
map.put("Charlie", 35);

Map<String, Integer> updatedMap = map.entrySet().stream()
    .filter(entry -> entry.getValue() > 28)
    .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));

System.out.println(updatedMap); // Output: {Alice=30, Charlie=35}
```

### Map convert List Integer ke List String
```java
List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);
List<String> strings = numbers.stream()
    .map(String::valueOf)
    .collect(Collectors.toList());
```
