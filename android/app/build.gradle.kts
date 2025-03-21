import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // Ensure Flutter plugin is last
}

android {
    namespace = "com.example.recipebookapp"
    compileSdk = 34 // Update this to match Flutter’s latest compile SDK

    defaultConfig {
        applicationId = "com.example.recipebookapp"
        minSdk = 21 // Set a reasonable minSdk
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    val keystorePropertiesFile = rootProject.file("key.properties")
    val keystoreProperties = Properties()
    if (keystorePropertiesFile.exists()) {
        keystoreProperties.load(FileInputStream(keystorePropertiesFile))
    }

    signingConfigs {
        create("release") {
            storeFile = file(keystoreProperties["storeFile"]?.toString() ?: "app/keystore.jks") // Ensure correct path
            storePassword = keystoreProperties["storePassword"]?.toString() ?: System.getenv("KEYSTORE_PASSWORD") ?: ""
            keyAlias = keystoreProperties["keyAlias"]?.toString() ?: System.getenv("KEY_ALIAS") ?: ""
            keyPassword = keystoreProperties["keyPassword"]?.toString() ?: System.getenv("KEY_PASSWORD") ?: ""
        }

    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true // Correct Kotlin DSL syntax
            isShrinkResources = true // Correct Kotlin DSL syntax
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
}

flutter {
    source = "../.."
}
