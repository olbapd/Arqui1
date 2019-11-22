import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable()
export class UpdateService {
	headers : {headers : HttpHeaders}
	baseUrl = 'http://localhost:3000/api/';

	constructor(private http: HttpClient){}

	public led(body):Observable<any>{
		const url = this.baseUrl+'hour';
		return this.http.post<any>(url,body,this.headers);
	}

	public sendHumidity(msj) : Observable<any>{
		const url= this.baseUrl+'humidity';
		const body = {
			"value":msj
		};
		return this.http.post<any>(url,body, this.headers);
	}

	public getHumidity() : Observable<any>{
		const url= this.baseUrl+'humidity';
		return this.http.get<any>(url, this.headers);
	}

	public sendFlow(body) : Observable<any>{
		const url= this.baseUrl+'flow';
		return this.http.post<any>(url,body, this.headers);
	}

	public getFlow() : Observable<any>{
		const url= this.baseUrl+'flow';
		return this.http.get<any>(url, this.headers);
	}

	public sendHour(body) : Observable<any>{
		const url= this.baseUrl+'hour';
		return this.http.post<any>(url,body, this.headers);
	}


}