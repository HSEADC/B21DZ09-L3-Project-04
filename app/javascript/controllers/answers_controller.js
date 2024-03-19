import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['nextButton'];

  initialize() {
    this.element.addEventListener('turbo:before-fetch-response', (event) => {
      const response = event.detail.fetchResponse.response;
      if (response.status == '200' && response.url.includes('login')) {
        location.reload();
      }
    });
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
