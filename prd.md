update this with flutter and convex as db"# ✅ **PRD-MF: Fully Admin-Controlled Sports Betting Platform**

**Version:** 1.0
**Owner:** Product Management
**Status:** Approved
**Type:** Master Functional PRD

---

# 1. **Product Overview**

A fully dynamic, admin-configurable **sports betting platform** where **100% of the user interface (UI), sports list, leagues, markets, odds, and even features are controlled by the Admin Panel**.
Frontend will not have hardcoded sports, leagues, or market logic. Everything loads through admin configuration APIs.

The platform supports:

* Pre-match betting
* Live/In-play betting
* Cash-out
* Multi-bet
* Admin-controlled UI
* Complete risk & limit management
* Bonus engine
* Real-time odds feeds

Primary goal: **Flexibility, scalability, modularity.**

---

# 2. **Objectives & Success Metrics**

### ✅ **Objectives**

* Build a completely configurable sports betting platform.
* Provide real-time betting experience for users.
* Allow admin to control every visual & functional element.
* Reduce engineering dependency for adding new sports/leagues.
* Enable safe & compliant betting ecosystem.

### ✅ **Key Metrics (KPIs)**

* < 2 sec initial loading time
* < 1 sec odds refresh latency
* 0 downtime during live events
* Ability to create/update markets in < 5 seconds
* 100% admin-controlled UI without code deployment

---

# 3. **User Personas**

### 3.1 End User (Bettor)

* Wants fast betting
* Real-time odds
* No delays during live events
* Easy navigation
* Trustworthy wallet system

### 3.2 Admin (Super Admin)

* Must configure sports, leagues, matches
* Create markets & odds
* Enable/disable features dynamically
* Manage risk/exposure
* Review and approve withdrawals

### 3.3 Risk Manager

* Monitors high exposures
* Sets limits
* Manually suspends markets if needed

### 3.4 Content Ops / CS Team

* Manage banners & promotions
* Customer support actions

---

# 4. **High-Level Requirements**

## ✅ **4.1 Full Admin Control**

Admin must be able to:

* Add/edit/remove sports
* Add/edit/remove leagues
* Add/edit/remove matches
* Enable/disable sports/markets
* Configure UI sections
* Control theming & layout
* Manage features (on/off switches)
* Set odds (manual/automatic)
* Manage wallets, KYC, users

---

# 5. **Functional Requirements (Core)**

---

# ✅ 5.1 **Sports Management (Admin)**

### Features:

1. Add/delete/disable sports
2. Upload icon, name, theme color
3. Set display order
4. Map leagues to each sport
5. Define default markets for a sport

### API:

* `/admin/sports`
* `/sports` (for frontend)

---

# ✅ 5.2 **League Management**

Admin can:

* Add/update/delete leagues
* Assign leagues → sports
* Set league visibility
* Upload league logo
* Enable/disable league seasons
* Schedule league availability

### API:

* `/admin/leagues`
* `/sports/:id/leagues`

---

# ✅ 5.3 **Match Management**

Admin can:

* Create/modify matches
* Set teams, logos, start time
* Enable pre-match
* Enable live betting
* Select markets for that match
* Map odds feed provider
* Enable manual/auto odds mode

### Attributes:

* SPORT_ID → LEAGUE_ID → MATCH_ID
* Status: Scheduled, Live, Suspended, Settled
* Live tracker toggle

### API:

* `/admin/matches`
* `/matches/:id`

---

# ✅ 5.4 **Market Management (Market Builder)**

Admin must create markets like:

* Match Winner
* Over/Under
* Toss Winner
* Player Score
* BTTS
* Handicap

Admin can:

* Add/remove/edit markets
* Add outcomes under each market
* Set odds manually
* Enable auto feed sync
* Set market-level limits

### API:

* `/admin/markets`
* `/matches/:id/markets`

---

# ✅ 5.5 **Odds Management**

Admin can:

* Set odds manually
* Override automatic odds
* Apply margin
* Suspend market
* Resume market
* Freeze odds for certain users

### Real-time Requirements:

* Update odds every 0.5–2 sec
* Automatically suspend on goal/wicket/incident

### API:

* `/admin/odds/update`
* `/markets/:id/odds`

---

# ✅ 5.6 **Bet Slip System**

### User Can:

* Add multiple selections
* Multi-bet (Combo/Accumulator)
* Edit stake
* View potential payout
* Accept odds changes toggle
* Place bet

### System Must:

* Validate odds
* Freeze bets if market suspended
* Reject if odds outdated
* Confirm instantly

---

# ✅ 5.7 **Live/In-Play Betting**

Requirements:

* Odds refresh < 1 sec
* Market suspension based on feed triggers
* Live events stream (goals, wickets, cards, etc.)
* Real-time match stats

### APIs:

* WebSocket: `/live/odds`
* `/live/events`

---

# ✅ 5.8 **Cash-Out System**

Admin Controls:

* Enable/disable cash-out
* Set formula %
* Set auto cash-out triggers

User Features:

* Full cash-out
* Partial cash-out
* Auto cash-out

---

# ✅ 5.9 **Wallet System**

User Wallet:

* Deposit
* Withdraw
* Balance history
* Bonus wallet

Admin Controls:

* Approve withdrawals
* Add bonus manually
* Freeze wallet

---

# ✅ 5.10 **Dynamic UI & Theming**

Admin Can Control:

### Home Page:

* Which sections appear
* Order of sections
* Banners
* Featured sports
* Featured matches

### Sport Page:

* Show/hide stats
* Live tracker toggle
* Market ordering

### Match Page:

* Enable/disable:

  * Stats
  * Insights
  * Predictions
  * Lineups

### Global Theme:

* Logo
* Colors
* Font
* Dark/Light mode

### API:

* `/admin/ui-config`
* `/ui-config/home`
* `/ui-config/sport/:id`
* `/ui-config/match/:id`

---

# ✅ 5.11 **Bonus & Promotion Management**

Admin Can Create:

* Deposit bonus
* Free bet coupon
* Loss cashback
* Referral bonus

Options:

* Applicable sports
* Expiry
* Wagering requirement
* User segment

---

# ✅ 5.12 **User Account Control**

Users:

* Register
* Login
* KYC
* Transactions
* Bet history

Admin:

* Approve KYC
* Ban user
* Modify limits
* Reset passwords

---

# ✅ 5.13 **Risk & Exposure Management**

Admin Can:

* Set max bet per market
* Max exposure per sport/match
* Auto-suspend rules
* Alerts for suspicious bets

---

# ✅ 5.14 **Compliance Requirements**

* Age verification
* Self exclusion
* Deposit/Time limits
* Activity logs
* Geo-blocking

---

# 6. **Non-Functional Requirements (NFRs)**

### Performance

* 99.9% uptime
* API response < 300ms
* Websocket latency < 1 sec

### Security

* JWT authentication
* Rate limiting
* DDOS protection
* Data encryption
* Admin audit logs

### Scalability

* Horizontal scaling
* Cloud-native deployment

### Reliability

* Failover servers
* Redundant odds feed

---

# 7. **API Structure Overview**

```
/sports
/sports/{id}/leagues
/leagues/{id}/matches
/matches/{id}/markets
/markets/{id}/outcomes
/ui-config
/wallet
/bets
/live
/admin/*
```

---

# 8. **Database Modules (High Level)**

* Sports
* Leagues
* Matches
* Markets
* Outcomes
* Odds
* Bets
* Users
* Wallet
* UI Config
* Admin Roles
* Risk Config
* Transactions
* Bonus System

*(If you want, I can provide full DB schema + ERD.)*

---

# 9. **User Flow Summary**

### 1. User opens app → fetches UI config

### 2. User selects sport → leagues → match

### 3. User selects market → adds to bet slip

### 4. User places bet → system validates → stores in DB

### 5. Live events update odds

### 6. Settlements occur post-match

### 7. Payout credited

---ss

# 10. **Admin Flow Summary**

1. Admin adds sport
2. Creates leagues
3. Adds matches
4. Creates markets
5. Sets odds (auto/manual)
6. Publishes UI layout
7. Users see updated UI instantly
8. Risk engine monitors exposure
9. Admin reviews withdrawals
10. Settlements processed automatically

#tech stack flutter + convex as db
create fully functional app with all functionalities with professional UI/UX and convex database
 "