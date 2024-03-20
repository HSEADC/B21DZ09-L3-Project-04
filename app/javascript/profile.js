function initOption() {
  let profileOptions = document.querySelector('.M_ProfileOptions');
  let optionsButton = document.querySelector('.A_EditButton');

  optionsButton.addEventListener('click', () => {
    profileOptions.classList.toggle('hidden');
  });
}

document.addEventListener('DOMContentLoaded', () => {
  if (document.body.id == 'profile') {
    initOption();
  }
});
