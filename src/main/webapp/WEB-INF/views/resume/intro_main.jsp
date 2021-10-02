<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/styles.css" />
    <script src="https://kit.fontawesome.com/e3bdd8104f.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Document</title>
</head>

<body>
    <section class="self-section">
        <div class="self-button">
            <button class="introButton b1">
            <div class="card-button">
                <div class="card-button-header">
                    <i class="fas fa-edit button-icon"></i>
                </div>
                <div class="card-button-body">
                    <span>자기소개서 작성</span>
                    
                </div>
            </div>
            </button>
            <button class="b1">
                <div class="card-button">
                    <div class="card-button-header">
                        <i class="fas fa-address-card button-icon"></i>
                    </div>
                    <div class="card-button-body">
                        <span>이력서 작성</span>
                        
                    </div>
                </div>
                </button>
            <button class="b1">
                    <div class="card-button">
                        <div class="card-button-header">
                            <i class="fas fa-user-edit button-icon" ></i>
                        </div>
                        <div class="card-button-body">
                            <span>
                            자기소개서 <br/>
                            이력서 관리
                            </span>
                            
                        </div>
                    </div>
                    </button>

        </div>
    </section>
</body>
<script>
    document.querySelector('.b1').addEventListener('click', () => {
        alert('눌림');
    });
    // document.querySelector('.introButton').addEventListener('click',()=>{
    //     $.ajax({
    //         url : 
    //     })
    // })

</script>

</html>