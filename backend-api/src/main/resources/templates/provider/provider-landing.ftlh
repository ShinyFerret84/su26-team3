<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Triad Activities - Provider Portal</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <link rel="stylesheet" href="/provider.css">
</head>

<body>

    <!-- Navigation Bar -->
    <header class="app-header">
        <div class="logo">
            <a href="/provider/${provider.id?c}"> Triad<span>Activities</span></a>
        </div>

        <nav class="main-nav">
            <a href="/provider/${provider.id?c}" class="active">Dashboard</a> 
            <a href="provider-profile.html">Profile</a> 
            <a href="/provider/${provider.id?c}/events/new">Create Event</a>
            //add metrics back in
        </nav>

    </header>

    <main>
        <div class="profile-page">

            <!-- Profile Header Section -->
            <div class="profile-header-section">
                <div class="profile-avatar">
                    <span class="avatar-initials">
                        ${provider.firstName?substring(0, 1)?upper_case}${provider.lastName?substring(0, 1)?upper_case}
                    </span>
                </div>

                <div class="profile-user-info">
                    <h1>Welcome back, ${provider.firstName}!</h1>
                    <p class="profile-email"> ${provider.email}</p>
                    <p class="profile-location"> ${provider.city}, ${provider.state}</p>
                    <p class="profile-member">Provider since ${provider.memberSince?string("MMMM yyyy")}

            <!-- Statistics Section -->
            <div class="profile-stats-grid">
                
                <div class="stat-card">
                    <span class="stat-number">${eventCount}</span>
                    <p class="stat-label">Events Hosted</p>
                </div>

                <div class="stat-card">
                    <span class="stat-number">${upcomingEvents?size}</span>
                    <p class="stat-label">Total Attendees</p>
                </div>

                <div class="stat-card">
                    <span class="stat-number">4.8</span>
                    <p class="stat-label">Average Rating</p>
                </div>

            </div>

            <!-- Upcoming Events Section -->
            <div class="profile-reviews-section">

                <div class="section-header">
                    <h2>Upcoming Events</h2>
                    <a href="/provider/${provider.id?c}/events/new"
                        class="view-all">Create Event →</a>
                </div>

            <#if upcomingEvents?has_content>

                <div class="activity-grid">
                    
                    <#list upcomingEvents as event>

                        <!-- Event Card -->
                        <div class="activity-card">

                            <#if event.imageUrl?? && event.imageUrl?has_content>
                                <div class="card-image"
                                        style="background-image:url('${event.imageUrl}');
                                                background-size: cover;
                                                background-position: center;">
                                </div>

                            <#else>

                                <div class="card-image" 
                                        style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                                </div>

                            </#if>
                            
                            <div class="card-body">
                                <h3>${event.eventName}</h3>
                                <p class="location">${event.state}, ${event.city}</p>
                                <div class="card-meta">
                                    <span>${event.date?string("EEE, MMMM d")}</span>
                                    <span> ${event.startTime?string("h:mm a")} - ${event.endTime?string("h:mm a")} </span>
                                </div>

                                <div class="card-footer">
                                    <span class="price">$${event.pricePerPerson?string["0.00"]} 
                                        <span>/person</span> </span>

                                    <a href="/provider/${provider.id?c}/events/${event.id?c}/edit" 
                                        class="view-detail-btn">
                                        Manage                               
                                    </a>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>

            <#else>

                <p>You do not have any upcoming events.</p>

                <a href="/provider/${provider.id?c}/events/new" class="btn-primary">
                        Create Your First Event
                </a>

            </#if>    

            </div>

            <!-- Past Events Section -->
            <div class="profile-reviews-section">

                <div class="section-header">
                    <h2>Past Events</h2>   
                    
                    <#if pastEventCount gt 3>
                        <a href="/provider/${provider.id?c}/events/past" class="view-all">
                            View All Past Events →
                        </a>
                    </#if>

                </div>

                <#if pastEvents?has_content>

                    <div class="activity-grid">

                        <#list pastEvents as event>
                        
                            <!-- Event Card -->
                            <div class="activity-card">
                                <#if event.imageUrl?? && event.imageUrl?has_content>
                                    <div class="card-image"
                                        style="background-image:url('${event.imageUrl}');
                                                background-size: cover;
                                                background-position: center;">
                                    </div>
                                <#else>

                                    <div class="card-image" 
                                        style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                                    </div>
                                
                                </#if>

                                <div class="card-body">
                                    <h3>${event.eventName} </h3>
                                    <p class="location">${event.city} , ${event.state} </p>
                                    <div class="card-meta">
                                        <span>${event.date?string("EEE, MMMM d")}</span>
                                        <span> ${event.startTime?string("h:mm a")} - ${event.endTime?string("h:mm a")} </span>
                                    </div>

                                    <div class="card-footer">
                                        <span class="price">$${event.pricePerPerson?string["0.00"]}
                                            <span>/person</span> </span>
                                    </div>
                                </div>
                            </div>

                        </#list>

                    </div>

                <#else>
                    <p>
                        You do not have any past events.
                    </p>
                
                </#if>
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
            <a href="/provider/${provider.id?c}">Dashboard</a>
            <a href="provider-profile.html">Profile</a>
            <a href="/provider/${provider.id?c}/events/new">Create Event</a>
            <a href="provider-metrics.html">Metrics</a>
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