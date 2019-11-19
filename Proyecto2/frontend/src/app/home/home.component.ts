import { Component, AfterViewInit, ElementRef } from "@angular/core";
import { UpdateService } from "../services/update.service";
import { FirebaseService } from "../services/firebase.service";
import { AngularFireDatabase } from "angularfire2/database";
import { ChartDataModel} from '../interfaces/charmodel'

@Component({
  selector: "app-home",
  templateUrl: "./home.component.html",
  styleUrls: ["./home.component.scss"]
})
export class HomeComponent implements AfterViewInit {
  title = "plant-care";
  humidity = 0;
  hour = "";
  flow = 0;
  light=false;
  options: any;
  onHour = "";
  offHour = "";

  single: any[];
  multi: any =  [
      {
        name: 'Humidity',
        series: []
      }
  ];
  view: any[] = [700, 400];

  // options
  showXAxis = true;
  showYAxis = true;
  gradient = false;
  showLegend = true;
  showXAxisLabel = true;
  xAxisLabel = "Date";
  showYAxisLabel = true;
  yAxisLabel = "Values";

  colorScheme = {
    domain: ["#5AA454", "#A10A28", "#C7B42C", "#AAAAAA"]
  };

  // line, area
  autoScale = true;

  constructor(
    private updateService: UpdateService,
    private firebaseService: FirebaseService,
    private elementRef: ElementRef,
  ) {}

  ngAfterViewInit() {
    this.elementRef.nativeElement.ownerDocument.body.style.backgroundColor =
      "#323639";
  }

  updateHour(num) {
    if(num==1 && this.onHour !=""){
      console.log(this.hour);
      this.updateService.sendHour("E"+this.hour.toString()).subscribe(result => {
        console.log(result);
      });
    }
    else if(num==2 && this.offHour !=""){
      console.log(this.hour);
      this.updateService.sendHour("A"+this.hour.toString()).subscribe(result => {
        console.log(result);
      });
    }
  }

  updateHumidity() {
    this.updateService.sendHumidity(this.humidity.toString()).subscribe(result => {
      console.log(result);
    });
  }
  updateFlow() {
    this.updateService.sendFlow(this.flow.toString()).subscribe(result => {
      console.log(result);
    });
  }
  updateLights(){
    this.updateService.led({"vallue": this.light })
      .subscribe(result =>{
        console.log(result);
      })
  }

  // addToGraph(dateCreated, value ){
  //   console.log(this.series);
  //   this.series.push({name: dateCreated, value: value});
  //   this.multi[0] =  {
  //       name: "Humidity",
  //       series: this.series
  //     }
  //     console.log(this.multi);
  // }

  //Funcion que llama el boton. Node debe devolver lo siguiente  { date: "XX/XX/XX", value: xxx}
  //Los services estan en update.services si ocupa cambiar el endpoint
  clicked(){
    this.updateService.getHumidity()
      .subscribe(result =>{
        //this.addToGraph(result.date.toString(), Number(result.value));
        this.multi[0].series.push({name: result.date.toString(), value:  Number(result.value)});
        console.log(this.multi);
        this.multi = [...this.multi]
      });
  }
}
