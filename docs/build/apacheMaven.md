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

## Terima Kasih
