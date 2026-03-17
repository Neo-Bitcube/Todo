import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/config/routes/route_location.dart';
import 'package:todo/screens/create_task_screen.dart';
import 'package:todo/screens/home_screen.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigationKey,
    builder: CreateTaskScreen.builder,
  ),
];