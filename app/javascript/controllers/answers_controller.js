import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="answers"
export default class extends Controller {
  static targets = ['nextButton'];

  initialize() {
    console.log('initialize');
  }

  connect() {
    console.log('connect', this.nextButtonTarget);

    this.viewportHeight = window.innerHeight;

    document.addEventListener('scroll', () => {
      this.onScroll();
    });
  }

  onScroll() {
    console.log(
      'scroll',
      this.viewportHeight,
      this.nextButtonTarget.getBoundingClientRect().top
    );

    if (
      this.viewportHeight >= this.nextButtonTarget.getBoundingClientRect().top
    ) {
      console.log('trigger next page');
      this.nextButtonTarget.click().remove();
    }
  }
}
