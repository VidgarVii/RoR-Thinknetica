document.addEventListener "turbolinks:load", ->

  signupForm = document.getElementById('new_user')
  passwordConfirmation = document.getElementById('user_password_confirmation')
  password = document.getElementById('user_password')
  submit = signupForm.getElementsByClassName('btn')[0]

  passwordIncorrect = () ->
    password.classList.add('error')
    password.onkeyup = () ->
      if password.value.length >= 6
        password.classList.remove('error')


  passwordValidate = () ->
    passwordConfirmation.onkeyup = () ->
      if password.value.length < 6 then passwordIncorrect()
      if (this.value == password.value && password.value.length >= 6)
        submit.disabled = false
      else
        submit.disabled = true


  if (signupForm && passwordConfirmation) then passwordValidate()