function initComments() {
  let answers = document.querySelectorAll('.O_AnswerReelsCard');

  for (let i = 0; i < answers.length; i++) {
    const answer = answers[i];
    console.log(answer);
    initComment(answer);
  }
}

function initComment(answer) {
  let commentBlock = answer.querySelector('.O_Comments');
  let openButton = answer.querySelector('.A_ButtonsTape .comment');
  let closeButton = answer.querySelector('.A_Close');

  openButton.addEventListener('click', () => openComment(commentBlock));
  closeButton.addEventListener('click', () => closeComment(commentBlock));
}

function openComment(commentBlock) {
  commentBlock.classList.toggle('active');
}

function closeComment(commentBlock) {
  commentBlock.classList.remove('active');
}

document.addEventListener('DOMContentLoaded', () => {
  if (document.body.id == 'reels') {
    initComments();
  }
});
