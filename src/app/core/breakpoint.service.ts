import { Injectable, signal } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class BreakpointService {
  readonly isSmall = signal(false);

  constructor() {
    const mql = window.matchMedia('(max-width: 767px)');
    this.isSmall.set(mql.matches);
    mql.addEventListener('change', (e) => this.isSmall.set(e.matches));
  }
}
