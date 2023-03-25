function fn() {   

 var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; // a custom 'intelligent' default
  }

  var config = { // base config JSON
		baseUrl: 'http://localhost:3000',
		constant: karate.callSingle('classpath:features/constants.js')
	};
  if(env == 'dev'){
  	config.baseUrl = 'http://localhost:3000'
  }else if(env == 'stg'){
  	config.baseUrl = 'http://localhost.stg:3000'
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  karate.configure('retry',{count: 3, interval: 2000 });
  return config;
}