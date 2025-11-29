# 🧪 Quick Test Checklist

## 5-Minute Test Guide

### 1. Theme Testing (2 minutes)
- [ ] App loads in default theme
- [ ] Navigate to Profile tab (bottom right)
- [ ] Tap "Theme" option
- [ ] Select "Light" - verify clean white theme
- [ ] Select "Dark" - verify true black theme
- [ ] Select "System" - verify it follows device
- [ ] All screens readable in both themes

### 2. Animation Testing (2 minutes)
- [ ] **Home screen loads** - watch elements fade in smoothly
- [ ] **Wallet card** - appears with fade + slide
- [ ] **Promotions banner** - animates in after wallet
- [ ] **Live indicator** - red dot continuously pulses
- [ ] **Scroll live matches** - cards appear in sequence
- [ ] **Tap sport card** - feels responsive with press effect
- [ ] **Tap match card** - scales down briefly
- [ ] **Hover cards** (desktop) - subtle elevation change

### 3. Responsive Testing (1 minute)
- [ ] Resize browser window to ~400px width
- [ ] Sports grid shows 2 columns
- [ ] Resize to ~700px width
- [ ] Sports grid shows 3 columns
- [ ] Resize to full width (>900px)
- [ ] Sports grid shows 4 columns
- [ ] All layouts adapt smoothly

## Expected Results

### ✅ Good Signs
- Smooth, polished animations
- Instant theme switching
- Clean, professional appearance
- Responsive layouts
- No cartoon icons
- Pulsing live indicator
- Interactive feedback on taps

### ❌ Issues to Report
- Janky animations
- Theme switch lag
- Layout breaks
- Missing animations
- Hard-to-read text

## Quick Commands

### Restart App
```bash
# Press 'r' in terminal for hot reload
# Press 'R' for hot restart
```

### Switch Device
```bash
# Stop current (Ctrl+C)
flutter run -d windows
flutter run -d chrome
flutter run -d <android-device>
```

## Key Features to Showcase

1. **Modern Design** - Professional, clean, no cartoon elements
2. **Dark Mode** - True black, OLED-friendly
3. **Animations** - Smooth entrance and interactions
4. **Responsive** - Works on any screen size
5. **Theme Options** - Light/Dark/System modes

---

**Status**: App is launching in Chrome now!
Watch the console for the URL or it will open automatically.
