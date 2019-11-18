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
  data: {};
  options: any;

 


  constructor(private updateService: UpdateService,
              private elementRef: ElementRef){
    /*this.data = {
        labels: ['January', 'February', 'March', 'April', 'May', 'June'],
        datasets: [{
          label: 'dataset - big points',
          data: [this.random(), this.random(), this.random(), this.random(), this.random(), this.random()],
          borderColor: colors.primary,
          backgroundColor: colors.primary,
          fill: false,
          borderDash: [5, 5],
          pointRadius: 8,
          pointHoverRadius: 10,
        }, {
          label: 'dataset - individual point sizes',
          data: [this.random(), this.random(), this.random(), this.random(), this.random(), this.random()],
          borderColor: colors.dangerLight,
          backgroundColor: colors.dangerLight,
          fill: false,
          borderDash: [5, 5],
          pointRadius: 8,
          pointHoverRadius: 10,
        }, {
          label: 'dataset - large pointHoverRadius',
          data: [this.random(), this.random(), this.random(), this.random(), this.random(), this.random()],
          borderColor: colors.info,
          backgroundColor: colors.info,
          fill: false,
          pointRadius: 8,
          pointHoverRadius: 10,
        }, {
          label: 'dataset - large pointHitRadius',
          data: [this.random(), this.random(), this.random(), this.random(), this.random(), this.random()],
          borderColor: colors.success,
          backgroundColor: colors.success,
          fill: false,
          pointRadius: 8,
          pointHoverRadius: 10,
        }],
      };

      this.options = {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
          position: 'bottom',
          labels: {
            fontColor: chartjs.textColor,
          },
        },
        hover: {
          mode: 'index',
        },
        scales: {
          xAxes: [
            {
              display: true,
              scaleLabel: {
                display: true,
                labelString: 'Month',
              },
              gridLines: {
                display: true,
                color: chartjs.axisLineColor,
              },
              ticks: {
                fontColor: chartjs.textColor,
              },
            },
          ],
          yAxes: [
            {
              display: true,
              scaleLabel: {
                display: true,
                labelString: 'Value',
              },
              gridLines: {
                display: true,
                color: chartjs.axisLineColor,
              },
              ticks: {
                fontColor: chartjs.textColor,
              },
            },
          ],
        },
      };*/

  }
  

  ngAfterViewInit(){
    this.elementRef.nativeElement.ownerDocument.body.style.backgroundColor = '#323639';
  }
}
