var lang = "JavaScript";

function myFunction(lang) {
	this.lang = lang;
	console.log("Hello, Welcome to "+this.lang);
};
var Test = new myFunction(lang)