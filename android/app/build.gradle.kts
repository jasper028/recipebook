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
        FileInputStream(keystorePropertiesFile).use { keystoreProperties.load(it) }
    } else {
        println("Warning: key.properties file not found. Using environment variables instead.")
    }

    signingConfigs {
        create("release") {
            val storeFilePath = keystoreProperties["storeFile"]?.toString() ?: "android/app/keystore.jks"
            storeFile = file(rootProject.file(storeFilePath))
            storePassword = System.getenv("KEYSTORE_PASSWORD") ?: keystoreProperties["storePassword"]?.toString() ?: ""
            keyAlias = System.getenv("KEY_ALIAS") ?: keystoreProperties["keyAlias"]?.toString() ?: ""
            keyPassword = System.getenv("KEY_PASSWORD") ?: keystoreProperties["keyPassword"]?.toString() ?: ""

            // Explicitly check if these properties are not empty
            if (storePassword.isNullOrEmpty() || keyAlias.isNullOrEmpty() || keyPassword.isNullOrEmpty()) {
                println("Warning: Keystore credentials are missing or incorrect.")
            }
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
