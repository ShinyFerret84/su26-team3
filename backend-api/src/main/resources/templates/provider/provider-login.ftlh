<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Triad Activities - Provider Login</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <link rel="stylesheet" href="provider.css">
</head>

    <header class="app-header">
        <div class="logo">
            <a href="#">Triad<span>Activities</span></a> 
        </div>
        <nav class="main-nav">
            <a href="#">Home</a>
            <a href="#">Browse</a> 
        </nav>
        <div class="header-actions">
            <a href="#" class="login-btn-header">Customer Login</a>
            <a href="#" class="get-started-btn-header active-btn">Provider Login</a>
        </div>
    </header>

    <main>
        <div class="auth-page">
            <div class="auth-container">
                <div class="auth-header">
                    <h1>Provider Login</h1>
                    <p>Sign in to manage your events and business</p>
                </div>

                <#if error??>
                    <div class="login-error">
                            ${error}
                    </div>
                </#if>

                <form class="auth-form" action="/providers/login" method="post">
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email"
                            id="email"
                            name="email" 
                            placeholder="business@example.com"
                            value="${email!''}"
                            required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password"
                            id="password"
                            name="password"
                            placeholder="********" required>
                    </div>

                    <button type="submit" class="auth-submit-btn">
                        Sign In as Provider
                    </button>
                </form>

                <div class="auth-footer-links">
                    <p>Don't have a provider account?
                        <a href="/providers/new">Sign up as a provider</a>
                    </p>

                    <p>Are you a customer?
                        <a href="/login">Login as customer</a>
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
                <a href="#">Home</a>
                <a href="#">Browse Activities</a>
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