<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Triad Activities - Provider Portal</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <link rel="stylesheet" href="/provider.css?v=3">
</head>

<body>

    <!-- Navigation Bar -->
    <header class="app-header">
        <div class="logo">
            <a href="/providers/${provider.id?c}"> Triad<span>Activities</span></a>
        </div>

        <nav class="main-nav">
            <a href="/providers/${provider.id?c}" class="active">Dashboard</a> 
            <a href="/providers/${provider.id?c}/edit">Profile</a>
            <a href="/providers/${provider.id?c}/events/new">Create Event</a>
            <a href="/providers/${provider.id?c}/reviews">Reviews</a>
            <a href="/providers/${provider.id?c}/metrics">Metrics</a>
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
                    <p class="profile-location"> ${provider.companyName}</p>
                    <p class="profile-member">Provider since ${provider.memberSince}</p>
                </div>
            </div>

            <!-- Statistics Section -->
            <div class="profile-stats-grid">
                
                <div class="stat-card">
                    <span class="stat-number">${eventCount}</span>
                    <p class="stat-label">Events Hosted</p>
                </div>

                <div class="stat-card">
                    <span class="stat-number">${upcomingEventCount}</span>
                    <p class="stat-label">Upcoming Events</p>
                </div>

                <div class="stat-card">
                    <span class="stat-number">${pastEventCount}</span>
                    <p class="stat-label">Past Events</p>
                </div>

            </div>

            <!-- Upcoming Events Section -->
            <div class="profile-reviews-section">

                <div class="section-header">
                    <h2>Upcoming Events</h2>
                    
                    <div class="section-actions">
                        <#if upcomingEventCount gt 3>
                            <a href="/providers/${provider.id?c}/events/upcoming"
                            class="view-all">
                                View All Upcoming Events →
                            </a>
                        </#if>

                        <a href="/providers/${provider.id?c}/events/new"
                        class="view-all">
                            Create Event →
                        </a>
                    </div>
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
                                <p class="location">${event.city}, ${event.state}</p>
                                <div class="card-meta">
                                    <span>${event.formattedDate}</span>
                                    <span> ${event.formattedStartTime} - ${event.formattedEndTime} </span>
                                </div>

                                <div class="card-footer">
                                    <span class="price">
                                        
                                        <#if event.pricePerPerson??>
                                            $${event.pricePerPerson?string["0.00"]} 
                                            <span>/person</span> 
                                        
                                        <#else>
                                            Price not set
                                        </#if>

                                    </span>

                                    <a href="/providers/${provider.id?c}/events/${event.id?c}/edit" 
                                        class="view-detail-btn">
                                        Manage                               
                                    </a>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>

            <#else>

                <div class="empty-events">
                    <p class="empty-events-message">You do not have any upcoming events.</p>

                    <a href="/providers/${provider.id?c}/events/new" class="create-event-btn">
                            Create Your First Event
                    </a>
                </div>
            </#if>    

            </div>

            <!-- Past Events Section -->
            <div class="profile-reviews-section">

                <div class="section-header">
                    <h2>Past Events</h2>   
                    
                    <#if pastEventCount gt 3>
                        <a href="/providers/${provider.id?c}/events/past" class="view-all">
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
                                        <span>${event.formattedDate}</span>
                                        <span> ${event.formattedStartTime} - ${event.formattedEndTime} </span>
                                    </div>

                                    <div class="card-footer">
                                        <span class="price">
                                            <#if event.pricePerPerson??>
                                                $${event.pricePerPerson?string["0.00"]}
                                                <span>/person</span> 
                                            <#else>
                                                Price not set
                                            </#if>
                                        </span>
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
            <a href="/providers/${provider.id?c}">Dashboard</a>
            <a href="/providers/${provider.id?c}/edit">Profile</a>
            <a href="/providers/${provider.id?c}/events/new">Create Event</a>
            <a href="/providers/${provider.id?c}/reviews">Reviews</a>
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