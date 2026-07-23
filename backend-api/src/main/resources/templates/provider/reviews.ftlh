<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Triad Activities - Update Event</title>
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
            <a href="/providers/${provider.id?c}" >Dashboard</a> 
            <a href="/providers/${provider.id?c}/edit">Profile</a> 
            <a href="/providers/${provider.id?c}/events/new">Create Event</a>
            <a href="/providers/${provider.id?c}/metrics">Metrics</a>
        </nav>

        <div class="header-actions">
            <span class="location"> Winston-Salem, NC</span>
        </div>
    </header>

        
    <main>
        <div class="profile-page">

            <div class="section-header">
                <h1>Customer Reviews</h1>
                <p>Read customer feedback and respond to reviews.</p>
            </div>

            <#if reviews?has_content>

                <#list reviews as review>

                    <div class="event-card">

                        <h2>${review.event.eventName}</h2>

                        <p>
                            <strong>Customer:</strong>
                            ${review.customer.firstName}
                            ${review.customer.lastName}
                        </p>

                        <p>
                            <strong>Date:</strong>
                            ${review.reviewDate}
                        </p>

                        <p>
                            <strong>Rating:</strong>

                            <#list 1..5 as star>
                                <#if star <= review.rating>
                                    ★
                                <#else>
                                    ☆
                                </#if>
                            </#list>

                        </p>

                        <p>
                            <strong>Review:</strong><br>
                            ${review.comment}
                        </p>

                        <hr>

                        <#if review.providerReply?? && review.providerReply?has_content>

                            <div class="provider-reply">

                                <h3>Your Reply</h3>

                                <p>${review.providerReply}</p>

                                <small>
                                    Replied on ${review.replyDate}
                                </small>

                            </div>

                        <#else>

                            <form action="/providers/${provider.id?c}/reviews/${review.id?c}/reply"
                                method="post">

                                <label for="reply-${review.id}">
                                    Reply to this review
                                </label>

                                <textarea
                                    id="reply-${review.id}"
                                    name="providerReply"
                                    rows="5"
                                    placeholder="Write your response..."
                                    required></textarea>

                                <button
                                    type="submit"
                                    class="btn-primary">

                                    Submit Reply

                                </button>

                            </form>

                        </#if>

                    </div>

                </#list>

            <#else>

                <div class="empty-state">

                    <h2>No Reviews Yet</h2>

                    <p>
                        Customers haven't left any reviews for your events yet.
                    </p>

                </div>

            </#if>

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

                <a href="/providers/${provider.id?c}" >Dashboard</a> 
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