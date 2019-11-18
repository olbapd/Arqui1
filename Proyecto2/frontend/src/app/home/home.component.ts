import { Component, AfterViewInit, ElementRef } from "@angular/core";
import { UpdateService } from "../services/update.service";
import { AngularFireDatabase } from "angularfire2/database";

@Component({
  selector: "app-home",
  templateUrl: "./home.component.html",
  styleUrls: ["./home.component.scss"]
})
export class HomeComponent implements AfterViewInit {
  title = "plant-care";
  humidity = 0;
  onHour = "";
  offHour = "";
  light=false;
  flow = 0;
  data: {};
  options: any;

  single: any[];
  multi: any = [
    {
      name: "Humidity",
      series: [
        {
          name: "2009",
          value: 7870000
        },
        {
          name: "2010",
          value: 7300000
        },
        {
          name: "2011",
          value: 8270000
        }
      ]
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
    private elementRef: ElementRef,
  ) {}

  ngAfterViewInit() {
    this.elementRef.nativeElement.ownerDocument.body.style.backgroundColor =
      "#323639";
  }

  updateHour(type) {

    if(type==1 && this.onHour !=""){
      this.updateService.sendHour({isOn:true, hour: this.onHour})
        .subscribe(result =>{
          console.log(result);
        })
    }
    else if(type==2 && this.offHour !=""){
      this.updateService.sendHour({isOn:false, hour: this.offHour})
        .subscribe(result =>{
          console.log(result);
        })
    }

  }

  updateLights(){
    this.updateService.led()
      .subscribe(result =>{
        console.log(result);
      })
  }

  updateHumidity() {
    this.updateService.sendHumidity({humedad: this.humidity}).subscribe(result => {
      console.log(result);
    });
  }

  updateFlow() {
    this.updateService.sendFlow({flujo: this.flow}).subscribe(result => {
      console.log(result);
    });
  }

  addToGraph(dateCreated, value ){
    this.multi.series.push({name: dateCreated, value: value});
  }

  //Funcion que llama el boton. Node debe devolver lo siguiente  { date: "XX/XX/XX", value: xxx}
  //Los services estan en update.services si ocupa cambiar el endpoint
  clicked(){
    this.updateService.getHumidity()
      .subscribe(result =>{
        this.addToGraph(result.date, result.vallue);
      })
  }
}
