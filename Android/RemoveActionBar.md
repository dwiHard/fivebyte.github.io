# Remove Action Bar 
> Disusun oleh Hardiyanto

### Daftar isi
* [Source code](#source-code)
* [Hasil](#hasil)


##### Source Code
Langkah pertama masuk ke directory ```app/res/values/themes``` lalu edit themes.xml tambahkan kode program berikut dibawah </style>
```
    <style name="Theme.RemoveActionBar.NoActionBar">
        <item name="windowActionBar">false</item>
        <item name="windowNoTitle">true</item>
    </style>
```
Langkah kedua masuk ke directory ```app/manifests``` lalu edit AndroidManifest.xml tambahkan kode program berikut didalam <activity> dibawah android:name
```
android:theme="@style/Theme.RemoveActionBar.NoActionBar"
```
#### Hasil
<img src="https://gitlab.com/dwiHard/LinuxAdministration/-/blob/master/Android/ScreenShot/photo_2021-09-18_06-27-42.jpg"  width="270" height="502">

## Terima Kasih
