<!DOCTYPE html>
<html>
<head>
    <title>Review Error</title>
    <link rel="stylesheet" href="/shared.css">
    <link rel="stylesheet" href="/design.css">
    <style>
        .btn-secondary {
            background: #edf2f7;
            color: #2d3748;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s;
        }
        .btn-secondary:hover {
            background: #e2e8f0;
        }
    </style>
</head>
<body>
    <header class="app-header">
        <div class="logo">
            <a href="/index.html">Triad<span>Activities</span></a>
        </div>
    </header>
    <main style="max-width: 600px; margin: 40px auto; text-align: center;">
        <h1>Review Failed</h1>
        <p>${error!}</p>
        <p><a href="/customer/profile/1" class="btn-secondary">Back to Profile</a></p>
    </main>
</body>
</html>