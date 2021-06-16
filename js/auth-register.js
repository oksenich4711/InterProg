var $password = $("#password");
var $confirmPassword = $("#confirm_password");

$("form span").hide();

function isPasswordValid() {
  return $password.val().length > 8;
}

function canSubmit() {
  return isPasswordValid();
}

function passwordEvent() {
  if (isPasswordValid()) {
    $password.next().hide();
  } else {
    $password.next().show();
  }
}

function enableSubmitEvent() {
  $("#submit").prop("disabled", !canSubmit());
}

$password.focus(passwordEvent).keyup(passwordEvent).keyup(enableSubmitEvent);

$confirmPassword.keyup(enableSubmitEvent);

enableSubmitEvent();
