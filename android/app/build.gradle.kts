import java.util.Properties
import java.io.FileInputStream

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")

if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

val appConfigProperties = Properties()
val appConfigPropertiesFile = rootProject.file("app-config.properties")

if (appConfigPropertiesFile.exists()) {
    appConfigProperties.load(FileInputStream(appConfigPropertiesFile))
}

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}


android {
    namespace = appConfigProperties["applicationId"] as String
    compileSdk = 36

    defaultConfig {
        applicationId = appConfigProperties["applicationId"] as String
        minSdk = (appConfigProperties["minSdk"] as String).toInt()
        targetSdk = (appConfigProperties["targetSdk"] as String).toInt()
        versionCode = (appConfigProperties["versionCode"] as String).toInt()
        versionName = appConfigProperties["versionName"] as String
    }
     signingConfigs {
        create("release") {
            storeFile = file(keystoreProperties["storeFile"] as String)
            storePassword = keystoreProperties["storePassword"] as String
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
        }
    }
buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
            // proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }


    // Required when using multiple flavors
    flavorDimensions += "environment"

   productFlavors {
        create("dev") {
            dimension = "environment"
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
            manifestPlaceholders["appName"] = "NewGetxCLI"
        }

        create("stage") {
            dimension = "environment"
            applicationIdSuffix = ".stage"
            versionNameSuffix = "-stage"
            manifestPlaceholders["appName"] = "Stage NewGetxCLI"
        }

        create("prod") {
            dimension = "environment"
            manifestPlaceholders["appName"] = "NewGetxCLI"
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}


flutter {
    source = "../.."
}
