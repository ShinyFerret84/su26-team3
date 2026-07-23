<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Triad Activities - New Provider Form</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <link rel="stylesheet" href="/provider.css">
</head>

<body>

    <!-- Navigation Bar -->
    <header class="app-header">
        <div class="logo">
            <a href="/"> Triad<span>Activities</span></a>
        </div>

        <nav class="main-nav">
            <a href="/">Home</a>
            <a href="customer/browse">Browse</a>
        </nav>

        <div class="header-actions">
            <span class="location"> Winston-Salem, NC</span>
        </div>
    </header>

        <!-- New Provider Form -->
    <main>
        <div class="profile-page">
            
            <!-- Page Header -->
            <div class="page-header">
                <h1>Become an Event Planner!</h1>
                <p>
                    Register your business with Triad Activities and start hosting events.
                </p>
            </div>

            <!-- Form Card -->
            <div class="form-card">
                <form action="/providers/create" method="post">
                    <!-- Contact Information -->
                    <h2>Business Contact Information</h2>

                        <div class="form-grid">

                            <div class="form-group">
                                <label for="firstName">First Name *</label>
                                <input type="text"
                                    id="firstName"
                                    name="firstName"
                                    value="${provider.firstName!''}"
                                    placeholder="John"
                                    required>
                            </div>

                            <div class="form-group">
                                <label for="lastName">Last Name *</label>
                                <input type="text"
                                    id="lastName"
                                    name="lastName"
                                    value="${provider.lastName!''}"
                                    placeholder="Smith"
                                    required>
                            </div>

                            <div class="form-group">
                                <label for="email">Email Address *</label>
                                <input type="email"
                                    id="email"
                                    name="email"
                                    value="${provider.email!''}"
                                    placeholder="johnsmith@email.com"
                                    required>
                            </div>

                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="tel"
                                    id="phone"
                                    name="phoneNumber"
                                    value="${provider.phoneNumber!''}"
                                    placeholder="555-555-5555">
                            </div>
                        </div>
                    <br>

                    <!-- Business Information -->

                    <h2>Business Information</h2>

                    <div class="form-grid">

                        <div class="form-group">
                            <label for="companyName">Company Name *</label>
                            <input type="text"
                                   id="companyName"
                                   name="companyName"
                                   value="${provider.companyName!''}"
                                   placeholder="Shiny Ferret Studios"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="category">Business Category *</label>

                            <select id="category" name="category" required>
                                <option value="">Select Category</option>
                                <option value="Food & Drink">Food & Drink</option>
                                <option value="Outdoor">Outdoor Activities</option>
                                <option value="Entertainment">Entertainment</option>
                                <option value="Arts & Culture">Arts & Culture</option>
                                <option value="Sports & Recreation">Sports & Recreation</option>
                                <option value="Educational">Educational</option>
                            </select>

                        </div>

                        <div class="form-group full-width">
                            <label for="website">Company Website</label>

                            <input type="url"
                                   id="website"
                                   name="website"
                                   value="${provider.website!''}"
                                   placeholder="https://www.yourbusiness.com">
                        </div>

                        <div class="form-group full-width">
                            <label for="description">
                                Business Description
                            </label>

                            <textarea id="description" name="description"
                                      placeholder="Tell customers about your business...">${provider.description!''}</textarea>
                        </div>

                    </div>

                    <br>

                    <!-- Account Information -->

                    <h2>Account Information</h2>

                    <div class="form-grid">

                        <div class="form-group">
                            <label for="password">Password *</label>

                            <input type="password"
                                   id="password"
                                   name="password"
                                   value="${provider.password!''}"
                                   required>
                        </div>

                    </div>

                    <!-- Buttons -->

                    <div class="form-actions">

                        <button type="reset"
                                class="btn-secondary">
                            Clear Form
                        </button>

                        <button type="submit"
                                class="btn-primary">
                            Create Business Account
                        </button>

                    </div>

                </form>
            </div>
        </div>
    </main> 

     <!-- Footer -->

    <footer class="app-footer">

        <div class="footer-content">

            <div class="footer-section">
                <h4>Triad Activities</h4>
                <p>
                    Discover the best experiences in the Triad area.
                </p>
            </div>

            <div class="footer-section">
                <h4>Quick Links</h4>

                <a href="customer/index">Home</a>
                <a href="customer/browse">Browse Activities</a>
                
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