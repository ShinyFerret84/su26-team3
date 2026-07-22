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
        </nav>

        <div class="header-actions">
            <span class="location"> Winston-Salem, NC</span>
        </div>
    </header>

        
    <main>
        <div class="profile-page">
            
            <!-- Page Header -->
            <div class="page-header">
                <h1>Edit Event</h1>
                <p>
                    Review and update the event information below
                </p>
            </div>

            <!--Update Event Form-->
            <div class="form-card">
                <form action="/providers/${provider.id?c}/events/${event.id?c}/update" method="post">
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
                                required>
                        </div>

                        <div class="form-group">
                            <label for="category">Category *</label>

                            <select id="category" name="category" required>
                                <option value="">Select Category</option>
                                <option value="Food & Drink"
                                    <#if event.category?? &&
                                         event.category == "Food & Drink"> selected
                                    </#if>> Food & Drink
                                </option>

                                <option value="Outdoor" 
                                        <#if event.category?? &&
                                         event.category == "Outdoor Activities"> selected
                                    </#if>> Outdoor Activities
                                </option>

                                <option value="Entertainment"
                                    <#if event.category?? &&
                                         event.category == "Entertainment"> selected
                                    </#if>> Entertainment
                                </option>

                                <option value="Arts & Culture"
                                    <#if event.category?? &&
                                         event.category == "Arts & Culture"> selected
                                    </#if>>Arts & Culture
                                </option>

                                <option value="Sports & Recreation"
                                    <#if event.category?? &&
                                         event.category == "Sports & Recreation">
                                        selected
                                    </#if> >Sports & Recreation
                                </option>

                                <option value="Educational"
                                    <#if event.category?? &&
                                         event.category == "Educational">
                                        selected
                                    </#if>> Educational
                                </option>

                            </select>
                        </div>

                        <div class="form-group">
                            <label for="price">Price Per Person *</label>

                            <input
                                type="number"
                                id="price"
                                name="pricePerPerson"
                                value="${event.pricePerPerson!''}"
                                min="0"
                                required>
                        </div>

                        <div class="form-group full-width">
                            <label for="description">
                                Event Description
                            </label>

                            <textarea
                                id="description" name="description" required>
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
                            <label for="startTimeText">Start Time *</label>

                            <div class="time-input-group">
                                <input
                                    type="text"
                                    id="startTimeText"
                                    name="startTimeText"
                                    value="${startTimeText!''}"
                                    placeholder="8:00"
                                    pattern="^(0?[1-9]|1[0-2]):[0-5][0-9]$"
                                    required>

                                <label>
                                    <input type="radio"
                                        name="startMeridiem"
                                        value="AM"
                                        <#if startMeridiem == "AM">checked</#if>>
                                        AM
                                </label>

                                <label>
                                    <input type="radio"
                                        name="startMeridiem"
                                        value="PM"
                                        <#if startMeridiem == "PM">checked</#if>>
                                        PM
                                </label>
                            </div>    
                        </div>

                        <div class="form-group">
                            <label for="endTimeText">End Time *</label>

                            <div class="time-input-group">
                                <input
                                    type="text"
                                    id="endTimeText"
                                    name="endTimeText"
                                    value="${endTimeText!''}"
                                    placeholder="8:00"
                                    pattern="^(0?[1-9]|1[0-2]):[0-5][0-9]$"
                                    required>

                                <label>
                                    <input type="radio"
                                        name="endMeridiem"
                                        value="AM"
                                        <#if startMeridiem == "AM">checked</#if>>
                                        AM
                                </label>

                                <label>
                                    <input type="radio"
                                        name="endMeridiem"
                                        value="PM"
                                        <#if startMeridiem == "PM">checked</#if>>
                                        PM
                                </label>
                            </div>   
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
                                required>
                        </div>

                        <div class="form-group">
                            <label for="city">City *</label>

                            <input
                                type="text"
                                id="city"
                                name="city"
                                value="${event.city!''}"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="state">State *</label>

                            <input
                                type="text"
                                id="state"
                                name="state"
                                value="${event.state!''}"
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

                        <a href="/providers/${provider.id?c}" class="btn-secondary">
                            Back to Dashboard
                        </a>
                       

                        <button type="submit" class="btn-primary">
                            Save Changes
                        </button>

                    </div>

                </form>

            </div>

                <!-- Cancel Event Section -->
            <div class="form-card danger-section">

                <h2>Cancel Event</h2>

                <p>
                    Cancelling this event will keep the event and booking
                    records in the database, but customers will no longer
                    be able to make new bookings.
                </p>

                <#if event.cancelled?? && event.cancelled>

                    <p class="cancelled-message">
                        This event has already been cancelled.
                    </p>

                <#else>

                    <form
                        action="/providers/${provider.id?c}/events/${event.id?c}/delete"
                        method="post"
                        onsubmit="return confirm('Are you sure you want to cancel this event?');">

                        <button
                            type="submit"
                            class="btn-secondary delete-button">
                            Cancel Event
                        </button>

                    </form>

                </#if>

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

                <a href="#">Home</a>
                <a href="#">Browse Activities</a>
                
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