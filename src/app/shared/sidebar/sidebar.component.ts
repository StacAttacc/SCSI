import { Component, inject } from '@angular/core';
import { TranslocoService } from '@jsverse/transloco';
import { SidebarService } from '../../core/sidebar.service';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
})
export class SidebarComponent {
  private transloco = inject(TranslocoService);
  protected sidebar = inject(SidebarService);

  get activeLang() {
    return this.transloco.getActiveLang();
  }

  setLang(lang: string) {
    this.transloco.setActiveLang(lang);
    this.sidebar.close();
  }
}
