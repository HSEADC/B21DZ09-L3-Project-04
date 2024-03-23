function initOption() {
  let profileOptions = document.querySelector('.M_ProfileOptions');
  let optionsButton = document.querySelector('.A_EditButton');

  optionsButton.addEventListener('click', () => {
    profileOptions.classList.toggle('hidden');
  });
}

document.addEventListener('turbo:load', () => {
  if (document.body.id == 'profile') {
    initOption();
  }
});
