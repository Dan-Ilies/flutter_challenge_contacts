
import 'package:flutter/material.dart';

abstract class GroupedListDelegate {
  didSearch(BuildContext context, String query);
  didRefresh(BuildContext context);
}