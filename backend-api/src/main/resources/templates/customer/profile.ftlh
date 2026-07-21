<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Triad Activities</title>
    
    <!-- Stylesheets -->
    <link rel="stylesheet" href="/design.css">
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/profile.css">
</head>
<body>

    <!-- HEADER  -->
    <header class="app-header">
        <div class="logo">
            <a href="/index.html">Triad<span>Activities</span></a>
        </div>
        <nav class="main-nav">
            <a href="/index.html">Home</a>
            <a href="/browse.html">Browse</a>
            <a href="/myPlans.html">My Plans</a>
            <a href="/customer/profile/${customer.id}" class="active">Profile</a>
        </nav>
        <div class="header-actions">
            <span class="location">${location!"No location set"}</span>
        </div>
    </header>

    <!-- MAIN CONTENT -->
    <main>
        <div class="profile-page">

       <!-- Profile Header -->
      <div class="profile-header-section">
        <div class="profile-avatar">
          <span class="avatar-initials">${initials!"??"}</span>
      </div>
      <div class="profile-user-info">
        <h1 id="displayName">${firstName!"User"} ${lastName!""}</h1>
        <p class="profile-email" id="displayEmail">${email!"No email set"}</p>
        <p class="profile-location" id="displayLocation">${location!"No location set"}</p>
        <p class="profile-member">Member since ${memberSince!"2025"}</p>
    </div>
    <button class="btn-edit-profile" id="editProfileBtn">Edit Profile</button>
</div>

            <!-- Stats Cards -->
            <div class="profile-stats-grid">
                <div class="stat-card">
                    <span class="stat-number">${activitiesDone!"-"}</span>
                    <span class="stat-label">Activities Done</span>
                </div>
                <div class="stat-card">
                    <span class="stat-number">${reviewsWritten!"-"}</span>
                    <span class="stat-label">Reviews Written</span>
                </div>
                <div class="stat-card">
                    <span class="stat-number">${interestsCount!"-"}</span>
                    <span class="stat-label">Interests</span>
                </div>
            </div>

            <!-- Interests Section -->
            <div class="profile-interests-section">
                <div class="section-header">
                    <h2>My Interests</h2>
                    <button class="btn-secondary" onclick="alert('Edit interests')">Edit Interests</button>
                </div>
                <div class="interests-tags">
                    <#if interests?has_content>
                        <#list interests as interest>
                            <span class="interest-tag">${interest}</span>
                        </#list>
                    <#else>
                        <p class="no-interests">No interests added yet.</p>
                    </#if>
                    <span class="interest-tag-add" onclick="alert('Add new interest')">+ Add</span>
                </div>
            </div>

            <!-- My Recent Reviews -->
            <div class="profile-reviews-section">
                <div class="section-header">
                    <h2>My Recent Reviews</h2>
                </div>
                
                <div class="review-card">
                    <div class="review-header">
                        <div>
                            <h3>Wine Tasting in Yadkin Valley</h3>
                            <span class="review-date">2 weeks ago</span>
                        </div>
                        <span class="review-stars">★★★★★</span>
                    </div>
                    <p class="review-text">"Amazing experience! Beautiful views and delicious wine. Highly recommend!"</p>
                </div>

                <div class="review-card">
                    <div class="review-header">
                        <div>
                            <h3>Hiking at Hanging Rock</h3>
                            <span class="review-date">1 month ago</span>
                        </div>
                        <span class="review-stars">★★★★</span>
                    </div>
                    <p class="review-text">"Great hike with beautiful views. Would be better with more time at the top."</p>
                </div>

                <div class="review-card">
                    <div class="review-header">
                        <div>
                            <h3>Live Jazz Night</h3>
                            <span class="review-date">2 months ago</span>
                        </div>
                        <span class="review-stars">★★★★★</span>
                    </div>
                    <p class="review-text">"Incredible music and atmosphere! The band was amazing."</p>
                </div>
            </div>
        </div>
    </main>

    <!-- Edit Profile Form  -->
<div class="profile-edit-section" id="editProfileForm" style="display: none;">
    <h2>Edit Personal Information</h2>
    <form id="profileForm">
        <div class="form-row">
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" value="${firstName!''}">
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" value="${lastName!''}">
            </div>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" value="${email!''}">
        </div>
        <div class="form-group">
            <label for="location">Location</label>
            <input type="text" id="location" value="${location!''}" placeholder="e.g., Winston-Salem, NC">
        </div>
        <button type="submit" class="btn-primary">Save Changes</button>
        <button type="button" class="btn-secondary" id="cancelEditBtn">Cancel</button>
    </form>
</div>

    <!-- ===== FOOTER ===== -->
    <footer class="app-footer">
        <div class="footer-content">
            <div class="footer-section">
                <h4>Triad Activities</h4>
                <p>Discover the best experiences in the Triad area. From wine tasting to hiking, find your next adventure!</p>
            </div>
            <div class="footer-section">
                <h4>Quick Links</h4>
                <a href="/index.html">Home</a>
                <a href="/browse.html">Browse Activities</a>
                <a href="/myPlans.html">My Plans</a>
                <a href="/customer/profile/${customer.id}">Profile</a>
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