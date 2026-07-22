<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmed</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
</head>
<body>
    <header class="app-header">
        <div class="logo">
            <a href="/index.html">Triad<span>Activities</span></a>
        </div>
    </header>
    <main style="max-width: 600px; margin: 40px auto; text-align: center;">
        <h1>Booking Confirmed!</h1>
        <p>Your booking has been confirmed successfully.</p>
        <p><a href="/customer/myplans/${booking.customer.id}" class="btn-primary">View My Plans</a></p>
        <p><a href="/customer/browse/${booking.customer.id}" class="btn-secondary">Browse More Events</a></p>
    </main>
</body>
</html>