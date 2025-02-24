<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School ERP Login</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" 
          crossorigin="anonymous">
    <link rel="stylesheet" href="main.css">
    <script src="https://kit.fontawesome.com/5f59ca6ad3.js" crossorigin="anonymous"></script>

    <style>
   body {
    background-image: 
        linear-gradient(
            rgba(0, 0, 0, 0.7), /* Dark gradient */
            rgba(0, 0, 0, 0.7)
        ), url('https://scontent-pnq1-1.xx.fbcdn.net/v/t39.30808-6/462324470_2865707696915867_3339677260262583709_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=833d8c&_nc_ohc=nWg8zqvxWpwQ7kNvgGYICMG&_nc_zt=23&_nc_ht=scontent-pnq1-1.xx&_nc_gid=AzlkF_z1mwya5Az-7rkT3fX&oh=00_AYDrXsPVhvW_vgK2eP8O721rqEe9O_tkNX0Rc2m662w2Eg&oe=67A788E8');
    background-position: center;
    background-size: cover;
    height: 100vh;
    background-repeat: no-repeat;
}

        /* Splash Screen */
        #splashScreen {
            background-color: #292648;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            z-index: 9999;
            transition: opacity 1s ease-in-out;
        }
        #splashScreen.hide {
            opacity: 0;
            pointer-events: none;
        }

        /* Login Page */
        .login-container {
            min-height: 80vh;
       
            display: none; /* Initially hidden */
        }
        .login-box {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .role-select {
            cursor: pointer;
        }
    </style>
</head>

<body class="d-flex align-items-center justify-content-center vh-100 bg-light">

    <!-- Splash Screen -->
    <div id="splashScreen">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT62K-43vTsZucGUE7vyFOZRKwHynf1NP2REA&s" 
             alt="School Logo" class="rounded-circle mb-3" width="120">
        <h3>Welcome to Janahit ERP</h3>
        <p>Manage everything in one place.</p>
        <div class="spinner-border mt-3 text-light" role="status"></div>
    </div>

    <!-- Main Content: Login Form -->
    <main id="loginContainer" class="container d-flex align-items-center justify-content-center login-container">
        <div class="row w-100">
            <!-- Left Side: Image -->
    

            <!-- Right Side: Login Form -->
            <div class="col-lg-6 col-md-8 mx-auto">
                <div class="login-box p-5 ">
                    <h3 class="focus-color text-center fw-bold">School ERP Login</h3>
                    <p class="text-center mb-4  text-muted">Enter your credentials to continue</p>
					
                    <form action="Login_Servlet"  method="post">
                        <!-- Role Selection -->
                        <div class="mb-3">
                            <label for="role" class="form-label fw-bold focus-color">Select Role</label>
                            <select class="form-select role-select form-control" id="role" name="role" required>
                                <option value="" disabled selected>Select your role</option>
                                <option value="student">Student</option>
                                <option value="teacher">Teacher</option>
                                <option value="parent">Parent</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>

                        <!-- Email Field -->
                        <div class="mb-3">
                            <label for="email" class="form-label fw-bold focus-color">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email">
                        </div>

                        <!-- Password Field -->
                        <div class="mb-5">
                            <label for="password" class="form-label fw-bold focus-color">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required placeholder="Enter your password">
                        </div>

                        <!-- Login Button -->
                        <div class="d-grid  ">
                            <button type="submit" class="default-btn btn text-white h-25 w-100 btn-lg">Login</button>
                        </div>
                    </form>

                    <!-- Additional Options -->
                    <div class="text-center mt-3">
                        <a href="#" class="text-decoration-none focus-color">Forgot Password?</a> | 
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- JavaScript: Smooth Splash Screen Transition -->
    <script>
        setTimeout(() => {
            document.getElementById("splashScreen").classList.add("hide");
            setTimeout(() => {
                document.getElementById("splashScreen").style.display = "none";
                document.getElementById("loginContainer").style.display = "flex";
            }, 1000); // Ensures fade-out transition before removing splash screen
        }, 3000); // Show splash for 3 seconds
    </script>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" 
            integrity="sha384-ZvpUoO/+PpL/5AptnQvJ1stFfHBV8JO/N5GA5c5V5l5IE5L1P4/6B0H5L5n5Fh5F" 
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" 
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" 
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" 
            integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" 
            crossorigin="anonymous"></script>
</body>
</html>
