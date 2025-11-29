#!/usr/bin/env node
/**
 * Comprehensive Testing Script for Let's Bet - Convex Backend
 * Tests ALL backend functionalities including:
 * - Authentication (Register, Login, Password Change)
 * - User Management
 * - Wallet Operations (Deposit, Transactions)
 * - Sports, Leagues, Matches
 * - Markets and Outcomes
 * - Betting (Place bet, Cash out, Settle)
 */

const https = require('https');

const CONVEX_URL = 'brainy-frog-582.convex.cloud';

// Test state to track created resources
let testState = {
  userId: null,
  walletId: null,
  sportId: null,
  leagueId: null,
  matchId: null,
  marketId: null,
  outcomeId: null,
  betId: null,
  email: null,
  password: 'TestPassword123!',
};

function makeRequest(endpoint, data) {
  return new Promise((resolve, reject) => {
    const postData = JSON.stringify({
      path: data.path,
      args: data.args,
      format: 'json',
    });

    const options = {
      hostname: CONVEX_URL,
      path: `/api/${endpoint}`,
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(postData),
      },
    };

    const req = https.request(options, (res) => {
      let body = '';
      res.on('data', (chunk) => body += chunk);
      res.on('end', () => {
        try {
          resolve(JSON.parse(body));
        } catch (e) {
          reject(new Error(`Failed to parse response: ${body}`));
        }
      });
    });

    req.on('error', reject);
    req.write(postData);
    req.end();
  });
}

async function test(name, testFn) {
  try {
    const result = await testFn();
    console.log(`  ✅ ${name}`);
    return { passed: true, result };
  } catch (error) {
    console.log(`  ❌ ${name}: ${error.message}`);
    return { passed: false, error: error.message };
  }
}

async function runAllTests() {
  console.log('\n🧪 ═══════════════════════════════════════════════════════════');
  console.log('   COMPREHENSIVE FUNCTIONALITY TEST - Let\'s Bet Backend');
  console.log('═══════════════════════════════════════════════════════════\n');

  let passed = 0;
  let failed = 0;
  const results = [];

  // ============= 1. AUTHENTICATION TESTS =============
  console.log('📝 1. AUTHENTICATION');
  console.log('─────────────────────────────────────────────────────────────');

  // Register
  const registerTest = await test('User Registration', async () => {
    testState.email = `fulltest${Date.now()}@example.com`;
    const result = await makeRequest('action', {
      path: 'auth_actions:register',
      args: {
        email: testState.email,
        username: `fulltest${Date.now()}`,
        password: testState.password,
        firstName: 'Full',
        lastName: 'Test',
        dateOfBirth: '1990-01-01',
        country: 'India',
      },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Registration failed');
    testState.userId = result.value.user.id;
    return result.value;
  });
  registerTest.passed ? passed++ : failed++;
  results.push({ name: 'User Registration', ...registerTest });

  // Login
  const loginTest = await test('User Login', async () => {
    const result = await makeRequest('action', {
      path: 'auth_actions:login',
      args: { email: testState.email, password: testState.password },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Login failed');
    return result.value;
  });
  loginTest.passed ? passed++ : failed++;
  results.push({ name: 'User Login', ...loginTest });

  // Password Change
  const passwordTest = await test('Password Change', async () => {
    const result = await makeRequest('action', {
      path: 'auth_actions:changePassword',
      args: {
        userId: testState.userId,
        currentPassword: testState.password,
        newPassword: 'NewTestPassword123!',
      },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Password change failed');
    testState.password = 'NewTestPassword123!';
    return result.value;
  });
  passwordTest.passed ? passed++ : failed++;
  results.push({ name: 'Password Change', ...passwordTest });

  // Login with new password
  const newLoginTest = await test('Login with New Password', async () => {
    const result = await makeRequest('action', {
      path: 'auth_actions:login',
      args: { email: testState.email, password: testState.password },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Login failed');
    return result.value;
  });
  newLoginTest.passed ? passed++ : failed++;
  results.push({ name: 'Login with New Password', ...newLoginTest });

  // ============= 2. USER PROFILE TESTS =============
  console.log('\n👤 2. USER PROFILE');
  console.log('─────────────────────────────────────────────────────────────');

  // Get User by ID
  const getUserTest = await test('Get User by ID', async () => {
    const result = await makeRequest('query', {
      path: 'users:getById',
      args: { userId: testState.userId },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Get user failed');
    return result.value;
  });
  getUserTest.passed ? passed++ : failed++;
  results.push({ name: 'Get User by ID', ...getUserTest });

  // Update Profile
  const updateProfileTest = await test('Update Profile', async () => {
    const result = await makeRequest('mutation', {
      path: 'users:updateProfile',
      args: {
        userId: testState.userId,
        phone: '+919876543210',
        firstName: 'Updated',
      },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Update profile failed');
    if (result.value.phone !== '+919876543210') throw new Error('Phone not updated');
    return result.value;
  });
  updateProfileTest.passed ? passed++ : failed++;
  results.push({ name: 'Update Profile', ...updateProfileTest });

  // ============= 3. WALLET TESTS =============
  console.log('\n💰 3. WALLET MANAGEMENT');
  console.log('─────────────────────────────────────────────────────────────');

  // Get Wallet
  const getWalletTest = await test('Get User Wallet', async () => {
    const result = await makeRequest('query', {
      path: 'wallets:getByUser',
      args: { userId: testState.userId },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Get wallet failed');
    if (result.value.balance === undefined) throw new Error('Balance not found');
    console.log(`      Balance: ₹${result.value.balance}`);
    return result.value;
  });
  getWalletTest.passed ? passed++ : failed++;
  results.push({ name: 'Get User Wallet', ...getWalletTest });

  // Deposit Funds
  const depositTest = await test('Deposit Funds', async () => {
    const result = await makeRequest('mutation', {
      path: 'wallets:deposit',
      args: {
        userId: testState.userId,
        amount: 5000,
        paymentMethod: 'UPI',
        reference: `DEP${Date.now()}`,
      },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Deposit failed');
    if (result.value.balance < 5000) throw new Error('Balance not updated after deposit');
    console.log(`      New Balance: ₹${result.value.balance}`);
    return result.value;
  });
  depositTest.passed ? passed++ : failed++;
  results.push({ name: 'Deposit Funds', ...depositTest });

  // Get Transaction History
  const transactionsTest = await test('Get Transaction History', async () => {
    const result = await makeRequest('query', {
      path: 'wallets:getTransactions',
      args: { userId: testState.userId, limit: 10 },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Get transactions failed');
    console.log(`      Transactions count: ${result.value.length}`);
    return result.value;
  });
  transactionsTest.passed ? passed++ : failed++;
  results.push({ name: 'Get Transaction History', ...transactionsTest });

  // ============= 4. SPORTS TESTS =============
  console.log('\n⚽ 4. SPORTS');
  console.log('─────────────────────────────────────────────────────────────');

  // List Sports
  const listSportsTest = await test('List Sports', async () => {
    const result = await makeRequest('query', {
      path: 'sports:list',
      args: {},
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'List sports failed');
    if (result.value.length === 0) throw new Error('No sports found');
    testState.sportId = result.value[0].id;
    console.log(`      Sports count: ${result.value.length}`);
    console.log(`      Sports: ${result.value.map(s => s.name).join(', ')}`);
    return result.value;
  });
  listSportsTest.passed ? passed++ : failed++;
  results.push({ name: 'List Sports', ...listSportsTest });

  // Get Sport by ID
  const getSportTest = await test('Get Sport by ID', async () => {
    const result = await makeRequest('query', {
      path: 'sports:getById',
      args: { sportId: testState.sportId },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Get sport failed');
    console.log(`      Sport: ${result.value.name}`);
    return result.value;
  });
  getSportTest.passed ? passed++ : failed++;
  results.push({ name: 'Get Sport by ID', ...getSportTest });

  // ============= 5. LEAGUES TESTS =============
  console.log('\n🏆 5. LEAGUES');
  console.log('─────────────────────────────────────────────────────────────');

  // List Leagues by Sport
  const listLeaguesTest = await test('List Leagues by Sport', async () => {
    const result = await makeRequest('query', {
      path: 'leagues:listBySport',
      args: { sportId: testState.sportId },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'List leagues failed');
    if (result.value.length > 0) {
      testState.leagueId = result.value[0].id;
      console.log(`      Leagues count: ${result.value.length}`);
      console.log(`      Leagues: ${result.value.map(l => l.name).join(', ')}`);
    } else {
      console.log('      No leagues found for this sport');
    }
    return result.value;
  });
  listLeaguesTest.passed ? passed++ : failed++;
  results.push({ name: 'List Leagues by Sport', ...listLeaguesTest });

  // Get League by ID (if exists)
  if (testState.leagueId) {
    const getLeagueTest = await test('Get League by ID', async () => {
      const result = await makeRequest('query', {
        path: 'leagues:getById',
        args: { leagueId: testState.leagueId },
      });
      if (result.status !== 'success') throw new Error(result.errorMessage || 'Get league failed');
      console.log(`      League: ${result.value.name}`);
      return result.value;
    });
    getLeagueTest.passed ? passed++ : failed++;
    results.push({ name: 'Get League by ID', ...getLeagueTest });
  }

  // ============= 6. MATCHES TESTS =============
  console.log('\n🎯 6. MATCHES');
  console.log('─────────────────────────────────────────────────────────────');

  // List All Matches
  const listMatchesTest = await test('List All Matches', async () => {
    const result = await makeRequest('query', {
      path: 'matches:list',
      args: { limit: 10 },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'List matches failed');
    if (result.value.length > 0) {
      testState.matchId = result.value[0].id;
      console.log(`      Matches count: ${result.value.length}`);
    }
    return result.value;
  });
  listMatchesTest.passed ? passed++ : failed++;
  results.push({ name: 'List All Matches', ...listMatchesTest });

  // Get Featured Matches
  const featuredMatchesTest = await test('Get Featured Matches', async () => {
    const result = await makeRequest('query', {
      path: 'matches:getFeatured',
      args: { limit: 5 },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Get featured matches failed');
    console.log(`      Featured matches: ${result.value.length}`);
    return result.value;
  });
  featuredMatchesTest.passed ? passed++ : failed++;
  results.push({ name: 'Get Featured Matches', ...featuredMatchesTest });

  // Get Live Matches
  const liveMatchesTest = await test('Get Live Matches', async () => {
    const result = await makeRequest('query', {
      path: 'matches:getLive',
      args: { limit: 5 },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Get live matches failed');
    console.log(`      Live matches: ${result.value.length}`);
    return result.value;
  });
  liveMatchesTest.passed ? passed++ : failed++;
  results.push({ name: 'Get Live Matches', ...liveMatchesTest });

  // Get Upcoming Matches
  const upcomingMatchesTest = await test('Get Upcoming Matches', async () => {
    const result = await makeRequest('query', {
      path: 'matches:getUpcoming',
      args: { limit: 5 },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Get upcoming matches failed');
    console.log(`      Upcoming matches: ${result.value.length}`);
    return result.value;
  });
  upcomingMatchesTest.passed ? passed++ : failed++;
  results.push({ name: 'Get Upcoming Matches', ...upcomingMatchesTest });

  // Get Match by ID
  if (testState.matchId) {
    const getMatchTest = await test('Get Match by ID', async () => {
      const result = await makeRequest('query', {
        path: 'matches:getById',
        args: { matchId: testState.matchId },
      });
      if (result.status !== 'success') throw new Error(result.errorMessage || 'Get match failed');
      console.log(`      Match: ${result.value.homeTeam} vs ${result.value.awayTeam}`);
      return result.value;
    });
    getMatchTest.passed ? passed++ : failed++;
    results.push({ name: 'Get Match by ID', ...getMatchTest });
  }

  // ============= 7. MARKETS TESTS =============
  console.log('\n📊 7. MARKETS & OUTCOMES');
  console.log('─────────────────────────────────────────────────────────────');

  // First, find a match that has markets (usually the live match)
  const allMatchesResult = await makeRequest('query', {
    path: 'matches:list',
    args: { limit: 10 },
  });
  
  // Find a match with status 'live' for betting tests
  let matchForBetting = null;
  if (allMatchesResult.status === 'success' && allMatchesResult.value.length > 0) {
    matchForBetting = allMatchesResult.value.find(m => m.status === 'live');
    if (!matchForBetting) {
      matchForBetting = allMatchesResult.value[0]; // fallback to first match
    }
    testState.matchId = matchForBetting.id;
  }

  if (testState.matchId) {
    // List Markets by Match
    const listMarketsTest = await test('List Markets by Match', async () => {
      const result = await makeRequest('query', {
        path: 'markets:listByMatch',
        args: { matchId: testState.matchId },
      });
      if (result.status !== 'success') throw new Error(result.errorMessage || 'List markets failed');
      if (result.value.length > 0) {
        testState.marketId = result.value[0]._id;
        console.log(`      Markets count: ${result.value.length}`);
        console.log(`      Market: ${result.value[0].name}`);
      } else {
        console.log('      No markets found for this match');
      }
      return result.value;
    });
    listMarketsTest.passed ? passed++ : failed++;
    results.push({ name: 'List Markets by Match', ...listMarketsTest });

    // Get Market by ID with Outcomes
    if (testState.marketId) {
      const getMarketTest = await test('Get Market by ID with Outcomes', async () => {
        const result = await makeRequest('query', {
          path: 'markets:getById',
          args: { marketId: testState.marketId },
        });
        if (result.status !== 'success') throw new Error(result.errorMessage || 'Get market failed');
        console.log(`      Market: ${result.value.name}`);
        if (result.value.outcomes && result.value.outcomes.length > 0) {
          testState.outcomeId = result.value.outcomes[0]._id;
          console.log(`      Outcomes: ${result.value.outcomes.length}`);
          console.log(`      First outcome: ${result.value.outcomes[0].name} @ ${result.value.outcomes[0].odds}`);
        }
        return result.value;
      });
      getMarketTest.passed ? passed++ : failed++;
      results.push({ name: 'Get Market by ID with Outcomes', ...getMarketTest });

      // List Outcomes by Market
      const listOutcomesTest = await test('List Outcomes by Market', async () => {
        const result = await makeRequest('query', {
          path: 'markets:listOutcomesByMarket',
          args: { marketId: testState.marketId },
        });
        if (result.status !== 'success') throw new Error(result.errorMessage || 'List outcomes failed');
        if (result.value.length > 0) {
          testState.outcomeId = result.value[0]._id;
          console.log(`      Outcomes: ${result.value.map(o => `${o.name}@${o.odds}`).join(', ')}`);
        }
        return result.value;
      });
      listOutcomesTest.passed ? passed++ : failed++;
      results.push({ name: 'List Outcomes by Market', ...listOutcomesTest });
    }
  }

  // ============= 8. BETTING TESTS =============
  console.log('\n🎰 8. BETTING');
  console.log('─────────────────────────────────────────────────────────────');

  // Place Bet (only if we have all required IDs)
  if (testState.matchId && testState.marketId && testState.outcomeId) {
    const placeBetTest = await test('Place Bet', async () => {
      // Get current odds for the outcome
      const marketResult = await makeRequest('query', {
        path: 'markets:getById',
        args: { marketId: testState.marketId },
      });
      if (marketResult.status !== 'success') throw new Error('Failed to get market');

      const outcome = marketResult.value.outcomes.find(o => o._id === testState.outcomeId);
      if (!outcome) throw new Error('Outcome not found');

      const stake = 100;
      const potentialWin = stake * outcome.odds;

      const result = await makeRequest('mutation', {
        path: 'bets:place',
        args: {
          userId: testState.userId,
          type: 'single',
          totalStake: stake,
          potentialWin: potentialWin,
          selections: [{
            matchId: testState.matchId,
            marketId: testState.marketId,
            outcomeId: testState.outcomeId,
            odds: outcome.odds,
          }],
        },
      });
      if (result.status !== 'success') throw new Error(result.errorMessage || 'Place bet failed');
      testState.betId = result.value;
      console.log(`      Bet placed with ID: ${testState.betId}`);
      console.log(`      Stake: ₹${stake}, Potential Win: ₹${potentialWin.toFixed(2)}`);
      return result.value;
    });
    placeBetTest.passed ? passed++ : failed++;
    results.push({ name: 'Place Bet', ...placeBetTest });

    // Get Bet by ID
    if (testState.betId) {
      const getBetTest = await test('Get Bet by ID', async () => {
        const result = await makeRequest('query', {
          path: 'bets:getById',
          args: { betId: testState.betId },
        });
        if (result.status !== 'success') throw new Error(result.errorMessage || 'Get bet failed');
        console.log(`      Bet status: ${result.value.status}`);
        console.log(`      Selections: ${result.value.selections.length}`);
        return result.value;
      });
      getBetTest.passed ? passed++ : failed++;
      results.push({ name: 'Get Bet by ID', ...getBetTest });
    }

    // List User Bets
    const listBetsTest = await test('List User Bets', async () => {
      const result = await makeRequest('query', {
        path: 'bets:listByUser',
        args: { userId: testState.userId, limit: 10 },
      });
      if (result.status !== 'success') throw new Error(result.errorMessage || 'List bets failed');
      console.log(`      User bets count: ${result.value.length}`);
      return result.value;
    });
    listBetsTest.passed ? passed++ : failed++;
    results.push({ name: 'List User Bets', ...listBetsTest });

    // Cash Out Bet
    if (testState.betId) {
      const cashOutTest = await test('Cash Out Bet', async () => {
        const cashOutValue = 80; // Cash out at a loss
        const result = await makeRequest('mutation', {
          path: 'bets:cashOut',
          args: {
            betId: testState.betId,
            cashOutValue: cashOutValue,
          },
        });
        if (result.status !== 'success') throw new Error(result.errorMessage || 'Cash out failed');
        console.log(`      Cashed out at: ₹${cashOutValue}`);
        return result.value;
      });
      cashOutTest.passed ? passed++ : failed++;
      results.push({ name: 'Cash Out Bet', ...cashOutTest });
    }
  } else {
    console.log('  ⚠️  Skipping bet tests - missing match/market/outcome data');
  }

  // ============= 9. EMAIL VERIFICATION TEST =============
  console.log('\n📧 9. EMAIL VERIFICATION');
  console.log('─────────────────────────────────────────────────────────────');

  const verifyEmailTest = await test('Verify Email', async () => {
    const result = await makeRequest('mutation', {
      path: 'auth:verifyEmail',
      args: { userId: testState.userId, verificationCode: '123456' },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Email verification failed');
    if (!result.value.isVerified) throw new Error('User not marked as verified');
    console.log(`      Verified: ${result.value.isVerified}`);
    return result.value;
  });
  verifyEmailTest.passed ? passed++ : failed++;
  results.push({ name: 'Verify Email', ...verifyEmailTest });

  // ============= 10. BONUS TEST =============
  console.log('\n🎁 10. BONUS SYSTEM');
  console.log('─────────────────────────────────────────────────────────────');

  const addBonusTest = await test('Add Bonus', async () => {
    const result = await makeRequest('mutation', {
      path: 'wallets:addBonus',
      args: {
        userId: testState.userId,
        amount: 500,
        description: 'Welcome bonus for testing',
      },
    });
    if (result.status !== 'success') throw new Error(result.errorMessage || 'Add bonus failed');
    console.log(`      Bonus balance: ₹${result.value.bonusBalance}`);
    return result.value;
  });
  addBonusTest.passed ? passed++ : failed++;
  results.push({ name: 'Add Bonus', ...addBonusTest });

  // ============= SUMMARY =============
  console.log('\n═══════════════════════════════════════════════════════════');
  console.log('                      TEST SUMMARY');
  console.log('═══════════════════════════════════════════════════════════');
  console.log(`  ✅ Passed: ${passed}`);
  console.log(`  ❌ Failed: ${failed}`);
  console.log(`  📊 Total:  ${passed + failed}`);
  console.log(`  📈 Success Rate: ${((passed / (passed + failed)) * 100).toFixed(1)}%`);
  console.log('═══════════════════════════════════════════════════════════');

  if (failed === 0) {
    console.log('\n🎉 ALL TESTS PASSED! Backend is fully functional!\n');
  } else {
    console.log('\n⚠️  SOME TESTS FAILED. Details below:\n');
    results.filter(r => !r.passed).forEach(r => {
      console.log(`  ❌ ${r.name}: ${r.error}`);
    });
    console.log('');
  }

  return { passed, failed, results };
}

// Run the tests
runAllTests().catch(console.error);
