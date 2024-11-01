import 'package:flutter/material.dart';
import 'package:projeto_barbeiro/meu_app.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MeuApp());
}
