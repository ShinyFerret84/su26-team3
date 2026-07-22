<!DOCTYPE html>
<html>
<head>
    <title>Book Event - Triad Activities</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
</head>
<body>
    <header class="app-header">
        <div class="logo">
            <a href="/index.html">Triad<span>Activities</span></a>
        </div>
        <nav class="main-nav">
            <a href="/index.html">Home</a>
            <a href="/customer/browse/${customer.id}">Browse</a>
            <a href="/customer/myplans/${customer.id}">My Plans</a>
            <a href="/customer/profile/${customer.id}">Profile</a>
        </nav>
        <div class="header-actions">
            <span class="location">${customer.location!"Winston-Salem, NC"}</span>
        </div>
    </header>

    <main style="max-width: 800px; margin: 40px auto; padding: 20px;">
        <h1>${event.eventName}</h1>
        <p><strong>Location:</strong> ${event.city}, ${event.state}</p>
        <p><strong>Date:</strong> ${event.date}</p>
        <p><strong>Time:</strong> ${event.startTime} - ${event.endTime}</p>
        <p><strong>Price:</strong> $${event.pricePerPerson} / person</p>
        <p><strong>Max Capacity:</strong> ${event.maxCapacity}</p>
        <p><strong>Description:</strong> ${event.description}</p>

        <hr>

        <form action="/customer/booking/confirm" method="post">
            <input type="hidden" name="customerId" value="${customer.id}">
            <input type="hidden" name="eventId" value="${event.id}">

            <div style="margin-bottom: 15px;">
                <label><strong>Number of people:</strong></label>
                <select name="numberOfPeople" style="display:block; margin-top:5px; padding:8px; width:100%; max-width:200px;">
                    <#list 1..event.maxCapacity as i>
                        <option value="${i}">${i}</option>
                    </#list>
                </select>
            </div>

            <div style="margin-bottom: 15px;">
                <label><strong>Special requests:</strong></label>
                <textarea name="specialRequests" rows="3" style="display:block; margin-top:5px; padding:8px; width:100%; max-width:400px;"></textarea>
            </div>

            <button type="submit" style="background:#667eea; color:white; padding:10px 30px; border:none; border-radius:8px; font-size:16px; cursor:pointer;">Confirm Booking</button>
        </form>

        <br>
        <a href="/customer/browse/${customer.id}">Back to Browse</a>
    </main>
</body>
</html>