// Comprehensive test for all Convex features
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

async function testAllFeatures() {
    console.log('🧪 Testing All Convex Features...\n');
    let testsPassed = 0;
    let testsFailed = 0;

    try {
        // Test 1: User Registration & Login
        console.log('📝 1. User Authentication');
        const email = `test${Date.now()}@example.com`;
        const password = 'TestPassword123!';

        const registerResult = await makeRequest('action', {
            path: 'auth_actions:register',
            args: {
                email,
                username: `testuser${Date.now()}`,
                password,
                firstName: 'Test',
                lastName: 'User',
                dateOfBirth: '1990-01-01',
                country: 'India',
            },
        });

        if (registerResult.status === 'success') {
            console.log('  ✓ Registration works');
            testsPassed++;
            const userId = registerResult.value.user.id;

            const loginResult = await makeRequest('action', {
                path: 'auth_actions:login',
                args: { email, password },
            });

            if (loginResult.status === 'success') {
                console.log('  ✓ Login works');
                testsPassed++;
            } else {
                console.log('  ✗ Login failed:', loginResult.errorMessage);
                testsFailed++;
            }

            // Test 2: Get User Wallet
            console.log('\n💰 2. Wallet Management');
            const walletResult = await makeRequest('query', {
                path: 'wallets:getByUser',
                args: { userId },
            });

            if (walletResult.status === 'success') {
                console.log('  ✓ Get wallet works');
                console.log('    Balance:', walletResult.value.balance);
                console.log('    Currency:', walletResult.value.currency);
                testsPassed++;
            } else {
                console.log('  ✗ Get wallet failed:', walletResult.errorMessage);
                testsFailed++;
            }

            // Test 3: Sports List
            console.log('\n⚽ 3. Sports Management');
            const sportsResult = await makeRequest('query', {
                path: 'sports:list',
                args: {},
            });

            if (sportsResult.status === 'success') {
                console.log('  ✓ List sports works');
                console.log('    Sports count:', sportsResult.value.length);
                testsPassed++;
            } else {
                console.log('  ✗ List sports failed:', sportsResult.errorMessage);
                testsFailed++;
            }

            // Test 4: Matches List
            console.log('\n🏆 4. Matches Management');
            const matchesResult = await makeRequest('query', {
                path: 'matches:list',
                args: { limit: 10 },
            });

            if (matchesResult.status === 'success') {
                console.log('  ✓ List matches works');
                console.log('    Matches count:', matchesResult.value.length);
                testsPassed++;
            } else {
                console.log('  ✗ List matches failed:', matchesResult.errorMessage);
                testsFailed++;
            }

            // Test 5: User Profile Update
            console.log('\n👤 5. Profile Management');
            const updateResult = await makeRequest('mutation', {
                path: 'users:updateProfile',
                args: {
                    userId,
                    phone: '+919999999999',
                },
            });

            if (updateResult.status === 'success') {
                console.log('  ✓ Update profile works');
                console.log('    Updated phone:', updateResult.value.phone);
                testsPassed++;
            } else {
                console.log('  ✗ Update profile failed:', updateResult.errorMessage);
                testsFailed++;
            }

            // Test 6: Password Change
            console.log('\n🔐 6. Password Management');
            const changePasswordResult = await makeRequest('action', {
                path: 'auth_actions:changePassword',
                args: {
                    userId,
                    currentPassword: password,
                    newPassword: 'NewPassword123!',
                },
            });

            if (changePasswordResult.status === 'success') {
                console.log('  ✓ Change password works');
                testsPassed++;

                // Test login with new password
                const newLoginResult = await makeRequest('action', {
                    path: 'auth_actions:login',
                    args: { email, password: 'NewPassword123!' },
                });

                if (newLoginResult.status === 'success') {
                    console.log('  ✓ Login with new password works');
                    testsPassed++;
                } else {
                    console.log('  ✗ Login with new password failed');
                    testsFailed++;
                }
            } else {
                console.log('  ✗ Change password failed:', changePasswordResult.errorMessage);
                testsFailed++;
            }

        } else {
            console.log('  ✗ Registration failed:', registerResult.errorMessage);
            testsFailed++;
        }

        // Summary
        console.log('\n' + '='.repeat(50));
        console.log('📊 Test Summary');
        console.log('='.repeat(50));
        console.log(`✓ Passed: ${testsPassed}`);
        console.log(`✗ Failed: ${testsFailed}`);
        console.log(`Total: ${testsPassed + testsFailed}`);
        console.log('='.repeat(50));

        if (testsFailed === 0) {
            console.log('\n🎉 All tests passed! Your Convex backend is working perfectly!');
        } else {
            console.log('\n⚠️  Some tests failed. Please check the errors above.');
        }

    } catch (error) {
        console.error('\n❌ Test suite failed:', error.message);
    }
}

testAllFeatures();
