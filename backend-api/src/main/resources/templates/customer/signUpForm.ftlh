<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Triad Activities - Sign Up</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <link rel="stylesheet" href="/profile.css">

</head>
<body>

    <header class="app-header">
        <div class="logo">
            <a href="/">Triad<span>Activities</span></a>
        </div>
        <nav class="main-nav">
            <a href="/">Home</a>
            <a href="/customer/browse">Browse</a>
        </nav>
        <div class="header-actions">
            <a href="/customer/login" class="login-btn-header">Customer Login</a>
            <a href="/providers/login" class="get-started-btn-header">Provider Login</a>
        </div>
    </header>

    <main>
        <div class="auth-page">
            <div class="auth-container">
                <div class="auth-header">
        
                    <h1>Create Your Customer Account</h1>
                    <p>Join Triad Activities and discover amazing experiences in the Triad area</p>
                
                </div>

                <#if error??>
                    <div class="form-error">
                        ${error}
                    </div>
                </#if>

                <form action="/customer/signup" method="post" class="auth-form">
                    <div class="form-row">

                        <div class="form-group">
                            <label>First Name *</label>
                            <input type="text" 
                                id="firstName"
                                name="firstName"
                                value="${customer.firstName!""}"
                                placeholder="Luna" required>
                        </div>

                        <div class="form-group">
                            <label>Last Name *</label>
                            <input type="text" 
                                id="lastName"
                                name="lastName"
                                value="${customer.lastName!""}"
                                placeholder="Clark" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Email Address *</label>
                        <input type="email" 
                            id="email"
                            name="email"
                            value="${customer.email!""}"
                            placeholder="LunaClark@gmail.com" required>
                    </div>

                    <div class="form-group">
                        <label>Password *</label>
                        <input type="password" 
                            id="password"
                            name="password"
                            placeholder="Create a strong password" required>
                    </div>

                    <div class="form-group">
                        <label for="location">Location</label>
                        <select id="location" name="location">
                            <option value="">Select your city</option>

                            <option value="Winston-Salem"
                                <#if customer.location?? && customer.location == "Winston-Salem">
                                selected
                                </#if>>Winston-Salem</option>

                            <option value="Greensboro" 
                                <#if customer.location?? && customer.location == "Greensboro">selected
                                </#if>>Greensboro</option>

                            <option value="High Point" <#if customer.location?? && customer.location == "High Point">selected
                                </#if>>High Point</option>

                            <option value="Kernersville" <#if customer.location?? && customer.location == "Kernersville"> selected
                                </#if>>Kernersville</option>
                        </select>
                    </div>

                    <div class="form-divider">
                        <span>Your Interests</span>
                    </div>

                    <div class="interests-grid">

                        <label class="interest-checkbox">
                            <input type="checkbox" name="interests" value="Food & Drink"> 
                            Food &amp; Drink
                        </label>

                        <label class="interest-checkbox">
                            <input type="checkbox" name="interests" value="Outdoor"> 
                            Outdoor Activities
                        </label>

                        <label class="interest-checkbox">
                            <input type="checkbox" type="checkbox" name="interests" value="Entertainment">
                            Entertainment
                        </label>

                        <label class="interest-checkbox">
                            <input type="checkbox" name="interests" value="Arts & Culture"> 
                            Arts &amp; Culture
                        </label>

                        <label class="interest-checkbox">
                            <input type="checkbox" name="interests" value="Sports & Recreation"> 
                            Sports &amp; Recreation
                        </label>

                        <label class="interest-checkbox">
                            <input type="checkbox" name="interests" value="Educational"> Educational
                        </label>
                    </div>

                    <div class="form-group terms-group">
                        <label class="terms-checkbox">
                            <input type="checkbox" name="termsAccepted" value="true" required>
                            I agree to the Terms of Service and Privacy Policy
                        </label>
                    </div>

                    <button type="submit" class="auth-submit-btn">Create Customer Account</button>
                </form>

                <div class="auth-footer-links">
                    <p>Are you a provider? <a href="/providers/new">Sign up as a provider</a></p>
                    <p>Already have an account? <a href="/customer/login">Login here</a></p>
                </div>
            </div>
        </div>
    </main>

    <footer class="app-footer">
        <div class="footer-content">
            <div class="footer-section">
                <h4>Triad Activities</h4>
                <p>Discover the best experiences in the Triad area. From wine tasting to hiking, find your next adventure!</p>
            </div>
            <div class="footer-section">
                <h4>Quick Links</h4>
                <a href="/">Home</a>
                <a href="/customer/browse">Browse Activities</a>
                <a href="/customer/login">Customer Login</a>
                <a href="/providers/login">Provider Login</a>
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