function initComments() {
  let answers = document.querySelectorAll('.O_AnswerReelsCard');

  for (let i = 0; i < answers.length; i++) {
    const answer = answers[i];
    initComment(answer);
  }
}

function initComment(answer) {
  let commentBlock = answer.querySelector('.O_Comments');
  let answerOptions = answer.querySelector('.M_AnswerOptions');
  let openButton = answer.querySelector('.A_ButtonsTape .comment');
  let closeButton = answer.querySelector('.A_Close');
  let answerOptionButton = answer.querySelector('.A_ButtonMore');

  openButton.addEventListener('click', () => openComment(commentBlock));
  closeButton.addEventListener('click', () => closeComment(commentBlock));
  answerOptionButton.addEventListener('click', () =>
    openAnswerOptions(answerOptions)
  );

  let comments = commentBlock.querySelectorAll('.W_Comment');

  for (let i = 0; i < comments.length; i++) {
    const comment = comments[i];
    initCommentOptions(comment);
  }
}

function openComment(commentBlock) {
  commentBlock.classList.toggle('active');
}

function openAnswerOptions(answerOptions) {
  answerOptions.classList.toggle('hidden');
}

function closeComment(commentBlock) {
  commentBlock.classList.remove('active');
}

function initCommentOptions(comment) {
  let commentOptionButton = comment.querySelector('.A_CommentMoreButton');
  let commentOptions = comment.querySelector('.M_CommentOptions');

  commentOptionButton.addEventListener('click', () =>
    openCommentOptions(commentOptions)
  );
}

function openCommentOptions(commentOptions) {
  commentOptions.classList.toggle('hidden');
}

document.addEventListener('DOMContentLoaded', () => {
  if (document.body.id == 'reels') {
    initComments();
  }
});
