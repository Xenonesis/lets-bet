import 'package:flutter/material.dart';

class ResponsiveUtils {
  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
  
  // Check device type
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;
  
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;
  
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBreakpoint;
  
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletBreakpoint;
  
  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;
  
  // Responsive values
  static double responsiveValue(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    final width = MediaQuery.of(context).size.width;
    
    if (width >= desktopBreakpoint && desktop != null) {
      return desktop;
    } else if (width >= mobileBreakpoint && tablet != null) {
      return tablet;
    }
    return mobile;
  }
  
  // Grid column count
  static int gridColumnCount(BuildContext context, {
    int mobile = 2,
    int tablet = 3,
    int desktop = 4,
  }) {
    final width = MediaQuery.of(context).size.width;
    
    if (width >= desktopBreakpoint) {
      return desktop;
    } else if (width >= mobileBreakpoint) {
      return tablet;
    }
    return mobile;
  }
  
  // Padding
  static EdgeInsets responsivePadding(BuildContext context, {
    EdgeInsets mobile = const EdgeInsets.all(16),
    EdgeInsets? tablet,
    EdgeInsets? desktop,
  }) {
    final width = MediaQuery.of(context).size.width;
    
    if (width >= desktopBreakpoint && desktop != null) {
      return desktop;
    } else if (width >= mobileBreakpoint && tablet != null) {
      return tablet;
    }
    return mobile;
  }
}
