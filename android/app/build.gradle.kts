import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // Ensure Flutter plugin is last
}

android {
    namespace = "com.example.recipebookapp"
    compileSdk = 34 // Match Flutter’s latest compile SDK

    defaultConfig {
        applicationId = "com.example.recipebookapp"
        minSdk = 21
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

    // Load keystore properties
    val keystorePropertiesFile = rootProject.file("key.properties")
    val keystoreProperties = Properties()

    if (keystorePropertiesFile.exists()) {
        FileInputStream(keystorePropertiesFile).use { keystoreProperties.load(it) }
    } else {
        throw GradleException("key.properties file not found.")
    }

    signingConfigs {
        create("release") {
            storeFile = file(rootProject.file("android/app/keystore.jks"))
            storePassword = System.getenv("KEYSTORE_PASSWORD") ?: keystoreProperties["storePassword"]?.toString() ?: ""
            keyAlias = System.getenv("KEY_ALIAS") ?: keystoreProperties["keyAlias"]?.toString() ?: ""
            keyPassword = System.getenv("KEY_PASSWORD") ?: keystoreProperties["keyPassword"]?.toString() ?: ""
        }
    }


    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

flutter {
    source = "../.."
}
