<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Triad Activities</title>
    <link rel="stylesheet" href="/design.css">
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/profile.css">
</head>
<body>

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

            <!-- Edit Profile Form -->
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

            <!-- Stats -->
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
                </div>
                
                <div class="add-interest">
                    <input type="text" id="interestInput" placeholder="Add an interest (e.g., Hiking)">
                    <button type="button" id="addInterestBtn" class="btn-secondary">+ Add</button>
                </div>
                
                <div class="interests-tags" id="interestsContainer">
                    <#if interests?has_content>
                        <#list interests as interest>
                            <span class="interest-tag">
                                ${interest}
                                <button class="remove-btn" data-interest="${interest}">×</button>
                            </span>
                        </#list>
                    <#else>
                        <p class="no-interests">No interests added yet. Start adding some!</p>
                    </#if>
                </div>
            </div>

            <div id="message" class="message hidden"></div>

            <!-- Reviews -->
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
                    <p class="review-text">"Great hike with beautiful views."</p>
                </div>

                <div class="review-card">
                    <div class="review-header">
                        <div>
                            <h3>Live Jazz Night</h3>
                            <span class="review-date">2 months ago</span>
                        </div>
                        <span class="review-stars">★★★★★</span>
                    </div>
                    <p class="review-text">"Incredible music and atmosphere!"</p>
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
                <a href="/index.html">Home</a>
                <a href="/browse.html">Browse</a>
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

    <script>
        const CUSTOMER_ID = 1;
        const API_BASE = '/api/customers';

        document.addEventListener('DOMContentLoaded', function() {
            const editProfileBtn = document.getElementById('editProfileBtn');
            const editForm = document.getElementById('editProfileForm');
            const cancelEditBtn = document.getElementById('cancelEditBtn');
            const profileForm = document.getElementById('profileForm');
            const interestsContainer = document.getElementById('interestsContainer');
            const interestInput = document.getElementById('interestInput');
            const addInterestBtn = document.getElementById('addInterestBtn');
            const messageDiv = document.getElementById('message');

            if (editProfileBtn) {
                editProfileBtn.addEventListener('click', function() {
                    editForm.style.display = 'block';
                    editProfileBtn.style.display = 'none';
                });
            }

            if (cancelEditBtn) {
                cancelEditBtn.addEventListener('click', function() {
                    editForm.style.display = 'none';
                    editProfileBtn.style.display = 'block';
                });
            }

            if (profileForm) {
                profileForm.addEventListener('submit', async function(e) {
                    e.preventDefault();
                    
                    const firstName = document.getElementById('firstName').value.trim();
                    const lastName = document.getElementById('lastName').value.trim();
                    const email = document.getElementById('email').value.trim();
                    const location = document.getElementById('location').value.trim();
                    
                    try {
                        const response = await fetch(API_BASE + '/' + CUSTOMER_ID, {
                            method: 'PUT',
                            headers: { 'Content-Type': 'application/json' },
                            body: JSON.stringify({ firstName, lastName, email, location, password: 'password123' })
                        });
                        
                        if (!response.ok) throw new Error('Failed to save');
                        
                        const customer = await response.json();
                        
                        document.getElementById('displayName').textContent = customer.firstName + ' ' + customer.lastName;
                        document.getElementById('displayEmail').textContent = customer.email;
                        document.getElementById('displayLocation').textContent = customer.location;
                        
                        showMessage('Profile saved successfully! ✅', 'success');
                        editForm.style.display = 'none';
                        editProfileBtn.style.display = 'block';
                        
                    } catch (error) {
                        console.error('Error:', error);
                        showMessage('Failed to save profile.', 'error');
                    }
                });
            }

            if (addInterestBtn && interestInput) {
                addInterestBtn.addEventListener('click', async function() {
                    const interest = interestInput.value.trim();
                    
                    if (!interest) {
                        showMessage('Please enter an interest!', 'error');
                        return;
                    }
                    
                    try {
                        const response = await fetch(API_BASE + '/' + CUSTOMER_ID + '/interests', {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/json' },
                            body: JSON.stringify({ interest: interest })
                        });
                        
                        if (!response.ok) throw new Error('Failed to add interest');
                        
                        const customer = await response.json();
                        displayInterests(customer.interests || []);
                        interestInput.value = '';
                        showMessage('"' + interest + '" added! 🎉', 'success');
                        
                    } catch (error) {
                        console.error('Error:', error);
                        showMessage('Failed to add interest.', 'error');
                    }
                });

                interestInput.addEventListener('keypress', function(e) {
                    if (e.key === 'Enter') {
                        e.preventDefault();
                        addInterestBtn.click();
                    }
                });
            }

            if (interestsContainer) {
                interestsContainer.addEventListener('click', async function(e) {
                    if (e.target.classList.contains('remove-btn')) {
                        const interest = e.target.getAttribute('data-interest');
                        
                        try {
                            const response = await fetch(API_BASE + '/' + CUSTOMER_ID + '/interests/' + encodeURIComponent(interest), {
                                method: 'DELETE'
                            });
                            
                            if (!response.ok) throw new Error('Failed to remove');
                            
                            const customer = await response.json();
                            displayInterests(customer.interests || []);
                            showMessage('"' + interest + '" removed.', 'success');
                            
                        } catch (error) {
                            console.error('Error:', error);
                            showMessage('Failed to remove interest.', 'error');
                        }
                    }
                });
            }

            function displayInterests(interests) {
                if (!interestsContainer) return;
                
                if (!interests || interests.length === 0) {
                    interestsContainer.innerHTML = '<p class="no-interests">No interests added yet. Start adding some!</p>';
                    return;
                }
                
                let html = '';
                interests.forEach(function(interest) {
                    html += '<span class="interest-tag">' + interest + ' <button class="remove-btn" data-interest="' + interest + '">×</button></span>';
                });
                interestsContainer.innerHTML = html;
            }

            function showMessage(text, type) {
                if (!messageDiv) return;
                if (!type) type = 'success';
                
                messageDiv.textContent = text;
                messageDiv.className = 'message ' + type;
                messageDiv.classList.remove('hidden');
                
                clearTimeout(window.messageTimeout);
                window.messageTimeout = setTimeout(function() {
                    messageDiv.classList.add('hidden');
                }, 4000);
            }
        });
    </script>

</body>
</html>