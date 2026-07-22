<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Provider Login - Triad Activities</title>
    <link rel="stylesheet" href="../common/shared.css">
    <link rel="stylesheet" href="../customer/design.css">
    <link rel="stylesheet" href="provider.css">
</head>

    <header class="app-header">
        <div class="logo">
            <a href="/high-fidelity-prototype/customer/index.html">Triad<span>Activities</span></a> 
        </div>
        <nav class="main-nav">
            <a href="/high-fidelity-prototype/customer/index.html">Home</a>
            <a href="/high-fidelity-prototype/customer/browse.html">Browse</a> 
        </nav>
        <div class="header-actions">
            <a href="/high-fidelity-prototype/customer/login.html" class="login-btn-header">Customer Login</a>
            <a href="/high-fidelity-prototype/provider-prototype/providerLogin.html" class="get-started-btn-header active-btn">Provider Login</a>
        </div>
    </header>

    <main>
        <div class="auth-page">
            <div class="auth-container">
                <div class="auth-header">
                    <h1>Provider Login</h1>
                    <p>Sign in to manage your events and business</p>
                </div>

                <form class="auth-form">
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" placeholder="business@example.com" required>
                    </div>

                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" placeholder="********" required>
                    </div>

                    <div class="form-options">
                        <label class="remember-checkbox">
                            <input type="checkbox"> Remember me
                        </label>
                        <a href="#" class="forgot-password">Forgot password?</a>
                    </div>

                    <button type="submit" class="auth-submit-btn" onclick="window.location.href='/high-fidelity-prototype/provider-prototype/provider-landing.html'">Sign In as Provider</button>
                </form>

                <div class="auth-footer-links">
                    <p>Don't have a provider account? <a href="/high-fidelity-prototype/provider-prototype/providerSignUp.html">Sign up as a provider</a></p>
                    <p>Are you a customer? <a href="/high-fidelity-prototype/customer/login.html">Login as customer</a></p>
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
                <a href="/high-fidelity-prototype/customer/index.html">Home</a>
                <a href="/high-fidelity-prototype/customer/browse.html">Browse Activities</a>
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

    <script src="../common/script.js"></script>
    <script src="script.js"></script>
</body>
</html> 