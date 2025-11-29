# UI/UX Testing Guide

## Quick Start Testing

### 1. Theme Testing
**Steps:**
1. Launch the app
2. Navigate to Profile tab (bottom right)
3. Find "Theme" option in settings section
4. Test each theme mode:
   - Select "Light" → App should use light theme
   - Select "Dark" → App should use dark theme  
   - Select "System" → App should follow device theme

**What to Check:**
- ✅ All text is readable in both themes
- ✅ All icons are visible in both themes
- ✅ Cards have proper borders in both themes
- ✅ Colors are consistent and professional
- ✅ No harsh shadows or gradients (except wallet card)

### 2. Responsive Layout Testing

**Desktop/Web (> 900px):**
- Sports grid should show 4 columns
- Layout should be centered with max width
- All touch targets remain accessible

**Tablet (600-900px):**
- Sports grid should show 3 columns
- Content should fill width appropriately
- Navigation remains usable

**Mobile (< 600px):**
- Sports grid should show 2 columns
- Wallet buttons stack on very small screens
- Bottom navigation is properly sized
- All content is accessible

### 3. Component Testing

#### Home Screen
**Wallet Balance Card:**
- [ ] Shows balance correctly
- [ ] Bonus balance displays if > 0
- [ ] Deposit button works
- [ ] Withdraw button works
- [ ] Gradient background displays
- [ ] Icons are modern (outlined style)
- [ ] Buttons are responsive on small screens

**Promotions Banner:**
- [ ] Displays promotional content
- [ ] "Claim Now" button is visible
- [ ] Icon is professional (redeem, not gift card)
- [ ] Text is readable
- [ ] Layout adapts to screen size

**Live Matches Section:**
- [ ] Red pulsing dot indicator visible
- [ ] "View All" has arrow icon
- [ ] Horizontal scroll works
- [ ] Cards are tappable
- [ ] Loading state shows correctly
- [ ] Empty state shows when no matches

**Featured Matches Section:**
- [ ] Section header styled consistently
- [ ] Cards show match information
- [ ] Status badges are colored correctly
- [ ] Horizontal scroll works
- [ ] Tap to view odds works

**Sports Grid:**
- [ ] Grid shows 2-4 columns based on screen size
- [ ] Sport icons are visible
- [ ] Sport names are readable
- [ ] Cards are tappable
- [ ] Hover states work (web/desktop)

#### Bottom Navigation
- [ ] Has visible top divider
- [ ] Icons are professional (not cartoon-like)
- [ ] Selected state is clear
- [ ] Labels are readable
- [ ] Navigation works smoothly
- [ ] Icon sizes are appropriate

#### Profile Screen
- [ ] Profile header displays correctly
- [ ] Theme dropdown shows current selection
- [ ] Theme changes apply immediately
- [ ] All menu items are tappable
- [ ] Icons are modern and consistent

### 4. Typography Testing

**Check All Text Is:**
- [ ] Using Inter font family
- [ ] Readable in both light and dark themes
- [ ] Properly sized (not too small or large)
- [ ] Properly weighted (400, 500, 600, bold)
- [ ] Has good line height for readability
- [ ] Has appropriate letter spacing

### 5. Color Testing

**Light Theme:**
- [ ] Background: #FAFAFC (very light blue-gray)
- [ ] Surface: #FFFFFF (white)
- [ ] Primary: #0066FF (blue)
- [ ] Text: #1C1C1E (near black)
- [ ] Borders: #E5E5EA (light gray)

**Dark Theme:**
- [ ] Background: #000000 (pure black)
- [ ] Surface: #1C1C1E (dark gray)
- [ ] Primary: #0066FF (blue - same as light)
- [ ] Text: #FFFFFF (white)
- [ ] Borders: #38383A (medium gray)

### 6. Interaction Testing

**Touch Targets:**
- [ ] All buttons are at least 44-52px tall
- [ ] All tappable areas have visual feedback
- [ ] Buttons show pressed state
- [ ] Cards show ripple effect on tap

**Forms (Login/Register):**
- [ ] Input fields have clear borders
- [ ] Focus state is visible
- [ ] Error states show in red
- [ ] Password visibility toggle works
- [ ] Keyboard navigation works

**Navigation:**
- [ ] Bottom nav switches screens
- [ ] Back navigation works
- [ ] Deep links work (if applicable)
- [ ] FAB (bet slip) is accessible

### 7. Accessibility Testing

**Color Contrast:**
- [ ] Text meets WCAG AA standards
- [ ] Links/buttons are distinguishable
- [ ] Disabled states are clear

**Touch Targets:**
- [ ] Minimum 44x44px for all interactive elements
- [ ] Spacing between targets is adequate

**Screen Reader (if applicable):**
- [ ] All images have descriptions
- [ ] Buttons have labels
- [ ] Form fields have labels

## Common Issues to Look For

### ❌ Issues That Should NOT Exist:
1. ❌ Cartoon-like icons (we use professional outlined icons)
2. ❌ Harsh drop shadows (we use flat design with borders)
3. ❌ Inconsistent spacing (we use spacing system)
4. ❌ Text that's hard to read in dark mode
5. ❌ Components that don't adapt to screen size
6. ❌ Buttons that are too small to tap
7. ❌ Colors that clash or look unprofessional

### ✅ What Should Work:
1. ✅ Smooth theme transitions
2. ✅ Consistent spacing throughout
3. ✅ Professional icon set
4. ✅ Readable text in all themes
5. ✅ Responsive layouts
6. ✅ Proper touch targets
7. ✅ Clean, modern aesthetic

## Browser/Platform Testing

### Windows
```bash
flutter run -d windows
```

### Android
```bash
flutter run -d <device-id>
```

### iOS
```bash
flutter run -d <device-id>
```

### Web
```bash
flutter run -d chrome
```

## Screenshot Checklist

**Take screenshots of:**
1. Home screen (light theme)
2. Home screen (dark theme)
3. Sports grid on mobile
4. Sports grid on tablet/desktop
5. Profile screen with theme selector
6. Match cards
7. Wallet balance card
8. Bottom navigation
9. Login screen
10. Any forms/inputs

## Performance Testing

**Check:**
- [ ] No lag when scrolling
- [ ] Theme changes are instant
- [ ] Images load quickly
- [ ] Animations are smooth (60fps)
- [ ] No memory leaks
- [ ] App size is reasonable

## Final Checklist

### Design
- [ ] Follows Material Design 3 principles
- [ ] Uses consistent spacing system
- [ ] Uses consistent border radius
- [ ] Uses professional color palette
- [ ] Typography is readable and consistent

### Functionality  
- [ ] All features work in both themes
- [ ] Navigation works smoothly
- [ ] Forms validate correctly
- [ ] Loading states display properly
- [ ] Error states display properly
- [ ] Empty states display properly

### Responsiveness
- [ ] Works on small phones (320px+)
- [ ] Works on standard phones (360-600px)
- [ ] Works on tablets (600-900px)
- [ ] Works on desktop (900px+)
- [ ] Works on large screens (1200px+)

### Themes
- [ ] Light theme is clean and professional
- [ ] Dark theme is true black (OLED friendly)
- [ ] System theme follows device settings
- [ ] Theme selection persists on restart
- [ ] All components work in both themes

## Reporting Issues

**When reporting an issue, include:**
1. Device/platform (e.g., "Windows 11 Desktop")
2. Screen size (e.g., "1920x1080")
3. Theme mode (light/dark/system)
4. Steps to reproduce
5. Expected behavior
6. Actual behavior
7. Screenshot (if visual issue)

## Success Criteria

The modernization is successful when:
- ✅ App looks professional on all platforms
- ✅ All screens work in light, dark, and system themes
- ✅ Layout adapts properly to all screen sizes
- ✅ No cartoon-like icons or unprofessional elements
- ✅ Consistent spacing and typography throughout
- ✅ Touch targets are appropriate size
- ✅ Colors meet accessibility standards
- ✅ Performance is smooth and responsive
