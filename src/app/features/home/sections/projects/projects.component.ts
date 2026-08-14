import { Component } from '@angular/core';
import { TranslocoModule } from '@jsverse/transloco';

@Component({
  selector: 'app-projects',
  imports: [TranslocoModule],
  templateUrl: './projects.component.html',
})
export class ProjectsComponent {
  readonly projects = [
    {
      titleKey: 'projects.openPayrun.title',
      descriptionKey: 'projects.openPayrun.description',
      ctaKey: 'projects.openPayrun.cta',
      url: 'https://open-payrun.vercel.app',
    },
  ];
}
