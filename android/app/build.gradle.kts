import java.util.Properties
import java.io.FileInputStream
import groovy.json.JsonSlurper

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

val versionsJsonString = appConfigProperties.getProperty("versions")
val versionsMap = if (versionsJsonString != null) {
    JsonSlurper().parseText(versionsJsonString) as Map<String, Map<String, Any>>
} else {
    throw GradleException("Missing 'versions' key in app-config.properties")
}

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {

    namespace = appConfigProperties.getProperty("applicationId")
    compileSdk = 36

    defaultConfig {
        applicationId = appConfigProperties.getProperty("applicationId")
        minSdk = appConfigProperties.getProperty("minSdk").toInt()
        targetSdk = appConfigProperties.getProperty("targetSdk").toInt()
        val defaultVersion = versionsMap["default"] ?: throw GradleException("No 'default' version defined")
        versionCode = defaultVersion["versionCode"] as Int
        versionName = defaultVersion["versionName"] as String
        manifestPlaceholders["appName"] = appConfigProperties.getProperty("appName")
    }

    signingConfigs {
        create("release") {
            if (keystorePropertiesFile.exists()) {
                storeFile = file(keystoreProperties.getProperty("storeFile"))
                storePassword = keystoreProperties.getProperty("storePassword")
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
            }
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }

    flavorDimensions += "environment"

    productFlavors {
        create("dev") {
            dimension = "environment"
            applicationIdSuffix = ".dev"
            val devVersion = versionsMap["dev"]!!
            versionCode = devVersion["versionCode"] as Int
            versionName = devVersion["versionName"] as String
            manifestPlaceholders["appName"] = appConfigProperties.getProperty("appName") + " Dev"
        }

        create("stage") {
            dimension = "environment"
            applicationIdSuffix = ".stage"
            val stageVersion = versionsMap["stage"]!!
            versionCode = stageVersion["versionCode"] as Int
            versionName = stageVersion["versionName"] as String
            manifestPlaceholders["appName"] = appConfigProperties.getProperty("appName") + " Stage"
        }

        create("prod") {
            dimension = "environment"
            val prodVersion = versionsMap["prod"]!!
            versionCode = prodVersion["versionCode"] as Int
            versionName = prodVersion["versionName"] as String
            manifestPlaceholders["appName"] = appConfigProperties.getProperty("appName")
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
