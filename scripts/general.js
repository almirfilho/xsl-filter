function loadXMLDoc(dname){

	if (window.XMLHttpRequest){
		xhttp=new XMLHttpRequest();
	} else {
  		xhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}

	xhttp.open("GET",dname,false);
	xhttp.send("");
	return xhttp.responseXML;
}

function loadXSL( xslPath ){

	xml=loadXMLDoc("brasil.xml");
	xsl=loadXMLDoc(xslPath);
	
	// code for Mozilla, Firefox, Opera, etc.
	if (document.implementation && document.implementation.createDocument){
		xsltProcessor=new XSLTProcessor();
		xsltProcessor.importStylesheet(xsl);
		resultDocument = xsltProcessor.transformToFragment(xml,document);
		return resultDocument;
	}
}