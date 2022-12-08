# Apache Maven
> disusun oleh Hardiyanto

<div align="center">
  <a href="https://maven.apache.org">
    <img src="https://github.com/dwiHard/five_byte.github.io/blob/master/images/maven.jpeg" alt="Logo" width="150" height="120">
  </a>

<h3 align="center">README-Vim</h3>

  <p align="center">
    An awesome README by <b>Hardiyanto</b>!
    <br />
    <a href="https://maven.apache.org"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/dwiHard/five_byte.github.io/blob/master/vim/vim.md#daftar-isi">Daftar Isi</a>
    ·
    <a href="https://github.com/dwiHard/five_byte.github.io#my-repository---">Awesome My README</a>
  </p>
</div>

### Daftar Isi
* [Membuat Projek Baru](#membuat-projek-baru)
* [Apache Maven Compiler Plugin](#apache-maven-compiler-plugin)
* [Link Repository Maven](#link-repository-maven)


#### Membuat Projek Baru
pada command ini menggunakan archetype yang sederhana, untuk lebih detailnya archetype bisa kunjungi link berikut https://maven.apache.org/guides/introduction/introduction-to-archetypes.html
```
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
```

### Apache Maven Compiler Plugin
Plugin ini untuk compile dengan dependensinya<br>
https://maven.apache.org/plugins/maven-assembly-plugin/usage.html<br>
untuk command compilenya 
```
mvn clean package assembly:single
```

#### Link Repository Maven
https://search.maven.org/<br>
https://mvnrepository.com/

### Terima Kasih
