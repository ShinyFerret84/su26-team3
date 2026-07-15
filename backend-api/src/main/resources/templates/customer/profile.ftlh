<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Interest Profile - Triad Activities</title>
    
    <!-- Stylesheets -->
    <link rel="stylesheet" href="design.css">
    <link rel="stylesheet" href="profile.css">
</head>
<body>

    <!-- HEADER -->
    <header class="app-header">
        <div class="logo">
            <a href="/index.html">Triad<span>Activities</span></a>
        </div>
        <nav class="main-nav">
            <a href="/index.html">Home</a>
            <a href="/browse.html">Browse</a>
            <a href="/myPlans.html">My Plans</a>
            <a href="/profile.html" class="active">Profile</a>
        </nav>
        <div class="header-actions">
            <span class="location" id="userLocation">Loading...</span>
        </div>
    </header>

    <!-- MAIN CONTENT -->
    <main>
        <div class="profile-page">

            <!-- Profile Header (Name, avatar, email) -->
            <div class="profile-header-section">
                <div class="profile-avatar">
                    <span class="avatar-initials" id="avatarInitials">??</span>
                </div>
                <div class="profile-user-info">
                    <h1 id="userName">Loading...</h1>
                    <p class="profile-email" id="LunaClark@gmail.com">Loading...</p>
                    <p class="profile-location" id="Winston-Salem">Loading...</p>
                    <p class="profile-member" id="Member since 2025">Loading...</p>
                </div>
                <button class="btn-edit-profile" id="saveProfileBtn">Save Profile</button>
            </div>

            <!-- Statistics Cards -->
            <div class="profile-stats-grid">
                <div class="stat-card">
                    <span class="stat-number" id="activitiesDone">-</span>
                    <span class="stat-label">Activities Done</span>
                </div>
                <div class="stat-card">
                    <span class="stat-number" id="reviewsWritten">-</span>
                    <span class="stat-label">Reviews Written</span>
                </div>
                <div class="stat-card">
                    <span class="stat-number" id="interestsCount">-</span>
                    <span class="stat-label">Interests</span>
                </div>
            </div>

            <!-- Edit Profile Form -->
            <div class="profile-edit-section">
                <h2>Edit Personal Information</h2>
                <form id="profileForm">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <input type="text" id="firstName" required>
                        </div>
                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input type="text" id="lastName" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" required>
                    </div>
                    <div class="form-group">
                        <label for="location">Location</label>
                        <input type="text" id="location" placeholder="e.g., Winston-Salem, NC">
                    </div>
                    <button type="submit" class="btn-primary">Update Profile</button>
                </form>
            </div>

            <!-- Interests Section -->
            <div class="profile-interests-section">
                <div class="section-header">
                    <h2>My Interests</h2>
                </div>
                <div class="add-interest">
                    <input type="text" id="interestInput" placeholder="Add an interest (e.g., Hiking)">
                    <button id="addInterestBtn" class="btn-secondary">+ Add</button>
                </div>
                <div class="interests-tags" id="interestsContainer">
                    <p class="no-interests">No interests added yet. Start adding some!</p>
                </div>
            </div>

            <!-- Message Area -->
            <div id="message" class="message hidden"></div>
            
        </div>
    </main>

    <!-- ===== FOOTER ===== -->
    <footer class="app-footer">
        <div class="footer-content">
            <div class="footer-section">
                <h4>Triad Activities</h4>
                <p>Discover the best experiences in the Triad area.</p>
            </div>
            <div class="footer-section">
                <h4>Quick Links</h4>
                <a href="/index.html">Home</a>
                <a href="/browse.html">Browse Activities</a>
                <a href="/myPlans.html">My Plans</a>
                <a href="/profile.html">Profile</a>
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

    <!-- JavaScript to function the page-->
    <script src="profile.js"></script>
</body>
</html>