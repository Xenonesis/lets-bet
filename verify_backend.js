#!/usr/bin/env node

// Quick verification script for Convex backend
const https = require('https');

const CONVEX_URL = 'brainy-frog-582.convex.cloud';

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

async function verify() {
  console.log('🔍 Verifying Convex Backend...\n');
  console.log(`📡 URL: https://${CONVEX_URL}\n`);

  let passed = 0;
  let failed = 0;

  // Test 1: Registration
  try {
    const email = `verify${Date.now()}@test.com`;
    const result = await makeRequest('action', {
      path: 'auth_actions:register',
      args: {
        email,
        username: `verify${Date.now()}`,
        password: 'Test1234!',
        firstName: 'Test',
        lastName: 'User',
        dateOfBirth: '1990-01-01',
        country: 'India',
      },
    });

    if (result.status === 'success' && result.value.user.id) {
      console.log('✅ Registration: WORKING');
      passed++;
      
      // Test 2: Login
      const loginResult = await makeRequest('action', {
        path: 'auth_actions:login',
        args: { email, password: 'Test1234!' },
      });
      
      if (loginResult.status === 'success') {
        console.log('✅ Login: WORKING');
        passed++;
      } else {
        console.log('❌ Login: FAILED');
        failed++;
      }
    } else {
      console.log('❌ Registration: FAILED');
      failed++;
    }
  } catch (e) {
    console.log('❌ Authentication: ERROR -', e.message);
    failed++;
  }

  // Test 3: Sports
  try {
    const result = await makeRequest('query', {
      path: 'sports:list',
      args: {},
    });
    
    if (result.status === 'success' && Array.isArray(result.value)) {
      console.log(`✅ Sports Query: WORKING (${result.value.length} sports)`);
      passed++;
    } else {
      console.log('❌ Sports Query: FAILED');
      failed++;
    }
  } catch (e) {
    console.log('❌ Sports Query: ERROR -', e.message);
    failed++;
  }

  // Test 4: Matches
  try {
    const result = await makeRequest('query', {
      path: 'matches:list',
      args: { limit: 5 },
    });
    
    if (result.status === 'success' && Array.isArray(result.value)) {
      console.log(`✅ Matches Query: WORKING (${result.value.length} matches)`);
      passed++;
    } else {
      console.log('❌ Matches Query: FAILED');
      failed++;
    }
  } catch (e) {
    console.log('❌ Matches Query: ERROR -', e.message);
    failed++;
  }

  // Summary
  console.log('\n' + '='.repeat(50));
  console.log(`✅ Passed: ${passed}`);
  console.log(`❌ Failed: ${failed}`);
  console.log('='.repeat(50));

  if (failed === 0) {
    console.log('\n🎉 Backend is fully operational!');
    console.log('Your Flutter app should work correctly.\n');
    process.exit(0);
  } else {
    console.log('\n⚠️  Some tests failed!');
    console.log('Run: npx convex dev --once');
    console.log('Then try again.\n');
    process.exit(1);
  }
}

verify().catch(err => {
  console.error('\n❌ Verification failed:', err.message);
  process.exit(1);
});
