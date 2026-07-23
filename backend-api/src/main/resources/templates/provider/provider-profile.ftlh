<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Triad Activities - Provider Portal</title>
    
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <link rel="stylesheet" href="/provider.css?v=2">
    
</head>

<body>

    <!-- Navigation Bar -->
    <header class="app-header">
        <div class="logo">
            <a href="/providers/${provider.id?c}"> Triad<span>Activities</span></a>
        </div>

        <nav class="main-nav">
            <a href="/providers/${provider.id?c}">Dashboard</a> 
            <a href="/providers/${provider.id?c}/edit" class="active">Profile</a>
            <a href="/providers/${provider.id?c}/events/new">Create Event</a>
            <a href="/providers/${provider.id?c}/metrics">Metrics</a>
        </nav>

    </header>

    <main>
        <div class="profile-page">

            <!--Header Section-->
            <div class="page-header">
                <h1>Business Profile</h1>
                <p>Review and update your business account information.</p>
            </div>

            <!--Profile Summary-->
            <div class="profile-header-section">
                <div class="profile-avatar">
                    <span class="avatar-initials">
                        ${provider.firstName?substring(0, 1)?upper_case}${provider.lastName?substring(0, 1)?upper_case}
                    </span>
                </div>

                <div class="profile-user-info">

                    <h2>${provider.companyName}</h2>

                    <p class="profile-email">${provider.email}</p>

                    <p class="profile-location">${provider.category}</p>

                    <p class="profile-member">Provider since ${provider.memberSince}</p>
                </div>

            </div>

             <!--Update Form-->
            <div class="form-card">

                <form
                    action="/providers/${provider.id?c}/update"
                    method="post">

                    <!--Contact Information-->
                    <h2>Business Contact Information</h2>

                    <div class="form-grid">

                        <div class="form-group">

                            <label for="firstName">
                                First Name *
                            </label>

                            <input
                                type="text"
                                id="firstName"
                                name="firstName"
                                value="${provider.firstName!''}"
                                required>

                        </div>

                        <div class="form-group">

                            <label for="lastName">
                                Last Name *
                            </label>

                            <input
                                type="text"
                                id="lastName"
                                name="lastName"
                                value="${provider.lastName!''}"
                                required>

                        </div>

                        <div class="form-group">

                            <label for="email">
                                Email Address *
                            </label>

                            <input
                                type="email"
                                id="email"
                                name="email"
                                value="${provider.email!''}"
                                required>

                        </div>

                        <div class="form-group">

                            <label for="phoneNumber">
                                Phone Number
                            </label>

                            <input
                                type="tel"
                                id="phoneNumber"
                                name="phoneNumber"
                                value="${provider.phoneNumber!''}"
                                placeholder="555-555-5555">

                        </div>

                    </div>

                    <!-- Business Information -->
                    <h2>Business Information</h2>

                    <div class="form-grid">

                        <div class="form-group">

                            <label for="companyName">
                                Company Name *
                            </label>

                            <input
                                type="text"
                                id="companyName"
                                name="companyName"
                                value="${provider.companyName!''}"
                                required>

                        </div>

                        <div class="form-group">

                            <label for="category">
                                Business Category *
                            </label>

                            <select
                                id="category"
                                name="category"
                                required>

                                <option value="">
                                    Select Category
                                </option>

                                <option
                                    value="Food & Drink"
                                    <#if provider.category == "Food & Drink">
                                        selected
                                    </#if>>
                                    Food &amp; Drink
                                </option>

                                <option
                                    value="Outdoor Activities"
                                    <#if provider.category == "Outdoor Activities">
                                        selected
                                    </#if>>
                                    Outdoor Activities
                                </option>

                                <option
                                    value="Entertainment"
                                    <#if provider.category == "Entertainment">
                                        selected
                                    </#if>>
                                    Entertainment
                                </option>

                                <option
                                    value="Arts & Culture"
                                    <#if provider.category == "Arts & Culture">
                                        selected
                                    </#if>>
                                    Arts &amp; Culture
                                </option>

                                <option
                                    value="Sports & Recreation"
                                    <#if provider.category == "Sports & Recreation">
                                        selected
                                    </#if>>
                                    Sports &amp; Recreation
                                </option>

                                <option
                                    value="Educational"
                                    <#if provider.category == "Educational">
                                        selected
                                    </#if>>
                                    Educational
                                </option>

                            </select>

                        </div>

                        <div class="form-group full-width">

                            <label for="website">
                                Company Website
                            </label>

                            <input
                                type="url"
                                id="website"
                                name="website"
                                value="${provider.website!''}"
                                placeholder="https://www.yourbusiness.com">

                        </div>

                        <div class="form-group full-width">

                            <label for="description">
                                Business Description
                            </label>

                            <textarea
                                id="description"
                                name="description"
                                placeholder="Tell customers about your business...">${provider.description!''}</textarea>

                        </div>

                    </div>

                    <!-- Password -->
                    <h2>Account Information</h2>

                    <div class="form-grid">

                        <div class="form-group full-width">

                            <label for="password">
                                New Password
                            </label>

                            <input
                                type="password"
                                id="password"
                                name="password"
                                placeholder="Leave blank to keep current password">

                        </div>

                    </div>

                    <!-- Buttons -->
                    <div class="form-actions">

                        <a
                            href="/providers/${provider.id?c}"
                            class="btn-secondary">
                            ← Back to Dashboard
                        </a>

                        <button
                            type="submit"
                            class="btn-primary">
                            Save Changes
                        </button>

                    </div>

                </form>

            </div>

            <!-- Delete Account -->
            <div class="form-card danger-section">

                <h2>Delete Account</h2>

                <p>
                    Deleting your account will deactivate your provider
                    profile. Your previous events will remain available
                    in customer booking history.
                </p>

                <form
                    action="/providers/${provider.id?c}/delete"
                    method="post"
                    onsubmit="return confirm(
                        'Are you sure you want to deactivate your account?'
                    );">

                    <button
                        type="submit"
                        class="btn-secondary delete-button">
                        Delete Provider Account
                    </button>

                </form>

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
            <a href="/providers/${provider.id?c}">Dashboard</a>
            <a href="/providers/${provider.id?c}/edit">Profile</a>
            <a href="/providers/${provider.id?c}/events/new">Create Event</a>
            <a href="/providers/${provider.id?c}/metrics">Metrics</a>
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