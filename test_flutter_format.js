// Test that mimics Flutter app's exact behavior
const https = require('https');

function makeRequest(endpoint, data) {
  return new Promise((resolve, reject) => {
    const postData = JSON.stringify({
      path: data.path,
      args: data.args,
      format: 'json',
    });

    const options = {
      hostname: 'brainy-frog-582.convex.cloud',
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

async function testFlutterFormat() {
  console.log('Testing Flutter-compatible response format...\n');

  try {
    // Test registration
    const email = `test${Date.now()}@example.com`;
    const username = `testuser${Date.now()}`;
    
    console.log('1. Testing Registration Response Format');
    const registerResult = await makeRequest('action', {
      path: 'auth_actions:register',
      args: {
        email,
        username,
        password: 'TestPassword123!',
        firstName: 'Test',
        lastName: 'User',
        dateOfBirth: '1990-01-01',
        country: 'India',
      },
    });

    if (registerResult.status === 'success') {
      const response = registerResult.value;
      console.log('\n✓ Registration successful');
      console.log('\nResponse structure:');
      console.log(JSON.stringify(response, null, 2));
      
      // Validate Flutter-expected format
      console.log('\n2. Validating Flutter-compatible fields:');
      
      const user = response.user;
      const checks = [
        { field: 'id', value: user.id, type: 'string' },
        { field: 'email', value: user.email, type: 'string' },
        { field: 'username', value: user.username, type: 'string' },
        { field: 'firstName', value: user.firstName, type: 'string' },
        { field: 'lastName', value: user.lastName, type: 'string' },
        { field: 'dateOfBirth', value: user.dateOfBirth, type: 'string' },
        { field: 'country', value: user.country, type: 'string' },
        { field: 'isVerified', value: user.isVerified, type: 'boolean' },
        { field: 'kycStatus', value: user.kycStatus, type: 'string' },
        { field: 'isActive', value: user.isActive, type: 'boolean' },
        { field: 'role', value: user.role, type: 'string' },
        { field: 'createdAt', value: user.createdAt, type: 'string' },
      ];

      let allValid = true;
      for (const check of checks) {
        const actualType = typeof check.value;
        const isValid = actualType === check.type && check.value !== undefined;
        const status = isValid ? '✓' : '✗';
        console.log(`  ${status} ${check.field}: ${actualType} = ${JSON.stringify(check.value)}`);
        if (!isValid) allValid = false;
      }

      // Check if createdAt is valid ISO date
      console.log('\n3. Validating Date Format:');
      try {
        const date = new Date(user.createdAt);
        if (isNaN(date.getTime())) {
          console.log('  ✗ createdAt is not a valid ISO date');
          allValid = false;
        } else {
          console.log(`  ✓ createdAt is valid ISO date: ${user.createdAt}`);
        }
      } catch (e) {
        console.log('  ✗ createdAt parsing failed:', e.message);
        allValid = false;
      }

      // Check tokens
      console.log('\n4. Validating Tokens:');
      console.log(`  ✓ accessToken: ${response.accessToken ? 'present' : 'missing'}`);
      console.log(`  ✓ refreshToken: ${response.refreshToken ? 'present' : 'missing'}`);

      if (allValid) {
        console.log('\n✅ All fields are Flutter-compatible!');
      } else {
        console.log('\n❌ Some fields are not Flutter-compatible!');
      }

      // Test login format
      console.log('\n5. Testing Login Response Format');
      const loginResult = await makeRequest('action', {
        path: 'auth_actions:login',
        args: {
          email,
          password: 'TestPassword123!',
        },
      });

      if (loginResult.status === 'success') {
        console.log('✓ Login successful');
        const loginUser = loginResult.value.user;
        console.log(`  id: ${loginUser.id}`);
        console.log(`  createdAt: ${loginUser.createdAt}`);
        console.log(`  lastLogin: ${loginUser.lastLogin}`);
      }

    } else {
      console.log('✗ Registration failed:', registerResult.errorMessage);
    }

  } catch (error) {
    console.error('❌ Test failed:', error.message);
  }
}

testFlutterFormat();
