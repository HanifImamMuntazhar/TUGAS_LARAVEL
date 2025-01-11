<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar Simpel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .navbar {
            background-color: #343a40;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .navbar-brand {
            font-size: 1.4rem;
            font-weight: bold;
            color: #ffffff;
            display: flex;
            align-items: center;
        }
        .navbar-brand i {
            font-size: 1.6rem;
            margin-right: 8px;
        }
        .navbar-nav .nav-link {
            font-size: 0.95rem;
            color: #f8f9fa;
            margin: 0 5px;
            transition: color 0.3s ease;
        }
        .navbar-nav .nav-link:hover {
            color: #ffc107; 
        }
        .navbar-toggler {
            border: none;
        }
        .navbar-toggler-icon {
            background-color: #ffffff;
            width: 25px;
            height: 3px;
            display: block;
            position: relative;
        }
        .navbar-toggler-icon::before,
        .navbar-toggler-icon::after {
            content: '';
            width: 25px;
            height: 3px;
            background-color: #ffffff;
            position: absolute;
            left: 0;
        }
        .navbar-toggler-icon::before {
            top: -7px;
        }
        .navbar-toggler-icon::after {
            top: 7px;
        }

        @media (max-width: 991px) {
            .navbar-nav {
                text-align: center;
            }
            .navbar-nav .nav-link {
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>

<header class="navbar navbar-expand-lg">
    <div class="container">
        <!-- Logo -->
        <a class="navbar-brand" href="/">
            <i class="bi bi-film"></i> TugasMovie
        </a>
        <!-- Toggler Button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Navbar Links -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('roles.index') }}">
                        <i class="bi bi-people-fill"></i> Peran
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('users.index') }}">
                        <i class="bi bi-person-circle"></i> Pengguna
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('casts.index') }}">
                        <i class="bi bi-star-fill"></i> Pemeran
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('genres.index') }}">
                        <i class="bi bi-tags-fill"></i> Genre
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('movies.index') }}">
                        <i class="bi bi-film"></i> Film
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('reviews.index') }}">
                        <i class="bi bi-chat-dots-fill"></i> Ulasan
                    </a>
                </li>
            </ul>
        </div>
    </div>
</header>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
