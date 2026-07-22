<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Triad Activities - Create Event</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <link rel="stylesheet" href="/provider.css">
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
            <a href="/providers/${providerId}/events/new" class="active">Create Event</a>
        </nav>

        <div class="header-actions">
            <span class="location"> Winston-Salem, NC</span>
        </div>
    </header>

        
    <main>
        <div class="profile-page">
            
            <!-- Page Header -->
            <div class="page-header">
                <h1>Create a New Event</h1>
                <p>
                    Fill out the information below to publish a new activity
                    for customers to discover.
                </p>
            </div>

            <!-- Form Card -->
            <div class="form-card">
                <form action="/providers/${provider.id?c}/events/create" method="post">
                    <!-- Event Information -->

                    <h2>Event Information</h2>

                    <div class="form-grid">

                        <div class="form-group full-width">
                            <label for="eventName">Event Name *</label>

                            <input
                                type="text"
                                id="eventName"
                                name="eventName"
                                value="${event.eventName!''}"
                                placeholder="Wine Tasting Experience"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="category">Category *</label>

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

                        <div class="form-group">
                            <label for="price">Price Per Person *</label>

                            <input
                                type="number"
                                id="price"
                                name="pricePerPerson"
                                value="${event.pricePerPerson!''}"
                                placeholder="45"
                                min="0"
                                required>
                        </div>

                        <div class="form-group full-width">
                            <label for="description">
                                Event Description
                            </label>

                            <textarea
                                id="description" name="description"
                                placeholder="Describe your event and what attendees can expect." required>
                                    ${event.description!''}</textarea>
                        </div>

                    </div>

                    <br>

                    <!-- Date & Time -->

                    <h2>Date & Time</h2>

                    <div class="form-grid">

                        <div class="form-group">
                            <label for="eventDate">Event Date *</label>

                            <input
                                type="date"
                                id="eventDate"
                                name="date"
                                value="${event.date!''}"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="startTime">Start Time *</label>

                            <input
                                type="time"
                                id="startTime"
                                name="startTime"
                                value="${event.startTime!''}"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="endTime">End Time *</label>

                            <input
                                type="time"
                                id="endTime"
                                name="endTime"
                                value="${event.endTime!''}"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="capacity">
                                Maximum Attendees
                            </label>

                            <input
                                type="number"
                                id="capacity"
                                name="maxCapacity"
                                value="${event.maxCapacity!''}"
                                placeholder="25"
                                min="1"
                                required>
                        </div>

                    </div>

                    <br>

                    <!-- Location -->

                    <h2>Location</h2>

                    <div class="form-grid">

                        <div class="form-group full-width">
                            <label for="venue">
                                Venue Name *
                            </label>

                            <input
                                type="text"
                                id="venue"
                                name="venueName"
                                value="${event.venueName!''}"
                                placeholder="Yadkin Valley Winery"
                                required>
                        </div>

                        <div class="form-group full-width">
                            <label for="address">
                                Street Address *
                            </label>

                            <input
                                type="text"
                                id="address"
                                name="streetAddress"
                                value="${event.streetAddress!''}"
                                placeholder="123 Main Street"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="city">City *</label>

                            <input
                                type="text"
                                id="city"
                                name="city"
                                value="${event.city!''}"
                                placeholder="Winston-Salem"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="state">State *</label>

                            <input
                                type="text"
                                id="state"
                                name="state"
                                value="${event.state!''}"
                                placeholder="NC"
                                maxlength="2"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="zip">ZIP Code *</label>

                            <input
                                type="text"
                                id="zip"
                                name="zipCode"
                                value="${event.zipCode!''}"
                                placeholder="27101"
                                required>
                        </div>

                    </div>

                    <br>

                    <!-- Image -->

                    <h2>Event Image</h2>

                    <div class="form-grid">

                        <div class="form-group full-width">
                            <label for="image">
                                Upload Event Image
                            </label>

                            <input
                                type="url"
                                id="image"
                                name="imageUrl"
                                value="${event.imageUrl!''}"
                                accept="https://example.com/event.jpg*">
                        </div>

                    </div>

                    <!-- Buttons -->

                    <div class="form-actions">

                        <button
                            type="reset"
                            class="btn-secondary">

                            Clear Form

                        </button>

                        <button
                            type="submit"
                            class="btn-primary">

                            Publish Event

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

                <a href="index.html">Home</a>
                <a href="browse.html">Browse Activities</a>
                
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