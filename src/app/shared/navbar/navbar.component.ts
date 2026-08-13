import { Component, inject } from '@angular/core';
import { TranslocoService } from '@jsverse/transloco';
import { BreakpointService } from '../../core/breakpoint.service';
import { SidebarService } from '../../core/sidebar.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
})
export class NavbarComponent {
  private transloco = inject(TranslocoService);
  protected breakpoint = inject(BreakpointService);
  protected sidebar = inject(SidebarService);

  get activeLang() {
    return this.transloco.getActiveLang();
  }

  setLang(lang: string) {
    this.transloco.setActiveLang(lang);
  }
}
