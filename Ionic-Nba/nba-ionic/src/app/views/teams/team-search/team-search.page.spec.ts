import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { TeamSearchPage } from './team-search.page';

describe('TeamSearchPage', () => {
  let component: TeamSearchPage;
  let fixture: ComponentFixture<TeamSearchPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TeamSearchPage ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(TeamSearchPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
