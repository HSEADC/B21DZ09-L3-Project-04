function gallerySlide() {
  let buttonNext = document.querySelector('.next');
  let buttonBack = document.querySelector('.back');
  let galleryRail = document.querySelector('.gallery_rail');
  let counter = document.querySelector('.counter_p');
  let slide = document.querySelector('.gallery_slide');
  let length = document.querySelectorAll('.gallery_slide').length - 1;
  let width = parseInt(getComputedStyle(slide).width);
  let progress = document.querySelector('.current_progress_line');
  const galleryData = {
    currentSlide: 0,
  };

  buttonNext.addEventListener('click', () => {
    let { currentSlide } = galleryData;
    if (currentSlide < length) {
      currentSlide++;
      galleryRail.style.transform =
        'translateX(-' + currentSlide * width + 'px)';
      galleryData.currentSlide = currentSlide;
    } else {
      currentSlide = 0;
      galleryRail.style.transform = 'translateX(0px)';
      galleryData.currentSlide = currentSlide;
    }

    let counterText = currentSlide + 1;
    counter.innerText = '' + counterText + '';
    progress.style.width = '' + counterText * 33.4 + '%';
  });

  buttonBack.addEventListener('click', () => {
    let { currentSlide } = galleryData;
    if (currentSlide > 0) {
      currentSlide--;
      galleryRail.style.transform =
        'translateX(+' + currentSlide * width + 'px)';
      galleryData.currentSlide = currentSlide;
      console.log(currentSlide);
    }

    let counterText = currentSlide + 1;
    counter.innerText = '' + counterText + '';
    progress.style.width = '' + counterText * 33.4 + '%';
  });
}

document.addEventListener('DOMContentLoaded', () => {
  if (document.body.id == 'main') {
    gallerySlide();
  }
});
