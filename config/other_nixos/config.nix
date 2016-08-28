{ 
  allowUnfree = true; 

  firefox = {
     enableGoogleTalkPlugin = true;
     enableAdobeFlash = true;
  };

  chromium = {
     enablePepperFlash = true; # Chromium's non-NSAPI alternative to Adobe Flash
     enablePepperPDF = true;
  };
}
