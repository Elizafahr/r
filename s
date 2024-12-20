<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Регистрация</title>
    <link rel="stylesheet" href="bootstrap-5.0.2-dist/bootstrap-5.0.2-dist/css/bootstrap.min.css">
</head>
<body>
    <form class="needs-validation" novalidate id="form">
        <div class="form-group">
            <label for="phone">Телефон</label>
            <input type="tel" class="form-control" id="phone" name="phone" placeholder="+7 (999) 999-99-99" required>
            <div class="invalid-feedback">Пожалуйста, введите корректный номер телефона.</div>
        </div>

        <div class="form-group">
            <label for="login">Логин</label>
            <input type="text" class="form-control" id="login" name="login" required>
            <div class="invalid-feedback">Пожалуйста, введите логин.</div>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
            <div class="invalid-feedback">Пожалуйста, введите корректный email.</div>
        </div>

        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password" class="form-control" id="password" name="password" required>
            <div class="invalid-feedback">Пожалуйста, введите пароль.</div>
        </div>

        <button type="submit" class="btn btn-primary">Зарегистрироваться</button>
    </form>

    <script src="bootstrap-5.0.2-dist/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
    <script>
        (function () {
            'use strict'

            var forms = document.querySelectorAll('.needs-validation')

            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }

                        form.classList.add('was-validated')
                    }, false)
                })
        })()

        function validatePhone(phone) {
            var phonePattern = /^\+7?[\s.-]?(\(?\d{3}\)?[\s.-]?)*\d{3}([\s.-]?\d{2}){2}$/;
            return phonePattern.test(phone);
        }

        function validateEmail(email) {
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailPattern.test(email);
        }

        function validatePassword(password) {
            var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
            return passwordPattern.test(password);
        }

        function validateLogin(login) {

            var loginPattern = /^[а-яё\s]+$/i;
            return loginPattern.test(login);
        }

        document.getElementById('form').addEventListener('submit', function (e) {
            e.preventDefault();

            var phone = document.getElementById('phone').value;
            var login = document.getElementById('login').value;
            var email = document.getElementById('email').value;
            var password = document.getElementById('password').value;

            // Проверка номера телефона
            if (!validatePhone(phone)) {
                alert('Пожалуйста, введите корректный номер телефона');
                return;
            }

            // Проверка логина
            if (!validateLogin(login)) {
                alert('Логин должен содержать только русские буквы и пробелы');
                return;
            }
            if (login.length < 3 || login.length > 20) {
                alert('Логин должен содержать от 3 до 20 символов');
                return;
            }


            // Проверка email
            if (!validateEmail(email)) {
                alert('Пожалуйста, введите корректный email');
                return;
            }

            // Проверка пароля
            if (!validatePassword(password)) {
                alert('Пароль должен содержать минимум 8 символов, включая буквы и цифры');
                return;
            }

            console.log('Форма прошла валидацию. Данные:', 
                phone,
                login,
                email,
                password
            );
        })

        // document.getElementById('login').addEventListener('input', function() {
        //     this.value = this.value.replace(/[^а-яё\s]/gi, '');
        // });
    </script>
</body>
</html>
