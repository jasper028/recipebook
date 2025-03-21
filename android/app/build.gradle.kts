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
        println("Warning: key.properties file not found. Using environment variables instead.")
    }

    signingConfigs {
        create("release") {
            val storeFilePath = keystoreProperties["storeFile"]?.toString() ?: "android/app/keystore.jks"
            val storeFile = rootProject.file(storeFilePath)

            if (!storeFile.exists()) {
                throw GradleException("Keystore file not found at: $storeFilePath")
            }

            // Store values in local immutable variables to prevent smart cast issues
            val storePasswordVal = System.getenv("SIGNING_KEYSTORE_PASSWORD") ?: keystoreProperties["storePassword"]?.toString() ?: ""
            val keyAliasVal = System.getenv("SIGNING_KEY_ALIAS") ?: keystoreProperties["keyAlias"]?.toString() ?: ""
            val keyPasswordVal = System.getenv("SIGNING_KEY_PASSWORD") ?: keystoreProperties["keyPassword"]?.toString() ?: ""

            // Assign to signingConfig
            this.storeFile = storeFile
            this.storePassword = storePasswordVal
            this.keyAlias = keyAliasVal
            this.keyPassword = keyPasswordVal

            if (storePasswordVal.isBlank() || keyAliasVal.isBlank() || keyPasswordVal.isBlank()) {
                throw GradleException("Keystore credentials are missing. Please check key.properties or environment variables.")
            }
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
