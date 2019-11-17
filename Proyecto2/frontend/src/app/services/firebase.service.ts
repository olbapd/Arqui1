import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AngularFireDatabase } from 'angularfire2/database';

@Injectable()
export class FirebaseService {

	constructor(private db: AngularFireDatabase){}


	test(){
		console.log(this.db.list('/'));
		console.log("asdfasdf");
	  /*return this.db.collection('users').add({
	    name: value.name,
	    nameToSearch: value.name.toLowerCase(),
	    surname: value.surname,
	    age: parseInt(value.age),
	    avatar: avatar
	  });*/
	}

}