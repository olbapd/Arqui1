import { Component, AfterViewInit, ElementRef } from '@angular/core';
import { UpdateService } from './services/update.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

export class AppComponent implements AfterViewInit{
  title = 'plant-care';
  humidity=0;
  hour="";
  flow=0;

  constructor(private updateService: UpdateService,
              private elementRef: ElementRef){

  }

  ngAfterViewInit(){
    this.elementRef.nativeElement.ownerDocument.body.style.backgroundColor = '#323639';
  }

  updateHour(){
  	console.log(this.hour);
    
  }

  updateHumidity(){
    console.log("here");
  	console.log(this.humidity);
    this.updateService.led()
     .subscribe((result)=>{
         console.log(result);
     })

  }
  updateFlow(){
  	console.log(this.flow);
  }
}
