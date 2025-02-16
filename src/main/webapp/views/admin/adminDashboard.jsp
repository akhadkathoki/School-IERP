<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .card {
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .announcement-card {
            background-color: #2c2c5e;
            color: white;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container mt-4">
        <h2 class="fw-bold">Welcome <span class="text-primary">Admin</span></h2>
        
        <div class="row my-4">
            <div class="col-md-3">
                <div class="card bg-success text-white text-center p-3">
                    <h5>Students</h5>
                    <h3>1043</h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card bg-warning text-white text-center p-3">
                    <h5>Teachers</h5>
                    <h3>66%</h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card bg-primary text-white text-center p-3">
                    <h5>Parents</h5>
                    <h3>15</h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card bg-dark text-white text-center p-3">
                    <h5>Holidays</h5>
                    <h3>05</h3>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6">
                <div class="card p-3 mb-3">
                    <h5>Ruchi Pathak (Child 1)</h5>
                    <div class="d-flex align-items-center">
                        <img src="avatar_female.png" width="80" class="rounded-circle me-3">
                        <div>
                            <p><strong>Student No.:</strong> 22SOECE11630</p>
                            <p><strong>Name:</strong> Ruchi Pathak</p>
                            <p><strong>Gender:</strong> Female</p>
                            <p><strong>Class:</strong> 7</p>
                            <p><strong>Section:</strong> A</p>
                            <p><strong>Roll No.:</strong> 47</p>
                        </div>
                    </div>
                    <button class="btn btn-dark">Edit</button>
                </div>
                
                <div class="card p-3">
                    <h5>Roshan Pathak (Child 2)</h5>
                    <div class="d-flex align-items-center">
                        <img src="avatar_male.png" width="80" class="rounded-circle me-3">
                        <div>
                            <p><strong>Student No.:</strong> 22SOECE11620</p>
                            <p><strong>Name:</strong> Roshan Pathak</p>
                            <p><strong>Gender:</strong> Male</p>
                            <p><strong>Class:</strong> 8</p>
                            <p><strong>Section:</strong> 9</p>
                            <p><strong>Roll No.:</strong> 28</p>
                        </div>
                    </div>
                    <button class="btn btn-dark">Edit</button>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="card p-3">
                    <h5>Announcements</h5>
                    <div class="announcement-card">
                        <h6>Annual Function</h6>
                        <p><strong>10/02/2025</strong></p>
                        <p>Dear Parents, From 10-02-2025 we are having our annual function of 2025 so we invite you on this auspicious occasion lighten the program by your presence and to see the children smiling and enjoying.</p>
                        <strong>Hope to see you there!</strong>
                    </div>
                    <div class="announcement-card">
                        <h6>Annual Function</h6>
                        <p><strong>10/02/2025</strong></p>
                        <p>Dear Parents, From 10-02-2025 we are having our annual function of 2025 so we invite you on this auspicious occasion lighten the program by your presence and to see the children smiling and enjoying.</p>
                        <strong>Hope to see you there!</strong>
                    </div>
                    <button class="btn btn-primary">View More</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
