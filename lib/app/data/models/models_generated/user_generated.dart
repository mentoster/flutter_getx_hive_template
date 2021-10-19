class UserGenerated {
	String? name;
	String? address;
	double? latitude;
	double? longitude;
	String? maidenName;
	String? birthData;
	String? phoneH;
	String? phoneW;
	String? emailU;
	String? emailD;
	String? username;
	String? password;
	String? domain;
	String? useragent;
	String? ipv4;
	String? macaddress;
	String? plasticcard;
	String? cardexpir;
	int? bonus;
	String? company;
	String? color;
	String? uuid;
	int? height;
	double? weight;
	String? blood;
	String? eye;
	String? hair;
	String? pict;
	String? url;
	String? sport;
	String? ipv4Url;
	String? emailUrl;
	String? domainUrl;

	UserGenerated({
		this.name, 
		this.address, 
		this.latitude, 
		this.longitude, 
		this.maidenName, 
		this.birthData, 
		this.phoneH, 
		this.phoneW, 
		this.emailU, 
		this.emailD, 
		this.username, 
		this.password, 
		this.domain, 
		this.useragent, 
		this.ipv4, 
		this.macaddress, 
		this.plasticcard, 
		this.cardexpir, 
		this.bonus, 
		this.company, 
		this.color, 
		this.uuid, 
		this.height, 
		this.weight, 
		this.blood, 
		this.eye, 
		this.hair, 
		this.pict, 
		this.url, 
		this.sport, 
		this.ipv4Url, 
		this.emailUrl, 
		this.domainUrl, 
	});

	@override
	String toString() {
		return 'UserGenerated(name: $name, address: $address, latitude: $latitude, longitude: $longitude, maidenName: $maidenName, birthData: $birthData, phoneH: $phoneH, phoneW: $phoneW, emailU: $emailU, emailD: $emailD, username: $username, password: $password, domain: $domain, useragent: $useragent, ipv4: $ipv4, macaddress: $macaddress, plasticcard: $plasticcard, cardexpir: $cardexpir, bonus: $bonus, company: $company, color: $color, uuid: $uuid, height: $height, weight: $weight, blood: $blood, eye: $eye, hair: $hair, pict: $pict, url: $url, sport: $sport, ipv4Url: $ipv4Url, emailUrl: $emailUrl, domainUrl: $domainUrl)';
	}

	factory UserGenerated.fromJson(Map<String, dynamic> json) => UserGenerated(
				name: json['name'] as String?,
				address: json['address'] as String?,
				latitude: (json['latitude'] as num?)?.toDouble(),
				longitude: (json['longitude'] as num?)?.toDouble(),
				maidenName: json['maiden_name'] as String?,
				birthData: json['birth_data'] as String?,
				phoneH: json['phone_h'] as String?,
				phoneW: json['phone_w'] as String?,
				emailU: json['email_u'] as String?,
				emailD: json['email_d'] as String?,
				username: json['username'] as String?,
				password: json['password'] as String?,
				domain: json['domain'] as String?,
				useragent: json['useragent'] as String?,
				ipv4: json['ipv4'] as String?,
				macaddress: json['macaddress'] as String?,
				plasticcard: json['plasticcard'] as String?,
				cardexpir: json['cardexpir'] as String?,
				bonus: json['bonus'] as int?,
				company: json['company'] as String?,
				color: json['color'] as String?,
				uuid: json['uuid'] as String?,
				height: json['height'] as int?,
				weight: (json['weight'] as num?)?.toDouble(),
				blood: json['blood'] as String?,
				eye: json['eye'] as String?,
				hair: json['hair'] as String?,
				pict: json['pict'] as String?,
				url: json['url'] as String?,
				sport: json['sport'] as String?,
				ipv4Url: json['ipv4_url'] as String?,
				emailUrl: json['email_url'] as String?,
				domainUrl: json['domain_url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'address': address,
				'latitude': latitude,
				'longitude': longitude,
				'maiden_name': maidenName,
				'birth_data': birthData,
				'phone_h': phoneH,
				'phone_w': phoneW,
				'email_u': emailU,
				'email_d': emailD,
				'username': username,
				'password': password,
				'domain': domain,
				'useragent': useragent,
				'ipv4': ipv4,
				'macaddress': macaddress,
				'plasticcard': plasticcard,
				'cardexpir': cardexpir,
				'bonus': bonus,
				'company': company,
				'color': color,
				'uuid': uuid,
				'height': height,
				'weight': weight,
				'blood': blood,
				'eye': eye,
				'hair': hair,
				'pict': pict,
				'url': url,
				'sport': sport,
				'ipv4_url': ipv4Url,
				'email_url': emailUrl,
				'domain_url': domainUrl,
			};
}
