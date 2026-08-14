import { Component } from '@angular/core';
import { HeroComponent } from './sections/hero/hero.component';
import { WhyComponent } from './sections/why/why.component';
import { ServicesComponent } from './sections/services/services.component';
import { ContactComponent } from './sections/contact/contact.component';

@Component({
  selector: 'app-home',
  imports: [HeroComponent, WhyComponent, ServicesComponent, ContactComponent],
  templateUrl: './home.component.html',
})
export class HomeComponent {}
