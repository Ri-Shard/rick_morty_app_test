library screen;

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_rickandmorty_map/common/theme/styles.dart';
import 'package:test_rickandmorty_map/domain/entities/characters_entities.dart';
import 'package:test_rickandmorty_map/domain/services/notification_service.dart';
import 'package:test_rickandmorty_map/presentation/characters/providers/characters_controller.dart';
import 'package:test_rickandmorty_map/presentation/characters/providers/characters_provider.dart';

import 'widgets/widget.dart';

//--------------------- Rick and morty ---------------------
part 'characters/screen/characters_screen.dart';
part 'characters/screen/character_detail_screen.dart';
part 'characters/screen/favorite_characters_screen.dart';
