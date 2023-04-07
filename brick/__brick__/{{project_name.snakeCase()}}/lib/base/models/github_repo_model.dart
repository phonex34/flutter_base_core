import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

// A class that represents a GitHub repository
class GithubRepoModel {
  GithubRepoModel({this.name, this.description, this.stars, this.url});
  // A factory method that creates a Repository object from a JSON map
  factory GithubRepoModel.fromJson(Map<String, dynamic> json) {
    return GithubRepoModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      stars: json['stargazers_count'] as int?,
      url: json['html_url'] as String?,
    );
  }

  static List<GithubRepoModel> getList(List<dynamic> json) {
    final objectList = <GithubRepoModel>[];
    for (final v in json) {
      objectList.add(GithubRepoModel.fromJson(v as Map<String, dynamic>));
    }
    return objectList;
  }

  final String? name;
  final String? description;
  final int? stars;
  final String? url;
}
