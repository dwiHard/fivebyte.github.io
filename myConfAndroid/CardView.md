# Card View Desain
> Disusun oleh Hardiyanto

### Daftar isi
* [Source code](#source-code)
* [Hasil](#hasil)

#### Source code
Pada activity_main.xml ikuti source code berikut :

```
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:weightSum="10"
    android:background="@drawable/background"
    tools:context=".MainActivity">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:gravity="center"
        android:layout_weight="4">
        <TextView
            android:text="Welcome to Pandawa Byte"
            android:textColor="#fff"
            android:textStyle="bold"
            android:textSize="30sp"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content">

        </TextView>
    </LinearLayout>
    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="6"
        android:layout_margin="20dp"
        android:background="#fff"
        android:orientation="vertical">
        <GridLayout
            android:rowCount="2"
            android:columnCount="2"
            android:padding="14dp"
            android:alignmentMode="alignMargins"
            android:columnOrderPreserved="false"
            android:layout_width="match_parent"
            android:layout_height="match_parent">

            <androidx.cardview.widget.CardView
                android:layout_width="0dp"
                android:layout_height="0dp"
                android:layout_columnWeight="1"
                android:layout_rowWeight="1"
                app:cardElevation="8dp"
                app:cardCornerRadius="8dp"
                android:layout_marginBottom="16dp"
                android:layout_marginLeft="16dp"
                android:layout_marginRight="16dp">
                <LinearLayout
                    android:layout_gravity="center_horizontal|center_vertical"
                    android:layout_width="wrap_content"
                    android:weightSum="10"
                    android:layout_margin="16dp"
                    android:layout_height="wrap_content"
                    android:orientation="vertical">

                    <ImageView
                        android:layout_width="70dp"
                        android:layout_height="70dp"
                        android:layout_weight="8"
                        android:src="@drawable/icon">
                    </ImageView>
                    <TextView
                        android:text="Ra reti"
                        android:textColor="#000"
                        android:textSize="16sp"
                        android:textAlignment="center"
                        android:layout_width="match_parent"
                        android:layout_height="match_parent">

                    </TextView>
                </LinearLayout>
            </androidx.cardview.widget.CardView>
            <androidx.cardview.widget.CardView
                android:layout_width="0dp"
                android:layout_height="0dp"
                android:layout_columnWeight="1"
                android:layout_rowWeight="1"
                app:cardElevation="8dp"
                app:cardCornerRadius="8dp"
                android:layout_marginBottom="16dp"
                android:layout_marginLeft="16dp"
                android:layout_marginRight="16dp">
                <LinearLayout
                    android:layout_gravity="center_horizontal|center_vertical"
                    android:layout_width="wrap_content"
                    android:weightSum="10"
                    android:layout_margin="16dp"
                    android:layout_height="wrap_content"
                    android:orientation="vertical">

                    <ImageView
                        android:layout_width="70dp"
                        android:layout_height="70dp"
                        android:layout_weight="8"
                        android:src="@drawable/icon2">
                    </ImageView>
                    <TextView
                        android:text="Ra reti"
                        android:textColor="#000"
                        android:textSize="16sp"
                        android:textAlignment="center"
                        android:layout_width="match_parent"
                        android:layout_height="match_parent">

                    </TextView>
                </LinearLayout>
            </androidx.cardview.widget.CardView>
            <androidx.cardview.widget.CardView
                android:layout_width="0dp"
                android:layout_height="0dp"
                android:layout_columnWeight="1"
                android:layout_rowWeight="1"
                app:cardElevation="8dp"
                app:cardCornerRadius="8dp"
                android:layout_marginBottom="16dp"
                android:layout_marginLeft="16dp"
                android:layout_marginRight="16dp">
                <LinearLayout
                    android:layout_gravity="center_horizontal|center_vertical"
                    android:layout_width="wrap_content"
                    android:weightSum="10"
                    android:layout_margin="16dp"
                    android:layout_height="wrap_content"
                    android:orientation="vertical">

                    <ImageView
                        android:layout_width="70dp"
                        android:layout_height="70dp"
                        android:layout_weight="8"
                        android:src="@drawable/icon3">
                    </ImageView>
                    <TextView
                        android:text="Ra reti"
                        android:textColor="#000"
                        android:textSize="16sp"
                        android:textAlignment="center"
                        android:layout_width="match_parent"
                        android:layout_height="match_parent">

                    </TextView>
                </LinearLayout>
            </androidx.cardview.widget.CardView>
            <androidx.cardview.widget.CardView
                android:layout_width="0dp"
                android:layout_height="0dp"
                android:layout_columnWeight="1"
                android:layout_rowWeight="1"
                app:cardElevation="8dp"
                app:cardCornerRadius="8dp"
                android:layout_marginBottom="16dp"
                android:layout_marginLeft="16dp"
                android:layout_marginRight="16dp">
                <LinearLayout
                    android:layout_gravity="center_horizontal|center_vertical"
                    android:layout_width="wrap_content"
                    android:weightSum="10"
                    android:layout_margin="16dp"
                    android:layout_height="wrap_content"
                    android:orientation="vertical">

                    <ImageView
                        android:layout_width="70dp"
                        android:layout_height="70dp"
                        android:layout_weight="8"
                        android:src="@drawable/icon4">
                    </ImageView>
                    <TextView
                        android:text="Ra reti"
                        android:textColor="#000"
                        android:textSize="16sp"
                        android:textAlignment="center"
                        android:layout_width="match_parent"
                        android:layout_height="match_parent">
                    </TextView>
                </LinearLayout>
            </androidx.cardview.widget.CardView>
        </GridLayout>
    </LinearLayout>

</LinearLayout>
```

#### Hasil
<img src="https://gitlab.com/dwiHard/LinuxAdministration/-/raw/master/Android/ScreenShot/photo_2021-09-17_19-30-44.jpg"  width="270" height="502">

### Terima Kasih
