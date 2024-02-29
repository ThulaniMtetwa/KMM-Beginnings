package com.example.dailpulsepractice

expect class Platform {
    val name: String
    val osVersion: String
    val deviceModel: String
    val density: Int

    fun logSystemInfo()
}