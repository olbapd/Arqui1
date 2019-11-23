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
  xAxisLabel = "Minute";
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
    console.log(this.onHour);
    console.log(this.offHour);
    let e =  this.onHour.toString().split(":");
    let e2= e[1].split(" ");
    console.log(e[0]+":"+e2[0]);
    let a =  this.offHour.toString().split(":");
    let a2= a[1].split(" ");
    
      const body = {"option":"auto", "hourOn":e[0], "hourOff":a[0],"minuteOn":e2[0],"minuteOff":a2[0]};
      console.log(body);
      this.updateService.sendHour(body).subscribe(result => {
        console.log(result);
      });
    
   
    
  }

  updateHumidity() {
    this.updateService.sendHumidity(this.humidity.toString()).subscribe(result => {
      console.log(result);
    });
  }
  updateFlow() {
    var body = {"option":"amout","value":this.flow.toString()};
    this.updateService.sendFlow(body).subscribe(result => {
      console.log(result);
    });
  }
  updateLights(){
    const body ={"option":"manual" , "action":this.light.toString()}
    console.log(this.light.toString());
    this.updateService.led(body)
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
