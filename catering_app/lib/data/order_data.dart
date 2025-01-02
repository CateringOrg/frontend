import 'package:flutter/material.dart';

class OrderDTO {
  final String orderId; // UUID represented as a String
  final String clientLogin;
  final String deliveryAddress;
  final String deliveryMethod;
  final String status;
  final List<MealDTO> meals; // List of MealDTO objects
  final DateTime deliveryTime;
  final DateTime orderCreationTime;

  OrderDTO({
    required this.orderId,
    required this.clientLogin,
    required this.deliveryAddress,
    required this.deliveryMethod,
    required this.status,
    required this.meals,
    required this.deliveryTime,
    required this.orderCreationTime,
  });

  // Factory constructor to create an OrderDTO from JSON
  factory OrderDTO.fromJson(Map<String, dynamic> json) {
    return OrderDTO(
      orderId: json['orderId'] as String,
      clientLogin: json['clientLogin'] as String,
      deliveryAddress: json['deliveryAddress'] as String,
      deliveryMethod: json['deliveryMethod'] as String,
      status: json['status'] as String,
      meals: (json['meals'] as List<dynamic>)
          .map((meal) => MealDTO.fromJson(meal as Map<String, dynamic>))
          .toList(),
      deliveryTime: DateTime.parse(json['deliveryTime'] as String),
      orderCreationTime: DateTime.parse(json['orderCreationTime'] as String),
    );
  }

  // Convert an OrderDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'clientLogin': clientLogin,
      'deliveryAddress': deliveryAddress,
      'deliveryMethod': deliveryMethod,
      'status': status,
      'meals': meals.map((meal) => meal.toJson()).toList(),
      'deliveryTime': deliveryTime.toIso8601String(),
      'orderCreationTime': orderCreationTime.toIso8601String(),
    };
  }
}

class MealDTO {
  final String name;
  final int quantity;
  final double price;

  MealDTO({
    required this.name,
    required this.quantity,
    required this.price,
  });

  // Factory constructor to create a MealDTO from JSON
  factory MealDTO.fromJson(Map<String, dynamic> json) {
    return MealDTO(
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );
  }

  // Convert a MealDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }
}
