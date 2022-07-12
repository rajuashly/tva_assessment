

function ClearSignature() {
    try {
        var sigCtl = document.getElementById("sigCtl1");
        sigCtl.Signature.Clear();
    }
    catch(ex) {
        Exception("ClearSignature() error: " + ex.message);
    }
}


function AboutBox() {
    try {
        var sigCtl = document.getElementById("sigCtl1");
        sigCtl.AboutBox();
    }
    catch(ex) {
        Exception("About() error: " + ex.message);
    }
}

function Exception(txt) {
    print("Exception: " + txt);
}


function print(txt) {
    var txtDisplay = document.getElementById("txtDisplay");
    if(txt == "CLEAR" )
        txtDisplay.value = "";
    else {
        txtDisplay.value += txt + "\n";
        txtDisplay.scrollTop = txtDisplay.scrollHeight; // scroll to end
    }
}

$(document).ready(function (){
    try {
        print("CLEAR");
        var sigCtl = document.getElementById("sigCtl1");
        sigCtl.SetProperty("Licence", "eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJMTVMiLCJleHAiOjE1NjE5ODQwNDksImlhdCI6MTU1NDEyMTY0OSwicmlnaHRzIjpbIlNJR19TREtfQ09SRSIsIlRPVUNIX1NJR05BVFVSRV9FTkFCTEVEIiwiU0lHQ0FQVFhfQUNDRVNTIiwiU0lHX1NES19JU08iLCJTSUdfU0RLX0VOQ1JZUFRJT04iXSwiZGV2aWNlcyI6W10sInR5cGUiOiJldmFsIiwibGljX25hbWUiOiJXSUxMX1NES19mb3Jfc2lnbmF0dXJlIiwid2Fjb21faWQiOiJmN2E3NTk4ZmNlMjM0MWRlODkwZjM1MTRlNTViZjE0YiIsImxpY191aWQiOiJhYzJjZmMwYy02MDgyLTRmYjAtOGQ0Ni1mYjY3NjlmZDQ4NTYiLCJhcHBzX3dpbmRvd3MiOltdLCJhcHBzX2lvcyI6W10sImFwcHNfYW5kcm9pZCI6W10sIm1hY2hpbmVfaWRzIjpbXX0.DRWkfA5lQ5zMz-GH-JPE5F4ipkn36mSq3Rc44rdGw63_Y9p2MxAPNknK4DYhM3pMUmHJtjjd7nyo3ZRl7CjcLIWWQqCDLmOcu8u0ifPQlprnCAlXKlG1zIHimc4A6h6Y0_-S3hHTqToOb-lFesN2YCITbjWMB4DDUPGwJQXJmVIav1gpuisJmJ8niKbq_1LEwaP4MNTMQ9QmLoob3IwtcXqvcet36zxP1Asneu8DATEzAWquwzQwhWZ0JgebXQNM5p5tnD38qYLPalKc5p8tm1cmL-5uND2GfA-Ur4AG5rQC-HxVJkCAXihvAiFM9nRdJVihdbWSSSIPDEVmBx0KPg");
        sigCtl.BackStyle = 1;
        sigCtl.DisplayMode=0; // fit signature to control
        print("Checking components...");
        var sigcapt = new ActiveXObject('Florentis.DynamicCapture');  // force 'can't create object' error if components not yet installed
        var lic = new ActiveXObject("Wacom.Signature.Licence");
        //print("DLL: Licence.dll   v" + lic.GetProperty("Component_FileVersion"));
        //print("DLL: flSigCOM.dll  v" +   sigCtl.GetProperty("Component_FileVersion"));
        //print("DLL: flSigCapt.dll v" + sigcapt.GetProperty("Component_FileVersion"));
        //print("Signing pad ready.");
        print("Press 'Sign' to capture a signature.");
    }
    catch(ex) {
        Exception("OnLoad() error: " + ex.message);
    }
});
