import { Component, AfterViewInit, ElementRef } from "@angular/core";
import { UpdateService } from "../services/update.service";
import { FirebaseService } from "../services/firebase.service";
import { AngularFireDatabase } from "angularfire2/database";

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
    private firebaseService: FirebaseService,
    private elementRef: ElementRef,
  ) {}

  ngAfterViewInit() {
    this.elementRef.nativeElement.ownerDocument.body.style.backgroundColor =
      "#323639";
  }

  updateHour() {
    console.log(this.hour);
  }

  updateHumidity() {
    this.updateService.led().subscribe(result => {
      console.log(result);
    });
  }
  updateFlow() {
    console.log(this.flow);
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
