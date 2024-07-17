## Membuat Projek Baru

pada command ini menggunakan archetype yang sederhana, untuk lebih detailnya archetype bisa kunjungi link berikut https://maven.apache.org/guides/introduction/introduction-to-archetypes.html

```sh
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
```

## Apache Maven Compiler Plugin

Plugin ini untuk compile dengan dependensinya<br>
https://maven.apache.org/plugins/maven-assembly-plugin/usage.html<br>
untuk command compilenya 

```sh
mvn clean package assembly:single
```

## Link Repository Maven
https://search.maven.org/<br>
https://mvnrepository.com/

## Maven pada docker

```sh
docker pull maven:3.9.4-eclipse-temurin-8-alpine
```

## Reusing the Maven local repository

```sh
docker volume create --name maven-repo
```

```sh
docker run -it -v maven-repo:/root/.m2 maven:3.9.4-eclipse-temurin-8-alpine mvn archetype:generate
```

## Maven Build with dependency
```
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-shade-plugin</artifactId>
            <version>3.2.4</version>
            <executions>
                <execution>
                    <phase>package</phase>
                    <goals>
                        <goal>shade</goal>
                    </goals>
                    <configuration>
                        <transformers>
                            <transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                                <mainClass>com.yourpackage.MainClass</mainClass>
                            </transformer>
                        </transformers>
                    </configuration>
                </execution>
            </executions>
        </plugin>
    </plugins>
</build>
```
lalu jalankan command
```sh
mvn clean package -DskipTests
```

## Check Dependency tree

```sh
mvn dependency:tree
```

## Check dependency update

```
mvn versions:display-plugin-updates
```

## Update dependency automatically

jika mendefinisikan versi di dependency itu sendiri ikuti langkah berikut: 

```
mvn versions: use-latest-versions
```
jika mendefinisikan versi dependency di properties block ikuti langkah berikut:

```
mvn versions:update-properties
```

## Check Dependency Vulnerability

langsung jalankan melalui terminal

```sh
mvn org.owasp:dependency-check-maven:7.0.4:aggregate
```

jika ingin menampilkan dengan output format lainnya

```sh
mvn org.owasp:dependency-check-maven:7.0.4:aggregate -Dformats=html -Dformats=json
```

atau bisa juga menambahkan di pom.xml
```xml
<plugin>
    <groupId>org.owasp</groupId>
    <artifactId>dependency-check-maven</artifactId>
    <version>7.0.4</version>
    <executions>
        <execution>
            <goals>
                <goal>aggregate</goal>
            </goals>
         </execution>
    </executions>
    <configuration>
        <formats>
            <format>json</format>
            <format>html</format>
        </formats>
    </configuration>
</plugin>
```
lalu jalankan
```sh
mvn verify
```

## Running Spesific java class


```sh
mvn exec:java -D"exec.mainClass"="com.example.Main"
```

```sh
mvn compile exec:java -D"exec.mainClass"="com.example.App" -Dexec.cleanupDaemonThreads=false
```

running with file args
```sh
mvn compile exec:java -D"exec.mainClass"="com.example.App" -Dexec.cleanupDaemonThreads=false -Dexec.args="src/main/resources/config.properties"
```

### Fix Bug
```
SLF4J: No SLF4J providers were found.
SLF4J: Defaulting to no-operation (NOP) logger implementation
SLF4J: See http://www.slf4j.org/codes.html#noProviders for further details.
```

```
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-simple</artifactId>
    <version>2.0.9</version>
    <scope>runtime</scope>
</dependency>
```

## Terima Kasih
