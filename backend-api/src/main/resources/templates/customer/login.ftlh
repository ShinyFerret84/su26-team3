<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Triad Activities - Customer Login</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <style>
        .auth-page {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 70vh;
            padding: 40px 20px;
        }
        .auth-container {
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            max-width: 520px;
            width: 100%;
        }
        .auth-header {
            text-align: center;
            margin-bottom: 32px;
        }
        .auth-header h1 {
            font-size: 28px;
            margin-bottom: 8px;
        }
        .auth-header p {
            color: #718096;
            font-size: 15px;
        }
        .auth-form .form-group {
            margin-bottom: 18px;
        }
        .auth-form label {
            display: block;
            font-weight: 500;
            font-size: 14px;
            color: #4a5568;
            margin-bottom: 4px;
        }
        .auth-form input {
            width: 100%;
            padding: 12px 14px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            transition: border-color 0.2s;
            font-family: inherit;
        }
        .auth-form input:focus {
            border-color: #667eea;
        }
        .auth-submit-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 8px;
        }
        .auth-submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }
        .auth-footer-links {
            text-align: center;
            margin-top: 24px;
            padding-top: 20px;
            border-top: 1px solid #edf2f7;
        }
        .auth-footer-links p {
            color: #718096;
            font-size: 14px;
            margin-bottom: 4px;
        }
        .auth-footer-links a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }
        .auth-footer-links a:hover {
            text-decoration: underline;
        }
        .login-error {
            background: #fed7d7;
            color: #9b2c2c;
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 16px;
            text-align: center;
            font-weight: 500;
        }
        .login-success {
            background: #c6f6d5;
            color: #276749;
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 16px;
            text-align: center;
            font-weight: 500;
        }
    </style>
</head>
<body>

    <header class="app-header">
        <div class="logo">
            <a href="/">Triad<span>Activities</span></a>
        </div>
        <nav class="main-nav">
            <a href="/">Home</a>
            <a href="/customer/browse/1">Browse</a>
            <a href="/customer/myplans/1">My Plans</a>
            <a href="/customer/profile/1">Profile</a>
        </nav>
        <div class="header-actions">
            <a href="/customer/login" class="login-btn-header active-btn">Customer Login</a>
            <a href="/customer/signup" class="get-started-btn-header">Get Started</a>
        </div>
    </header>

    <main>
        <div class="auth-page">
            <div class="auth-container">
                <div class="auth-header">
                    <h1>Customer Login</h1>
                    <p>Sign in to manage your profile and book events</p>
                </div>

                <#if error??>
                    <div class="login-error">
                        ${error}
                    </div>
                </#if>

                <#if success??>
                    <div class="login-success">
                        ${success}
                    </div>
                </#if>

                <form class="auth-form" action="/customer/login" method="post">
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email"
                            id="email"
                            name="email" 
                            placeholder="you@example.com"
                            value="${email!''}"
                            required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password"
                            id="password"
                            name="password"
                            placeholder="********"
                            required>
                    </div>

                    <button type="submit" class="auth-submit-btn">
                        Sign In as Customer
                    </button>
                </form>

                <div class="auth-footer-links">
                    <p>Don't have an account?
                        <a href="/customer/signup">Sign up as a customer</a>
                    </p>
                    <p>Are you a provider?
                        <a href="/providers/login">Login as provider</a>
                    </p>
                </div>
            </div>
        </div>
    </main>

    <footer class="app-footer">
        <div class="footer-content">
            <div class="footer-section">
                <h4>Triad Activities</h4>
                <p>Discover the best experiences in the Triad area.</p>
            </div>
            <div class="footer-section">
                <h4>Quick Links</h4>
                <a href="/">Home</a>
                <a href="/customer/browse/1">Browse Activities</a>
                <a href="/customer/myplans/1">My Plans</a>
                <a href="/customer/profile/1">Profile</a>
            </div>
            <div class="footer-section">
                <h4>Location</h4>
                <p>Winston-Salem, NC</p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 Triad Activities. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>