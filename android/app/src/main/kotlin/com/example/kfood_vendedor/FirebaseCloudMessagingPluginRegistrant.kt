package com.example.kfood_vendedor

import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin

class FirebaseCloudMessagingPluginRegistrant {
    companion object {
        fun registerWith(registry: PluginRegistry) {
            if (alreadyRegisteredWith(registry)) {
                println("ya esta registrado $registry")
                return;
            }
            FirebaseMessagingPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"))
            println("a registrar")
        }

        fun alreadyRegisteredWith(registry: PluginRegistry): Boolean {
            println("esta registrado?")
            val key = FirebaseCloudMessagingPluginRegistrant::class.java.name
            if (registry.hasPlugin(key)) {
                return true
            }
            registry.registrarFor(key)
            return false
        }
    }
}