document.addEventListener('DOMContentLoaded', function() {
    const passwordField = document.querySelector('#user_password');
    const enablebutton = document.querySelector('#enable');
    const passwordStrength = document.querySelector('#passwordHelpInline');
    const passwordConfirmation = document.querySelector('#user_password_confirmation');

    passwordField.addEventListener('input', function() {
      const password = this.value;
      const actions = [];

      // Verificar la fortaleza de la contraseña
      if (password.length < 8) {
        actions.push("Utilizar al menos 8 caracteres.");
      }
      if (!/[A-Z]/.test(password)) {
        actions.push("Utilizar al menos una mayúscula.");
      }
      if (!/[a-z]/.test(password)) {
        actions.push("Utilizar al menos una minúscula.");
      }
      if (!/[^a-zA-Z\d]/.test(password)) {
        actions.push("Utilizar al menos un carácter especial (que no sea letra ni número).");
      }
      // Validación para evitar números consecutivos
      if (/(\d)\1\1|012|123|234|345|456|567|678|789|890|901|098|987|876|765|654|543|432|321|210|109/.test(password)) {
          actions.push("No permitir números consecutivos.");
      }

      // Validación para evitar letras consecutivas
      if (/(abc|bcd|cde|def|efg|fgh|ghi|hij|ijk|jkl|klm|lmn|mno|nop|opq|pqr|qrs|rst|stu|tuv|uvw|vwx|wxy|xyz|ABC|BCD|CDE|DEF|EFG|FGH|GHI|HIJ|IJK|JKL|KLM|LMN|MNO|NOP|OPQ|PQR|QRS|RST|STU|TUV|UVW|VWX|WXY|XYZ)/.test(password)) {
          actions.push("No permitir letras consecutivas.");
      }

      if (password != passwordConfirmation.value) {
        actions.push("Las contraseñas deben coincidir");
      }

      // Mostrar las acciones que faltan realizar en la contraseña
      if (actions.length > 0) {
        passwordStrength.innerHTML = actions.map(action => `<p class="text-danger">${action}</p>`).join('');
        enablebutton.disabled = true;

      } else {
        enablebutton.disabled = false;
        passwordStrength.innerHTML = '';
      }
    });
  });