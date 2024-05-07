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

### Filter number with pojo

pojo java

```java
 public class Employee {
        private int id;
        private String name;
        private int age;
        private long salary;
        private String gender;
        private String deptName;
        private String city;
        private int yearOfJoining;

        public Employee(int id, String name, int age, long salary, String gender, String deptName, String city,
                int yearOfJoining) {
            this.id = id;
            this.name = name;
            this.age = age;
            this.salary = salary;
            this.gender = gender;
            this.deptName = deptName;
            this.city = city;
            this.yearOfJoining = yearOfJoining;
        }

        public long getSalary() {
            return salary;
        }

        public int getExperience() {
            return Calendar.getInstance().get(Calendar.YEAR) - yearOfJoining;
        }

        public String getDeptName() {
            return deptName;
        }

        public int getAge() {
            return age;
        }

        public String getGender() {
            return gender;
        }
        
        public String getOrganization() {
            return deptName;
        }

        @Override
        public String toString() {
            return "Employee{" +
                   "id=" + id +
                   ", name='" + name + '\'' +
                   ", age=" + age +
                   ", salary=" + salary +
                   ", gender='" + gender + '\'' +
                   ", deptName='" + deptName + '\'' +
                   ", city='" + city + '\'' +
                   ", yearOfJoining=" + yearOfJoining +
                   '}';
        }
```

untuk melakukan filter nilai tertinggi bisa ikuti code berikut

```java
List<Employee> employees = Arrays.asList(
            new Employee(1, "John", 25, 5000, "Male", "IT", "London", 2010),
            new Employee(2, "Jane", 30, 6000, "Female", "HR", "Paris", 2015),
            new Employee(3, "Mike", 35, 7000, "Male", "Finance", "Berlin", 2020)
    );
    long highSalary = employees.stream()
    .mapToLong(Employee::getSalary)
    .max()
    .orElse(0);
    System.out.println(highSalary);
```

::: details result
7000
:::

untuk melakukan filter nilai tertinggi kedua bisa ikuti code berikut

```java
        List<Employee> employees = Arrays.asList(
                new Employee(1, "John", 25, 5000, "Male", "IT", "London", 2010),
                new Employee(2, "Jane", 30, 6000, "Female", "HR", "Paris", 2015),
                new Employee(3, "Mike", 35, 7000, "Male", "Finance", "Berlin", 2020)
        );
        long highSalary = employees.stream()
        .mapToLong(Employee::getSalary)
        .boxed()
        .distinct()
        .sorted(Comparator.reverseOrder())
        .skip(1)
        .findFirst()
        .orElse(0L);
        System.out.println(highSalary);
```

::: details result
6000
:::

untuk melakukan mengurutkan nilai bisa ikuti code berikut

```java
List<Employee> employees = Arrays.asList(
        new Employee(1, "John", 25, 5000, "Male", "IT", "London", 2010),
        new Employee(2, "Jane", 30, 6000, "Female", "HR", "Paris", 2015),
        new Employee(3, "John", 20, 3000, "Female", "HR", "Paris", 2015),
        new Employee(4, "Mike", 35, 7000, "Male", "Finance", "Berlin", 2020));
List<Employee> sortedEmployees = employees.stream()
                                           .sorted(Comparator.comparingLong(Employee::getSalary))
                                           .collect(Collectors.toList());

sortedEmployees.forEach(System.out::println);
```
::: details result
Employee{id=3, name='John', age=20, salary=3000, gender='Female', deptName='HR', city='Paris', yearOfJoining=2015}
Employee{id=1, name='John', age=25, salary=5000, gender='Male', deptName='IT', city='London', yearOfJoining=2010}
Employee{id=2, name='Jane', age=30, salary=6000, gender='Female', deptName='HR', city='Paris', yearOfJoining=2015}
Employee{id=4, name='Mike', age=35, salary=7000, gender='Male', deptName='Finance', city='Berlin', yearOfJoining=2020}
:::

untuk melakukan menjumlahkan nilai bisa ikuti code berikut

```java
List<Employee> employees = Arrays.asList(
        new Employee(1, "John", 25, 5000, "Male", "IT", "London", 2010),
        new Employee(2, "Jane", 30, 6000, "Female", "HR", "Paris", 2015),
        new Employee(3, "John", 20, 3000, "Female", "HR", "Paris", 2015),
        new Employee(4, "Mike", 35, 7000, "Male", "Finance", "Berlin", 2020));
long totalSalary = employees.stream()
        .mapToLong(Employee::getSalary)
        .sum();
System.out.println("Total salary: " + totalSalary);
```

::: details result
Total salary: 21000
:::

untuk melakukan mencari nilai rata-rata bisa ikuti code berikut

```java
List<Employee> employees = Arrays.asList(
        new Employee(1, "John", 25, 5000, "Male", "IT", "London", 2010),
        new Employee(2, "Jane", 30, 6000, "Female", "HR", "Paris", 2015),
        new Employee(3, "John", 20, 3000, "Female", "HR", "Paris", 2015),
        new Employee(4, "Mike", 35, 7000, "Male", "Finance", "Berlin", 2020));
double averageSalary = employees.stream()
        .mapToLong(Employee::getSalary)
        .average()
        .orElse(0);
System.out.println("Average salary: " + averageSalary);
```

::: details result
Average salary: 5250.0
:::

untuk mencari high experience bisa ikuti code berikut

```java
List<Employee> employees = Arrays.asList(
        new Employee(1, "John", 25, 5000, "Male", "IT", "London", 2010),
        new Employee(2, "Jane", 30, 6000, "Female", "HR", "Paris", 2015),
        new Employee(3, "John", 20, 3000, "Female", "HR", "Paris", 2009),
        new Employee(4, "Mike", 35, 7000, "Male", "Finance", "Berlin", 2020));
int maxExperience = employees.stream()
        .mapToInt(Employee::getExperience)
        .max()
        .orElse(0);

List<Employee> mostExperiencedEmployees = employees.stream()
        .filter(e -> e.getExperience() == maxExperience)
        .collect(Collectors.toList());

mostExperiencedEmployees.forEach(System.out::println);
```

::: details result
Employee{id=3, name='John', age=20, salary=3000, gender='Female', deptName='HR', city='Paris', yearOfJoining=2009}
:::

untuk melakukan pengecekan karyawan yang di bidang HR bisa ikuti code berikut

```java
List<Employee> employees = Arrays.asList(
        new Employee(1, "John", 25, 5000, "Male", "IT", "London", 2010),
        new Employee(2, "Jane", 30, 6000, "Female", "HR", "Paris", 2015),
        new Employee(3, "John", 20, 3000, "Female", "HR", "Paris", 2009),
        new Employee(4, "Mike", 35, 7000, "Male", "Finance", "Berlin", 2020));
boolean hasHREmployees = employees.stream()
        .anyMatch(e -> "HR".equals(e.getDeptName()));

System.out.println("Are there any HR department employees? " + (hasHREmployees ? "Yes" : "No"));
```

::: details result
Are there any HR department employees? Yes
:::

untuk mencari karyawang yang paling muda laki-laki bisa ikuti code berikut

```java
List<Employee> employees = Arrays.asList(
        new Employee(1, "John", 25, 5000, "Male", "IT", "London", 2010),
        new Employee(2, "Jane", 30, 6000, "Female", "HR", "Paris", 2015),
        new Employee(3, "John", 20, 3000, "Female", "HR", "Paris", 2009),
        new Employee(4, "Mike", 35, 7000, "Male", "Finance", "Berlin", 2020));
Employee youngestFemale = employees.stream()
        .filter(e -> "Male".equals(e.getGender()))
        .min(java.util.Comparator.comparingInt(Employee::getAge))
        .orElse(null);
System.out.println(youngestFemale);
```

::: details result
Employee{id=1, name='John', age=25, salary=5000, gender='Male', deptName='IT', city='London', yearOfJoining=2010}
:::

untuk melakukan count laki-laki dan perempuan di masing-masing department bisa ikuti code berikut

```java
List<Employee> employees = Arrays.asList(
        new Employee(1, "John", 25, 5000, "Male", "IT", "London", 2010),
        new Employee(2, "Jane", 30, 6000, "Female", "HR", "Paris", 2015),
        new Employee(3, "John", 20, 3000, "Female", "HR", "Paris", 2009),
        new Employee(4, "Mike", 35, 7000, "Male", "Finance", "Berlin", 2020));
long malesInIT = employees.stream()
        .filter(e -> "Male".equals(e.getGender()) && "IT".equals(e.getOrganization()))
        .count();
long femalesInIT = employees.stream()
        .filter(e -> "Female".equals(e.getGender()) && "IT".equals(e.getOrganization()))
        .count();
long femalesInHR = employees.stream()
        .filter(e -> "Female".equals(e.getGender()) && "HR".equals(e.getOrganization()))
        .count();

System.out.println("Males in IT: " + malesInIT);
System.out.println("Females in IT: " + femalesInIT);
System.out.println("Females in HR: " + femalesInHR);
```

::: details result
Males in IT: 1
Females in IT: 0
Females in HR: 2
:::

untuk melakukan group karyawan berdasarkan umur bisa ikuti code berikut

```java
List<Employee> employees = Arrays.asList(
        new Employee(1, "John", 25, 5000, "Male", "IT", "London", 2010),
        new Employee(2, "Jane", 30, 6000, "Female", "HR", "Paris", 2015),
        new Employee(3, "John", 20, 3000, "Female", "HR", "Paris", 2009),
        new Employee(4, "Mike", 25, 7000, "Male", "Finance", "Berlin", 2020));
Map<Integer, List<Employee>> groupedByAge = employees.stream()
        .collect(Collectors.groupingBy(Employee::getAge));

groupedByAge.forEach((age, empList) -> {
    System.out.println("Age: " + age);
    empList.forEach(System.out::println);
});
```

::: details result
Age: 20
Employee{id=3, name='John', age=20, salary=3000, gender='Female', deptName='HR', city='Paris', yearOfJoining=2009}
Age: 25
Employee{id=1, name='John', age=25, salary=5000, gender='Male', deptName='IT', city='London', yearOfJoining=2010}
Employee{id=4, name='Mike', age=25, salary=7000, gender='Male', deptName='Finance', city='Berlin', yearOfJoining=2020}
Age: 30
Employee{id=2, name='Jane', age=30, salary=6000, gender='Female', deptName='HR', city='Paris', yearOfJoining=2015}
:::
