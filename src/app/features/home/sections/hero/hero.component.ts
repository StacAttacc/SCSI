import { Component } from '@angular/core';
import { TranslocoModule } from '@jsverse/transloco';

@Component({
  selector: 'app-hero',
  imports: [TranslocoModule],
  templateUrl: './hero.component.html',
})
export class HeroComponent {}
