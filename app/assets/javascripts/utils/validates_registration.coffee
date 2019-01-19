document.addEventListener "turbolinks:load", ->

  signupForm = document.getElementById('new_user')
  passwordConfirmation = document.getElementById('user_password_confirmation')
  password = document.getElementById('user_password')
  email = document.getElementById('user_email')
  if (signupForm) then submit = signupForm.getElementsByClassName('btn')[0]

  checker =
    email: false
    password: false
    passwordConfirm: false

# Валидаторы формы

  passwordValidate = () ->
    if (password.value.length >= 6)
      password.classList.remove('error')
      checker.password = true
    else
      checker.password = false
    submitInclude() # Чтоб автоматически отключать сабмит, вызов должен быть в конце функции


  passwordConfirmValidate = () ->
    if (password.value.length < 6)
      password.classList.add('error')
      return passwordValidate()
    if (passwordConfirmation.value == password.value)
      checker.passwordConfirm = true
      password.classList.add('success')
      passwordConfirmation.classList.add('success')
    else
      checker.passwordConfirm = false
      password.classList.remove('success')
      passwordConfirmation.classList.remove('success')
    submitInclude()


  emailValidate = () ->
    if (email.value.match(/.+@.+\..+/i))
      checker.email = true
      email.classList.add('success')
    else
      checker.email = false
      email.classList.remove('success')
    submitInclude()

# Вкл/Откл сабмит

  submitInclude = () ->
    submit.disabled = !(checker.email && checker.password && checker.passwordConfirm)

# Включаем events

  if (signupForm && passwordConfirmation)
    passwordConfirmation.onkeyup = () ->
      passwordConfirmValidate()
    password.onkeyup = () ->
      passwordValidate()
    email.onkeyup = () ->
      emailValidate()
